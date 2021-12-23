import 'package:chapter_1/counter_app/counter_app_body.dart';
import 'package:chapter_1/counter_app/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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

      // Golden
      await expectLater(
        find.byType(AppTitle),
        matchesGoldenFile('app_title.png'),
      );
    });
  });
}
