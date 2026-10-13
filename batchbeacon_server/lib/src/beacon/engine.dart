import 'dart:math' as math;
import '../generated/protocol.dart';

/// Conservative rolling demand estimate; never a clinical prediction.
class ForecastEngine {
  static bool eligible(InventoryBatch batch, DateTime at) =>
      batch.qualityStatus == 'RELEASED' &&
      batch.storageStatus == 'VERIFIED' &&
      batch.expiryDate.isAfter(at);

  static ShortageForecast calculate({
    required int hospitalId,
    required int medicineId,
    required List<ConsumptionRecord> history,
    required List<InventoryBatch> batches,
    required List<InboundSupply> inbound,
    required HospitalPolicy policy,
    required DateTime now,
  }) {
    if (policy.safetyStockDays < 0 ||
        policy.forecastHorizonDays < 1 ||
        policy.forecastHorizonDays > 90) {
      throw ArgumentError('Invalid forecast policy.');
    }
    for (final b in batches) {
      if (b.quantityOnHand < 0 ||
          b.quantityReserved < 0 ||
          b.quantityReserved > b.quantityOnHand) {
        throw ArgumentError('Invalid stock input.');
      }
    }
    if (history.any((r) => r.quantityUsed < 0) ||
        inbound.any((r) => r.quantity < 0)) {
      throw ArgumentError('Negative consumption or inbound supply.');
    }
    final today = DateTime.utc(now.year, now.month, now.day);
    final daily = <DateTime, int>{};
    for (final r in history) {
      final day = DateTime.utc(r.date.year, r.date.month, r.date.day);
      final age = today.difference(day).inDays;
      if (age >= 1 && age <= 30) {
        daily.update(
          day,
          (q) => q + r.quantityUsed,
          ifAbsent: () => r.quantityUsed,
        );
      }
    }
    final recent = daily.entries
        .where((e) => today.difference(e.key).inDays <= 7)
        .toList();
    final avg30 = daily.isEmpty
        ? 0.0
        : daily.values.reduce((a, b) => a + b) / daily.length;
    final avg7 = recent.isEmpty
        ? avg30
        : recent.fold<int>(0, (sum, e) => sum + e.value) / recent.length;
    final demand = math.max(avg7, avg30);
    final usable = batches.where((b) => eligible(b, now)).toList();
    final available = usable.fold<int>(
      0,
      (s, b) => s + b.quantityOnHand - b.quantityReserved,
    );
    final horizon = policy.forecastHorizonDays;
    final end = today.add(Duration(days: horizon));
    // Count stock only if it remains eligible for the whole replenishment horizon.
    final durable = usable
        .where((b) => b.expiryDate.isAfter(end))
        .fold<int>(0, (s, b) => s + b.quantityOnHand - b.quantityReserved);
    final arrivals = inbound
        .where(
          (i) =>
              i.confirmationStatus == 'CONFIRMED' &&
              !i.expectedArrivalDate.isBefore(today) &&
              !i.expectedArrivalDate.isAfter(end),
        )
        .toList();
    final incoming = arrivals.fold<int>(0, (s, i) => s + i.quantity);
    var required =
        (demand * (horizon + policy.safetyStockDays) - durable - incoming)
            .ceil();
    required = math.max(0, required);
    DateTime? runout;
    // FEFO simulation catches early runout before confirmed future arrivals.
    final stock =
        usable
            .map(
              (b) => (
                expiry: b.expiryDate,
                quantity: (b.quantityOnHand - b.quantityReserved).toDouble(),
              ),
            )
            .toList()
          ..sort((a, b) => a.expiry.compareTo(b.expiry));
    if (demand > 0) {
      for (var day = 0; day < 90; day++) {
        final at = today.add(Duration(days: day));
        for (final i in arrivals.where(
          (i) =>
              DateTime.utc(
                i.expectedArrivalDate.year,
                i.expectedArrivalDate.month,
                i.expectedArrivalDate.day,
              ) ==
              at,
        )) {
          stock.add((
            expiry: today.add(const Duration(days: 365)),
            quantity: i.quantity.toDouble(),
          ));
        }
        stock.sort((a, b) => a.expiry.compareTo(b.expiry));
        var need = demand;
        for (var n = 0; n < stock.length; n++) {
          final s = stock[n];
          if (!s.expiry.isAfter(at)) {
            stock[n] = (expiry: s.expiry, quantity: 0);
            continue;
          }
          final used = math.min(need, s.quantity);
          stock[n] = (expiry: s.expiry, quantity: s.quantity - used);
          need -= used;
        }
        if (need > 0.0001) {
          runout = at;
          break;
        }
      }
      if (runout != null && !runout.isAfter(end)) {
        required = math.max(required, (demand * horizon - available).ceil());
      }
    }
    final cover = demand == 0 ? 999.0 : available / demand;
    return ShortageForecast(
      hospitalId: hospitalId,
      medicineId: medicineId,
      calculatedAt: now,
      averageDailyConsumption: demand,
      projectedRunoutDate: runout,
      daysOfCover: cover,
      requiredQuantity: daily.isEmpty ? 0 : math.max(0, required),
      riskLevel: daily.length < 7
          ? 'INSUFFICIENT_DATA'
          : demand == 0
          ? 'NO_DEMAND'
          : required <= 0
          ? 'LOW'
          : cover < 7
          ? 'CRITICAL'
          : 'WATCH',
      forecastMethod:
          'Estimate: max(observed 7-day mean, observed 30-day mean); ${daily.length}/30 observed days; FEFO runout; ${horizon}d horizon + ${policy.safetyStockDays}d safety.',
    );
  }

  static ({int maximum, int retained, String reason}) match({
    required InventoryBatch batch,
    required int exactMedicineId,
    required List<InventoryBatch> donorBatches,
    required ShortageForecast donorForecast,
    required HospitalPolicy sourcePolicy,
    required HospitalPolicy destinationPolicy,
    required Medicine medicine,
    required DateTime now,
  }) {
    final arrival = now.add(Duration(days: sourcePolicy.transitDays));
    final retained =
        (donorForecast.averageDailyConsumption *
                (sourcePolicy.forecastHorizonDays +
                    sourcePolicy.safetyStockDays))
            .ceil();
    String? rejection;
    if (batch.medicineId != exactMedicineId) {
      rejection =
          'Exact product identifier mismatch. No substitutions permitted.';
    } else if (batch.quantityOnHand < 0 ||
        batch.quantityReserved < 0 ||
        batch.quantityReserved > batch.quantityOnHand) {
      rejection = 'Invalid stock input.';
    } else if (batch.qualityStatus != 'RELEASED') {
      rejection = 'Quality hold: batch is not released.';
    } else if (batch.storageStatus != 'VERIFIED') {
      rejection = 'Storage condition is unverified; human review required.';
    } else if (!batch.expiryDate.isAfter(now)) {
      rejection = 'Batch expired.';
    } else if (!batch.expiryDate.isAfter(
      arrival.add(
        Duration(
          days: math.max(
            sourcePolicy.minimumRemainingShelfLifeDays,
            destinationPolicy.minimumRemainingShelfLifeDays,
          ),
        ),
      ),
    )) {
      rejection = 'Insufficient remaining shelf life at proposed arrival.';
    } else if (!sourcePolicy.permittedShareCategories.contains(
      medicine.storageCategory,
    )) {
      rejection = 'Storage category excluded by donor policy.';
    } else if (donorForecast.riskLevel == 'INSUFFICIENT_DATA') {
      rejection = 'Insufficient donor consumption history.';
    }
    if (rejection != null) {
      return (maximum: 0, retained: retained, reason: rejection);
    }
    final end = now.add(Duration(days: sourcePolicy.forecastHorizonDays));
    final durable = donorBatches
        .where((b) => b.medicineId == exactMedicineId && eligible(b, end))
        .fold<int>(0, (s, b) => s + b.quantityOnHand - b.quantityReserved);
    final maximum = math.max(
      0,
      math.min(
        batch.quantityOnHand - batch.quantityReserved,
        durable - retained,
      ),
    );
    return (
      maximum: maximum,
      retained: retained,
      reason: maximum == 0
          ? 'Donor protection: projected demand and safety stock retain $retained units; no eligible unreserved surplus.'
          : 'Exact SKU; released quality; verified storage; shelf life passed. Retain at least $retained units for donor demand and safety stock. Logistics, licensing and storage review still require human verification.',
    );
  }
}
