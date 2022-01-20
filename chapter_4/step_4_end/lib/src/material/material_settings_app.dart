import 'package:flutter/material.dart';
import 'package:settings/src/material/material_settings_view.dart';
import 'package:settings/src/settings/settings_scope.dart';
import 'package:settings/src/settings/settings_service.dart';

class MaterialSettingsApp extends StatelessWidget {
  const MaterialSettingsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsController = SettingsScope.of(context);

    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: settingsController.themeMode.materialThemeMode,
      home: const MaterialSettingsView(),
    );
  }
}

extension ThemeModeExtension on AdaptiveThemeMode {
  ThemeMode get materialThemeMode {
    switch (this) {
      case AdaptiveThemeMode.dark:
        return ThemeMode.dark;
      case AdaptiveThemeMode.light:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
