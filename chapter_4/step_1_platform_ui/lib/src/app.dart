import 'package:flutter/material.dart';

class SettingsApp extends StatelessWidget {
  const SettingsApp({
    Key? key,
    this.platform,
  }) : super(key: key);

  final TargetPlatform? platform;

  @override
  Widget build(BuildContext context) {
    final platform = this.platform ?? Theme.of(context).platform;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Platform: ${platform.name}'),
              if (platform == TargetPlatform.android)
                const Text('Hello Android'),
              if (platform == TargetPlatform.iOS) const Text('Hello iOS'),
            ],
          ),
        ),
      ),
    );
  }
}
