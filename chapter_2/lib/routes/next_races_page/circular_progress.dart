import 'dart:math';

import 'package:flutter/material.dart';

/// A circular progress indicator
class CircularProgressPainter extends CustomPainter {
  /// The progression status.
  final double progression;

  /// Creates a [CircularProgressPainter] painter.
  const CircularProgressPainter({
    required this.progression,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // The background rail
    final railPaint = Paint()
      ..color = Colors.grey.withAlpha(150)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    // The arc itself
    final arcPaint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    // Drawing the rail
    final center = size.width / 2;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(center, center),
        radius: center,
      ),
      -pi / 2,
      pi * 2,
      false,
      railPaint,
    );

    // Drawing the arc
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(center, center),
        radius: center,
      ),
      -pi / 2,
      pi * 2 * progression,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CircularProgressPainter oldDelegate) {
    return progression != oldDelegate.progression;
  }
}
