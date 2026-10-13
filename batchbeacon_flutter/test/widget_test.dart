import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:batchbeacon_client/batchbeacon_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:batchbeacon_flutter/client.dart';
import 'package:batchbeacon_flutter/main.dart';

void main() {
  testWidgets('admin entry opens email and password sign-in directly', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1440, 1100);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const BatchBeaconApp());
    await tester.pumpAndSettle();
    final entry = find.text('Admin / institution sign-in');
    await tester.ensureVisible(entry);
    await tester.tap(entry);
    await tester.pumpAndSettle();
    expect(find.text('Email address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Sign in'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(find.text('Password'), findsNothing);
    expect(tester.takeException(), isNull);
  });
  testWidgets('mobile admin login fits without overflow', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const BatchBeaconApp());
    await tester.pumpAndSettle();
    final entry = find.text('Admin / institution sign-in');
    await tester.ensureVisible(entry);
    await tester.tap(entry);
    await tester.pumpAndSettle();
    expect(find.text('Password'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  setUpAll(() {
    client = Client('http://localhost:8080/')
      ..authSessionManager = FlutterAuthSessionManager();
  });
  testWidgets(
    'demo exposes fictional disclosure and three real account choices',
    (tester) async {
      tester.view.physicalSize = const Size(1440, 1100);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const BatchBeaconApp());
      await tester.pumpAndSettle();
      expect(find.text('BatchBeacon'), findsOneWidget);
      expect(
        find.textContaining('Synthetic demonstration data'),
        findsOneWidget,
      );
      expect(find.text('Enter hospital A →'), findsOneWidget);
      expect(find.text('Enter hospital B →'), findsOneWidget);
      expect(find.text('Enter hospital C →'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets('role choice is available before authenticating', (tester) async {
    tester.view.physicalSize = const Size(1440, 1100);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const BatchBeaconApp());
    await tester.pumpAndSettle();
    await tester.tap(find.text('Inventory manager'));
    await tester.pumpAndSettle();
    final segmented = tester.widget<SegmentedButton<String>>(
      find.byType(SegmentedButton<String>),
    );
    expect(segmented.selected, {'INVENTORY_MANAGER'});
  });
  testWidgets('mobile login has no layout exceptions', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const BatchBeaconApp());
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
