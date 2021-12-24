import 'package:flutter/material.dart';

/// A wrapper of a [MaterialApp] to be used in widget tests.
class MockWrapper extends StatelessWidget {
  /// The child to be tested.
  final Widget child;

  /// The [child] to be tested.
  const MockWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: child,
      ),
    );
  }
}
