import 'package:flutter/material.dart';

/// Displays a country flag asset
class CountryFlag extends StatelessWidget {
  /// The images border radius.
  final double radius;

  /// The country flag identifier (2 chars)
  final String countryCode;

  /// The width of the image.
  final double? width;

  /// Creates a [CountryFlag] widget.
  const CountryFlag({
    Key? key,
    required this.countryCode,
    this.radius = 0,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        'assets/flags/$countryCode.png',
        width: width,
      ),
    );
  }
}
