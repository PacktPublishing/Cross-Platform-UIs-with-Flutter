import 'package:chapter_1/counter_app/model/counter.dart';
import 'package:flutter/material.dart';

/// This [InheritedWidget] holds a [Counter] object to store the state of the
/// counter app.
class CounterState extends InheritedWidget {
  /// The state of the counter app.
  final Counter model;

  /// Creates a [CounterState] widget.
  const CounterState({
    Key? key,
    required Widget child,
    required this.model,
  }) : super(key: key, child: child);

  /// Looks for the closest [CounterState] instance up in the widget
  /// tree and returns it. Throws if no matches are found.
  static CounterState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterState>()!;
  }

  @override
  bool updateShouldNotify(covariant CounterState oldWidget) {
    return model.counter != oldWidget.model.counter;
  }
}
