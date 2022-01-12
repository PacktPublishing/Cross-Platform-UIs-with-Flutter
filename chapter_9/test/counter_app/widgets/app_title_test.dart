import 'package:chapter_1/counter_app/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../mock_wrapper.dart';

void main() {
  group('Testing the AppTitle widget', () {
    testWidgets('Making sure that the widget is rendered', (tester) async {
      await tester.pumpWidget(const MockWrapper(
        child: AppTitle(),
      ));

      expect(find.byType(AppTitle), findsOneWidget);
      expect(find.text('Enhanced Counter app!'), findsOneWidget);
      expect(find.byType(Icon), findsNWidgets(2));
    });

    testGoldens('AppTitle - golden', (tester) async {
      final builder = GoldenBuilder.column()
        ..addScenario(
          'AppTitle widget',
          const SizedBox(
            width: 300,
            height: 60,
            child: MockWrapper(
              child: AppTitle(),
            ),
          ),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(300, 120),
      );
      await screenMatchesGolden(tester, 'app_title_widget');
    });
  });
}
