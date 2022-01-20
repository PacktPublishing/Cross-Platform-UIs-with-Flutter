import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'settings_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late AdaptiveThemeMode _themeMode;

  // Allow Widgets to read the user's preferred ThemeMode.
  AdaptiveThemeMode get themeMode => _themeMode;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  bool enableAutoTimeZone = false;

  Future<void> updateEnableAutoTimeZone(bool updated) async {
    enableAutoTimeZone = updated;
    notifyListeners();
  }

  bool enableTwoFactorAuthentication = false;

  Future<void> updateEnableTwoFactorAuthentication(bool updated) async {
    enableTwoFactorAuthentication = updated;
    notifyListeners();
  }

  bool enablePasscode = false;

  Future<void> updateEnablePasscode(bool updated) async {
    enablePasscode = updated;
    notifyListeners();
  }

  bool enableSounds = false;

  Future<void> updateEnableSounds(bool updated) async {
    enableSounds = updated;
    notifyListeners();
  }

  bool enableHapticFeedback = false;

  Future<void> updateEnableHapticFeedback(bool updated) async {
    enableHapticFeedback = updated;
    notifyListeners();
  }

  bool enableSendFeedback = false;

  Future<void> updateEnableSendFeedback(bool updated) async {
    enableSendFeedback = updated;
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(AdaptiveThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Dot not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new theme mode in memory
    _themeMode = newThemeMode;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateThemeMode(newThemeMode);
  }
}
