import 'package:chapter_1/counter_app/widgets/counter_inherited_widget.dart';
import 'package:flutter/material.dart';

/// This widget contains the buttons to increase and decrease the button at
/// the center.
class CounterButtons extends StatelessWidget {
  /// Creates a [CounterButtons] widget.
  const CounterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterReference = CounterState.of(context).model;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          key: const Key('ElevatedButton-Decrease'),
          onPressed: counterReference.decrease,
          child: const Text('-'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 50,
          ),
          child: AnimatedBuilder(
            animation: counterReference,
            builder: (context, _) {
              return Text(
                '${counterReference.counter}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          key: const Key('ElevatedButton-Increase'),
          onPressed: counterReference.increase,
          child: const Text('+'),
        ),
      ],
    );
  }
}
