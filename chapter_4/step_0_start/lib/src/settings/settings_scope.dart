import 'package:flutter/widgets.dart';
import 'settings_controller.dart';

class SettingsScope extends InheritedNotifier<SettingsController> {
  const SettingsScope({
    Key? key,
    SettingsController? notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static SettingsController of(BuildContext context) {
    final SettingsScope? result =
        context.dependOnInheritedWidgetOfExactType<SettingsScope>();

    assert(result != null, 'No SettingsScope found in context');
    assert(result!.notifier != null, 'No SettingsScope found in context');

    return result!.notifier!;
  }
}
