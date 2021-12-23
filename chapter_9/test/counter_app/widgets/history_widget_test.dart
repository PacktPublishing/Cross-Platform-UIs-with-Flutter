import 'package:chapter_1/counter_app/widgets/app_title.dart';
import 'package:chapter_1/counter_app/widgets/history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_wrapper.dart';

void main() {
  group('Testing the HistoryWidget widget', () {
    testWidgets('Making sure that the widget is rendered', (tester) async {
      await tester.pumpWidget(const MockWrapper(
        child: HistoryWidget(
          increasesHistory: [],
        ),
      ));

      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Increases counter'), findsOneWidget);

      // Golden
      await expectLater(
        find.byType(HistoryWidget),
        matchesGoldenFile('history_widget_empty.png'),
      );
    });

    testWidgets('Making sure that values are displayed', (tester) async {
      final data = <int>[10, 20, 30];

      await tester.pumpWidget(MockWrapper(
        child: HistoryWidget(
          increasesHistory: data,
        ),
      ));

      // Golden
      await expectLater(
        find.byType(HistoryWidget),
        matchesGoldenFile('history_widget_data.png'),
      );

      expect(find.text('10'), findsOneWidget);
      expect(find.text('20'), findsOneWidget);
      expect(find.text('30'), findsOneWidget);
    });
  });
}
