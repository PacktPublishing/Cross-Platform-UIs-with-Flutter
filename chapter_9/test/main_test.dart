import 'package:chapter_1/counter_app/counter_app_body.dart';
import 'package:chapter_1/main.dart' as app_main;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing the root widget', () {
    testWidgets("Making sure that 'main()' doesn't throw", (tester) async {
      var throws = false;

      try {
        app_main.main();
      } catch (_) {
        throws = true;
      }

      expect(throws, isFalse);
    });

    testWidgets('Making sure that the root widget is rendered', (tester) async {
      await tester.pumpWidget(const app_main.EnhancedCounterApp());

      expect(find.byType(CounterAppBody), findsOneWidget);
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
