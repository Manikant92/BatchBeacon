import 'package:test/test.dart';
import 'package:batchbeacon_server/src/beacon/engine.dart';
import 'package:batchbeacon_server/src/generated/protocol.dart';

final now = DateTime.utc(2026, 10, 12);
HospitalPolicy policy() => HospitalPolicy(
  hospitalId: 1,
  safetyStockDays: 7,
  minimumRemainingShelfLifeDays: 30,
  permittedShareCategories: ['AMBIENT_DEMO'],
  transferApprovalRequired: true,
  transitDays: 1,
  forecastHorizonDays: 14,
);
InventoryBatch batch({
  int q = 35,
  int reserved = 0,
  int expiry = 180,
  String quality = 'RELEASED',
  String storage = 'VERIFIED',
  int mid = 1,
}) => InventoryBatch(
  id: 1,
  hospitalId: 1,
  medicineId: mid,
  batchNumber: 'TEST',
  quantityOnHand: q,
  quantityReserved: reserved,
  expiryDate: now.add(Duration(days: expiry)),
  storageStatus: storage,
  qualityStatus: quality,
  lastUpdatedAt: now,
  version: 1,
);
List<ConsumptionRecord> history(int daily) => List.generate(
  30,
  (i) => ConsumptionRecord(
    hospitalId: 1,
    medicineId: 1,
    date: now.subtract(Duration(days: i + 1)),
    quantityUsed: daily,
  ),
);
ShortageForecast forecast({
  int demand = 10,
  List<InventoryBatch>? batches,
  List<ConsumptionRecord>? records,
  List<InboundSupply> inbound = const [],
}) => ForecastEngine.calculate(
  hospitalId: 1,
  medicineId: 1,
  history: records ?? history(demand),
  batches: batches ?? [batch()],
  inbound: inbound,
  policy: policy(),
  now: now,
);
Medicine medicine() => Medicine(
  id: 1,
  canonicalProductCode: 'DEMO',
  displayName: 'Fictional',
  manufacturer: 'Fictional',
  strength: '10 mg',
  dosageForm: 'Tablet',
  packSize: 1,
  storageCategory: 'AMBIENT_DEMO',
  demoRegulatoryClass: 'SYNTHETIC',
);
({int maximum, int retained, String reason}) match(
  InventoryBatch b, {
  List<InventoryBatch>? all,
  int demand = 4,
}) => ForecastEngine.match(
  batch: b,
  exactMedicineId: 1,
  donorBatches: all ?? [b],
  donorForecast: forecast(demand: demand, batches: all ?? [b]),
  sourcePolicy: policy(),
  destinationPolicy: policy(),
  medicine: medicine(),
  now: now,
);
void main() {
  group('Forecast estimates', () {
    test('normal demand and safety reserve', () {
      final f = forecast();
      expect(f.averageDailyConsumption, 10);
      expect(f.daysOfCover, 3.5);
      expect(f.requiredQuantity, 175);
      expect(f.riskLevel, 'CRITICAL');
      expect(f.projectedRunoutDate, now.add(const Duration(days: 3)));
    });
    test('zero demand', () {
      final f = forecast(demand: 0);
      expect(f.requiredQuantity, 0);
      expect(f.projectedRunoutDate, isNull);
      expect(f.riskLevel, 'NO_DEMAND');
    });
    test('missing history is not a validated shortage', () {
      final f = forecast(records: []);
      expect(f.requiredQuantity, 0);
      expect(f.riskLevel, 'INSUFFICIENT_DATA');
    });
    test('insufficient samples', () {
      expect(
        forecast(records: history(10).take(3).toList()).riskLevel,
        'INSUFFICIENT_DATA',
      );
    });
    test('negative stock rejected', () {
      expect(() => forecast(batches: [batch(q: -1)]), throwsArgumentError);
    });
    test('over-reserved stock rejected', () {
      expect(
        () => forecast(batches: [batch(q: 5, reserved: 6)]),
        throwsArgumentError,
      );
    });
    test('negative history rejected', () {
      expect(() => forecast(records: history(-1)), throwsArgumentError);
    });
    test('sudden spike conservatively uses seven day mean', () {
      final h = history(2);
      for (final r in h.take(7)) {
        r.quantityUsed = 20;
      }
      expect(forecast(records: h).averageDailyConsumption, 20);
    });
    test('unconfirmed inbound excluded', () {
      final inbound = InboundSupply(
        hospitalId: 1,
        medicineId: 1,
        quantity: 1000,
        expectedArrivalDate: now.add(const Duration(days: 2)),
        confirmationStatus: 'UNCONFIRMED',
      );
      expect(forecast(inbound: [inbound]).requiredQuantity, 175);
    });
    test('late confirmed inbound cannot conceal early runout', () {
      final inbound = InboundSupply(
        hospitalId: 1,
        medicineId: 1,
        quantity: 1000,
        expectedArrivalDate: now.add(const Duration(days: 10)),
        confirmationStatus: 'CONFIRMED',
      );
      expect(forecast(inbound: [inbound]).requiredQuantity, greaterThan(0));
    });
    test('expired inventory excluded', () {
      expect(forecast(batches: [batch(q: 999, expiry: -1)]).daysOfCover, 0);
    });
  });
  group('Exact-product donor protection', () {
    test('bounded eligible stock', () {
      expect(match(batch(q: 500)).maximum, 416);
      expect(match(batch(q: 500)).retained, 84);
    });
    test('product mismatch', () {
      expect(match(batch(q: 500, mid: 2)).reason, contains('mismatch'));
    });
    test('expired batch rejection', () {
      expect(match(batch(q: 500, expiry: -1)).maximum, 0);
    });
    test('quality hold rejection', () {
      expect(
        match(batch(q: 500, quality: 'QUARANTINED')).reason,
        contains('Quality hold'),
      );
    });
    test('unknown storage rejection', () {
      expect(match(batch(q: 500, storage: 'UNKNOWN')).maximum, 0);
    });
    test('arrival shelf life rejection', () {
      expect(match(batch(q: 500, expiry: 5)).reason, contains('shelf life'));
    });
    test('Riverside donor safety protection', () {
      final r = match(batch(q: 200), demand: 12);
      expect(r.maximum, 0);
      expect(r.retained, 252);
    });
    test('existing reservation subtraction', () {
      expect(match(batch(q: 500, reserved: 200)).maximum, 216);
    });
    test('insufficient stock', () {
      expect(match(batch(q: 20)).maximum, 0);
    });
  });
}
