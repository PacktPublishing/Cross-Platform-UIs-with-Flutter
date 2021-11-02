import 'package:chapter_1/counter_app/widgets/app_title.dart';
import 'package:chapter_1/counter_app/widgets/history_widget.dart';
import 'package:flutter/material.dart';

/// The contents of the counter app.
class CounterAppBody extends StatefulWidget {
  /// Creates a [CounterAppBody] widget.
  const CounterAppBody({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterAppBody> createState() => _CounterAppBodyState();
}

class _CounterAppBodyState extends State<CounterAppBody> {
  /// The current status of the counter.
  int counter = 0;

  /// Keeps track of the counter status when '+1' is pressed.
  List<int> increaseHistory = [];

  /// Increases the counter by 1.
  void increase() {
    setState(() {
      counter++;
      increaseHistory = List<int>.from(increaseHistory)
        ..add(counter);
    });
  }

  /// Decreases the counter by 1.
  void decrease() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // The top title
            const AppTitle(),

            // The counter
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  key: const Key('ElevatedButton-Decrease'),
                  onPressed: decrease,
                  child: const Text('-'),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 50,
                  ),
                  child: Text('$counter',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),

                ElevatedButton(
                  key: const Key('ElevatedButton-Increase'),
                  onPressed: increase,
                  child: const Text('+'),
                ),
              ],
            ),

            // The history
            HistoryWidget(
              increasesHistory: increaseHistory,
            ),
          ],
        ),
      ),
    );
  }
}