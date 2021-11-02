import 'package:flutter/material.dart';

/// A circular container with a number centered inside.
class NumberIndicator extends StatelessWidget {
  /// The number at the center of the circle.
  final int number;

  /// Creates a [NumberIndicator] widget.
  const NumberIndicator({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueAccent,
      ),
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Text(
          '$number',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
