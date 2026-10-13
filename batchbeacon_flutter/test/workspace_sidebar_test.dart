import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:batchbeacon_flutter/workspace_sidebar.dart';

void main() {
  for (final size in [
    const Size(240, 300),
    const Size(240, 480),
    const Size(304, 500),
  ]) {
    testWidgets('navigation scrolls and sign-out stays reachable at $size', (
      tester,
    ) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      var signedOut = false;
      int? destination;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WorkspaceSidebar(
              brand: const Text(
                'BatchBeacon',
                style: TextStyle(color: Colors.white),
              ),
              selectedIndex: 0,
              onSelected: (n) => destination = n,
              onSignOut: () => signedOut = true,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Demo Guide'), findsNothing);
      expect(
        find.byKey(const Key('workspace-sign-out')).hitTestable(),
        findsOneWidget,
      );
      await tester.scrollUntilVisible(
        find.text('Settings'),
        120,
        scrollable: find.byType(Scrollable),
      );
      await tester.tap(find.text('Settings'));
      expect(destination, 6);
      expect(
        find.byKey(const Key('workspace-sign-out')).hitTestable(),
        findsOneWidget,
      );
      await tester.tap(find.byKey(const Key('workspace-sign-out')));
      expect(signedOut, isTrue);
      expect(tester.takeException(), isNull);
    });
  }
}
