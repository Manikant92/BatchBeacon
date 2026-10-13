import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import 'beacon_service.dart';

/// Persisted Serverpod scheduled work. Expired reservations release exactly once.
class ReservationFutureCall extends FutureCall {
  Future<void> expireReservation(Session session, int proposalId) async {
    final changed = await session.db.transaction((tx) async {
      await BeaconService.lock(session, tx);
      final p = await RescueProposal.db.findById(
        session,
        proposalId,
        transaction: tx,
      );
      if (p == null || p.status != 'RESERVED') return null;
      final r = await StockReservation.db.findFirstRow(
        session,
        where: (t) => t.proposalId.equals(proposalId),
        transaction: tx,
      );
      if (r == null ||
          r.status != 'ACTIVE' ||
          r.expiresAt.isAfter(DateTime.now().toUtc())) {
        return null;
      }
      final actor =
          await HospitalUser.db.findFirstRow(
            session,
            where: (t) =>
                t.hospitalId.equals(p.destinationHospitalId) &
                t.role.equals('PLATFORM_ADMINISTRATOR'),
            transaction: tx,
          ) ??
          await HospitalUser.db.findFirstRow(
            session,
            where: (t) =>
                t.hospitalId.equals(p.destinationHospitalId) &
                t.role.equals('PHARMACIST'),
            transaction: tx,
          );
      if (actor == null) {
        throw StateError('No system audit attribution available.');
      }
      await BeaconService.release(session, p, tx, 'EXPIRED');
      p.status = 'EXPIRED';
      await RescueProposal.db.updateRow(session, p, transaction: tx);
      await BeaconService.event(
        session,
        p,
        actor,
        'RESERVED',
        tx,
        note: 'SYSTEM: scheduled reservation timeout; no physical movement.',
      );
      return p;
    });
    if (changed != null) {
      await BeaconService.publish(session, [
        changed.sourceHospitalId,
        changed.destinationHospitalId,
      ], 'RESERVATION_EXPIRED');
    }
  }
}
