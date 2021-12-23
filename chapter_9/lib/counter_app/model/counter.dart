import 'dart:collection';

import 'package:flutter/material.dart';

/// The state of the counter in the app.
class Counter with ChangeNotifier {
  int _counter;
  List<int> _history;

  /// Initializes the counter to 0.
  Counter()
      : _counter = 0,
        _history = [];

  /// The current counter state.
  int get counter => _counter;

  /// The increases history.
  List<int> get history => UnmodifiableListView<int>(_history);

  /// Increases the counter by 1.
  void increase() {
    _counter++;
    _history = List<int>.from(_history)..add(_counter);
    notifyListeners();
  }

  /// Decreases the counter by 1.
  void decrease() {
    _counter--;
    notifyListeners();
  }
}
