import 'package:chapter_1/counter_app/model/counter.dart';
import 'package:chapter_1/counter_app/widgets/counter_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_wrapper.dart';

void main() {
  group('Testing the CounterState inherited widget', () {
    test('Make sure that object comparison works as expected', () {
      final state = CounterState(
        model: Counter(),
        child: const SizedBox.shrink(),
      );

      expect(
        state.updateShouldNotify(
          CounterState(
            model: Counter(),
            child: const SizedBox.shrink(),
          ),
        ),
        isFalse,
      );

      expect(
        state.updateShouldNotify(
          CounterState(
            model: Counter()..increase(),
            child: const SizedBox.shrink(),
          ),
        ),
        isTrue,
      );
    });

    testWidgets('Making sure that the widget is rendered', (tester) async {
      await tester.pumpWidget(MockWrapper(
        child: CounterState(
          model: Counter(),
          child: const SizedBox(
            key: Key('SizedBox-key'),
          ),
        ),
      ));

      expect(find.byKey(const Key('SizedBox-key')), findsOneWidget);
      expect(find.byType(CounterState), findsOneWidget);
    });
  });
}
