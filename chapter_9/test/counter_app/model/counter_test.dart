import 'package:chapter_1/counter_app/model/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing the Counter class', () {
    test('Making sure that the class is correctly initialized', () {
      final counter = Counter();

      expect(counter.history.length, isZero);
      expect(counter.counter, isZero);
    });

    test('Making sure that values can be increased and decreased', () {
      final counter = Counter();

      // Increase
      counter
        ..increase()
        ..increase();

      expect(counter.history, orderedEquals(<int>[1, 2]));
      expect(counter.counter, equals(2));

      // Decrease
      counter.decrease();

      expect(counter.history, orderedEquals(<int>[1, 2]));
      expect(counter.counter, equals(1));
    });
  });
}
