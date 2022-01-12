import 'package:flutter/cupertino.dart';
import 'package:settings/src/settings/settings_scope.dart';
import 'package:settings/src/settings/settings_service.dart';

class CupertinoSettingsView extends StatelessWidget {
  const CupertinoSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: SettingsView(),
      ),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsController = SettingsScope.of(context);
    final theme = CupertinoTheme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          CupertinoFormSection(
            header: const Text('Time and place'),
            children: [
              CupertinoFormRow(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "English (US)",
                      style: theme.textTheme.textStyle.copyWith(
                        color: theme.textTheme.textStyle.color!.withOpacity(.5),
                      ),
                    ),
                    const Icon(CupertinoIcons.chevron_right),
                  ],
                ),
                prefix: const Text("Language"),
              ),
              CupertinoFormRow(
                child: CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                ),
                prefix: const Text("Set time zone automatically"),
              ),
            ],
          ),
          CupertinoFormSection(
            header: const Text("Look and feel"),
            children: [
              GestureDetector(
                onTap: () async {
                  final themeMode = await showCupertinoModalPopup<
                          AdaptiveThemeMode?>(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          title: const Text('Choose app theme'),
                          actions: [
                            CupertinoActionSheetAction(
                              child: const Text('System Theme'),
                              onPressed: () {
                                Navigator.pop(
                                    context, AdaptiveThemeMode.system);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('Light Theme'),
                              onPressed: () {
                                Navigator.pop(context, AdaptiveThemeMode.light);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('Dark Theme'),
                              onPressed: () {
                                Navigator.pop(context, AdaptiveThemeMode.dark);
                              },
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      });

                  if (themeMode != null) {
                    settingsController.updateThemeMode(themeMode);
                  }
                },
                child: CupertinoFormRow(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        settingsController.themeMode.name.capitalize,
                        style: theme.textTheme.textStyle.copyWith(
                          color:
                              theme.textTheme.textStyle.color!.withOpacity(.5),
                        ),
                      ),
                      const Icon(CupertinoIcons.chevron_right),
                    ],
                  ),
                  prefix: const Text("Theme"),
                ),
              ),
            ],
          ),
          CupertinoFormSection(
            header: const Text("Security"),
            children: [
              CupertinoFormRow(
                child: CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                ),
                prefix: const Text("Two-factor authentication"),
              ),
              CupertinoFormRow(
                child: CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                ),
                prefix: const Text("Passcode"),
              ),
            ],
          ),
          CupertinoFormSection(
            header: const Text("Notifications"),
            children: [
              CupertinoFormRow(
                child: CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                ),
                prefix: const Text("Play sounds"),
              ),
              CupertinoFormRow(
                child: CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                ),
                prefix: const Text("Haptic feedback"),
              ),
            ],
          ),
          CupertinoFormSection(
            header: const Text("Support"),
            children: [
              CupertinoFormRow(
                child: CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                ),
                prefix: const Text("Shake to send feedback"),
              ),
              CupertinoFormRow(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(CupertinoIcons.chevron_right),
                  ],
                ),
                prefix: const Text("Legal notes"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension StringEnhancement on String {
  String get capitalize {
    if (isEmpty) {
      return this;
    }

    return this[0].toUpperCase() + substring(1);
  }
}
