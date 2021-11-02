import 'package:flutter/material.dart';

/// The primary region of a [Collapsible] widget.
///
/// This widgets wraps the header of the [Collapsible].
class PrimaryRegion extends StatelessWidget {
  /// Controls the button rotation on the left.
  final Animation<double> animation;

  /// The child widget to be inserted in the header.
  final Widget child;

  /// Creates a [PrimaryRegion] widget.
  const PrimaryRegion({
    Key? key,
    required this.animation,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // The body
          Expanded(
            child: child,
          ),

          // The rotation animation of the button
          AnimatedBuilder(
            key: const Key('PrimaryRegion-AnimatedBuilder'),
            animation: animation,
            builder: (context, child) => Transform.rotate(
              angle: animation.value,
              child: child,
            ),
            child: const Icon(Icons.arrow_downward),
          ),
        ],
      ),
    );
  }
}
