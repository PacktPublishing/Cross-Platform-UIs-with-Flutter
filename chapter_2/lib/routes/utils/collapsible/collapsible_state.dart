import 'package:chapter_2/routes/utils/collapsible/collapsible.dart';
import 'package:flutter/material.dart';

/// Handles the state of a [Collapsible] widget.
class CollapsibleState extends InheritedWidget {
  /// The state of the [Collapsible] widget.
  final ValueNotifier<bool> state;

  /// Creates a [CollapsibleState] inherited widget.
  const CollapsibleState({
    Key? key,
    required this.state,
    required Widget child,
  }) : super(key: key, child: child);

  /// Conventional static access of the instance above the tree.
  static CollapsibleState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CollapsibleState>()!;
  }

  @override
  bool updateShouldNotify(CollapsibleState oldWidget) =>
      state != oldWidget.state;
}
