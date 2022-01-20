import 'dart:io';

import 'package:flutter/material.dart';
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
      home: const MaterialSettingsHomePage(),
    );
  }
}

class MaterialSettingsHomePage extends StatelessWidget {
  const MaterialSettingsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SettingsScope.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          MaterialFormSection(
            header: const Text('Time and place'),
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Language'),
                subtitle: Text("English (US)"),
                dense: true,
              ),
              SwitchListTile(
                title: const Text('Set time zone automatically'),
                contentPadding: EdgeInsets.zero,
                dense: true,
                value: controller.enableAutoTimeZone,
                onChanged: controller.updateEnableAutoTimeZone,
              ),
            ],
          ),
          MaterialFormSection(
            header: const Text('Look and feel'),
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Theme'),
                subtitle:
                    Text(_themeDisplayTextMap[controller.themeMode] ?? ''),
                dense: true,
                onTap: () async {
                  var themeMode = await showModalBottomSheet<
                          AdaptiveThemeMode?>(
                      context: context,
                      builder: (context) {
                        return Wrap(
                          children: [
                            ListTile(
                              title: const Text('System Theme'),
                              dense: true,
                              onTap: () {
                                Navigator.pop(
                                    context, AdaptiveThemeMode.system);
                              },
                            ),
                            ListTile(
                              title: const Text('Light Theme'),
                              dense: true,
                              onTap: () {
                                Navigator.pop(context, AdaptiveThemeMode.light);
                              },
                            ),
                            ListTile(
                              title: const Text('Dark Theme'),
                              dense: true,
                              onTap: () {
                                Navigator.pop(context, AdaptiveThemeMode.dark);
                              },
                            )
                          ],
                        );
                      });

                  if (themeMode != null) {
                    controller.updateThemeMode(themeMode);
                  }
                },
              ),
            ],
          ),
          MaterialFormSection(
            header: const Text('Security'),
            children: [
              SwitchListTile(
                title: const Text('Two-factor authentication'),
                contentPadding: EdgeInsets.zero,
                dense: true,
                value: controller.enableTwoFactorAuthentication,
                onChanged: controller.updateEnableTwoFactorAuthentication,
              ),
              SwitchListTile(
                title: const Text('Passcode'),
                contentPadding: EdgeInsets.zero,
                dense: true,
                value: controller.enablePasscode,
                onChanged: controller.updateEnablePasscode,
              ),
            ],
          ),
          MaterialFormSection(
            header: const Text('Notifications'),
            children: [
              SwitchListTile(
                title: const Text('Play sounds'),
                contentPadding: EdgeInsets.zero,
                dense: true,
                value: controller.enableSounds,
                onChanged: controller.updateEnableSounds,
              ),
              SwitchListTile(
                title: const Text('Haptic feedback'),
                contentPadding: EdgeInsets.zero,
                dense: true,
                value: controller.enableHapticFeedback,
                onChanged: controller.updateEnableHapticFeedback,
              ),
            ],
          ),
          MaterialFormSection(
            header: const Text('Support'),
            children: [
              SwitchListTile(
                title: const Text('Shake to send feedback'),
                contentPadding: EdgeInsets.zero,
                dense: true,
                value: controller.enableSendFeedback,
                onChanged: controller.updateEnableSendFeedback,
              ),
              ListTile(
                title: const Text('Legal notes'),
                contentPadding: EdgeInsets.zero,
                dense: true,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MaterialFormSection extends StatelessWidget {
  const MaterialFormSection({
    Key? key,
    this.header,
    required this.children,
  }) : super(key: key);

  final Widget? header;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    assert(children.isNotEmpty);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (header != null)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
                child: Container(
                  child: header,
                ),
              ),
            ),
          ...children,
        ],
      ),
    );
  }
}

const _themeDisplayTextMap = {
  AdaptiveThemeMode.system: 'System Theme',
  AdaptiveThemeMode.light: 'Light Theme',
  AdaptiveThemeMode.dark: 'Dark Theme',
};

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
