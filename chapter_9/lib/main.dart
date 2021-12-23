import 'package:chapter_1/counter_app/counter_app_body.dart';
import 'package:flutter/material.dart';

void main() {
  // Running the app
  runApp(
    const EnhancedCounterApp(),
  );
}

/// The root widget of the app.
class EnhancedCounterApp extends StatelessWidget {
  /// Creates an [EnhancedCounterApp] instance.
  const EnhancedCounterApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterAppBody(),

      // Hiding the debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}
