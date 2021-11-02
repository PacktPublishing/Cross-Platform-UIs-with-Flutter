import 'package:flutter/material.dart';

/// A wrapper of a [MaterialApp] to be used in widget tests.
class MockWrapper extends StatelessWidget {
  /// The child to be tested.
  final Widget child;

  /// This is useful when there's the need to make sure that a route is pushed
  /// or popped.
  final List<NavigatorObserver> navigatorObservers;

  /// The [child] to be tested.
  const MockWrapper({
    required this.child,
    Key? key,
    this.navigatorObservers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: navigatorObservers,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: child,
      ),
    );
  }
}