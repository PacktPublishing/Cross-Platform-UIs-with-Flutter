import 'package:flutter/material.dart';
import 'package:settings/src/cupertino/cupertino_settings_app.dart';
import 'package:settings/src/material/material_settings_app.dart';

class SettingsApp extends StatelessWidget {
  const SettingsApp({
    Key? key,
    this.platform,
  }) : super(key: key);

  final TargetPlatform? platform;

  @override
  Widget build(BuildContext context) {
    final platform = this.platform ?? Theme.of(context).platform;

    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return const MaterialSettingsApp();

      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      default:
        return const MaterialSettingsApp();
    }
  }
}
