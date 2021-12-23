import 'package:chapter_1/counter_app/model/counter.dart';
import 'package:chapter_1/counter_app/widgets/counter_buttons.dart';
import 'package:chapter_1/counter_app/widgets/counter_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../mock_wrapper.dart';

void main() {
  group('Testing the CounterButtons widget', () {
    testWidgets('Making sure that the widget is rendered', (tester) async {
      await tester.pumpWidget(MockWrapper(
        child: CounterState(
          model: Counter(),
          child: const CounterButtons(),
        ),
      ));

      expect(find.byType(CounterButtons), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNWidgets(2));
      expect(find.text('-'), findsOneWidget);
      expect(find.text('+'), findsOneWidget);
    });

    testWidgets('Making sure that buttons can be tapped', (tester) async {
      final model = Counter();

      await tester.pumpWidget(MockWrapper(
        child: CounterState(
          model: model,
          child: const CounterButtons(),
        ),
      ));

      expect(model.counter, isZero);

      // Doing a +1
      await tester.tap(find.byKey(const Key('ElevatedButton-Increase')));
      await tester.pumpAndSettle();

      expect(model.counter, equals(1));

      // Doing a -1
      await tester.tap(find.byKey(const Key('ElevatedButton-Decrease')));
      await tester.pumpAndSettle();

      expect(model.counter, isZero);
    });

    testGoldens('CounterButtons - golden', (tester) async {
      final builder = GoldenBuilder.column()
        ..addScenario(
          'No history',
          SizedBox(
            width: 400,
            height: 400,
            child: CounterState(
              model: Counter(),
              child: const CounterButtons(),
            ),
          ),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(400, 460),
      );
      await screenMatchesGolden(tester, 'counter_buttons');
    });
  });
}
