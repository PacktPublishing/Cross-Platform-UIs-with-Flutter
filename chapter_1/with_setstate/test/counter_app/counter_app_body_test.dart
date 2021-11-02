import 'package:chapter_1/counter_app/counter_app_body.dart';
import 'package:chapter_1/counter_app/widgets/app_title.dart';
import 'package:chapter_1/counter_app/widgets/history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_wrapper.dart';

void main() {
  group('Testing the CounterAppBody widget', () {
    testWidgets('Making sure that the widget is rendered', (tester) async {
      await tester.pumpWidget(const MockWrapper(
        child: CounterAppBody(),
      ));

      expect(find.byType(CounterAppBody), findsOneWidget);
      expect(find.byType(AppTitle), findsOneWidget);
      expect(find.byType(HistoryWidget), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNWidgets(2));
    });

    testWidgets('Making sure that the counter can be updated', (tester) async {
      await tester.pumpWidget(const MockWrapper(
        child: CounterAppBody(),
      ));

      final decreaseKey = find.byKey(const Key('ElevatedButton-Decrease'));
      final increaseKey = find.byKey(const Key('ElevatedButton-Increase'));

      // 0 is the default counter value
      expect(find.text('0'), findsOneWidget);
      await expectLater(find.byType(AppTitle), matchesGoldenFile('counter_initial.png'),);

      // Increasing by 2
      await tester.tap(increaseKey);
      await tester.pumpAndSettle();

      // Finds the counter text and the entry in the history list
      expect(find.text('1'), findsNWidgets(2));
      await expectLater(find.byType(AppTitle), matchesGoldenFile('counter_increased.png'),);

      // Decreasing by 2
      await tester.tap(decreaseKey);
      await tester.tap(decreaseKey);
      await tester.pumpAndSettle();

      // Only the counter has negative values, the history doesn't
      expect(find.text('-1'), findsOneWidget);
      await expectLater(find.byType(AppTitle), matchesGoldenFile('counter_decreased.png'),);
    });
  });
}