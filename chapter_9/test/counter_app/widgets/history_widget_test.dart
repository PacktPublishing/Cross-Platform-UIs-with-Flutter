import 'package:chapter_1/counter_app/model/counter.dart';
import 'package:chapter_1/counter_app/widgets/counter_inherited_widget.dart';
import 'package:chapter_1/counter_app/widgets/history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_wrapper.dart';

void main() {
  group('Testing the HistoryWidget widget', () {
    testWidgets('Making sure that the widget is rendered', (tester) async {
      await tester.pumpWidget(MockWrapper(
        child: CounterState(
          model: Counter(),
          child: const HistoryWidget(),
        ),
      ));

      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Increases counter'), findsOneWidget);
    });

    testWidgets('Making sure that values are displayed', (tester) async {
      final model = Counter();

      await tester.pumpWidget(MockWrapper(
        child: CounterState(
          model: model,
          child: const HistoryWidget(),
        ),
      ));

      expect(find.text('1'), findsNothing);
      expect(find.text('2'), findsNothing);
      expect(find.text('3'), findsNothing);

      // Adding values
      model
        ..increase()
        ..increase()
        ..increase();

      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
    });
  });
}
