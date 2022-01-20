import 'package:flutter/cupertino.dart';
import 'package:settings/src/settings/settings_scope.dart';
import 'package:settings/src/settings/settings_service.dart';

import 'cupertino_settings_view.dart';

class CupertinoSettingsApp extends StatelessWidget {
  const CupertinoSettingsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsController = SettingsScope.of(context);
    final brightness = settingsController.themeMode == AdaptiveThemeMode.dark
        ? Brightness.dark
        : Brightness.light;

    return CupertinoApp(
      theme: CupertinoThemeData(
        brightness: brightness,
      ),
      home: const CupertinoSettingsView(),
    );
  }
}
