import 'dart:math' as math;

import 'package:chapter_2/routes/utils/collapsible/collapsible_state.dart';
import 'package:chapter_2/routes/utils/collapsible/primary_region.dart';
import 'package:chapter_2/routes/utils/collapsible/secondary_region.dart';
import 'package:flutter/material.dart';

/// This widget has a visible area, called **header** and another area, called
/// **content**, that appears or disappears with a slide down or up animation.
class Collapsible extends StatefulWidget {
  /// The `header` contains the visible content. This widget isn't collapsed and
  /// the user sees it immediately.
  final Widget header;

  /// The `content` is initially collapsed and thus the user cannot see this
  /// immediately. To show this widget, the user must tap the header to start
  /// the scale animation.
  final Widget content;

  /// The widget padding.
  ///
  /// By default, this is set to [EdgeInsets.zero].
  final EdgeInsets edgeInsets;

  /// The height between [header] and [content] when expanded.
  ///
  /// By default, this is set to `0`.
  final double heightBetweenRegions;

  /// When `true`, the widget is created with the [content] part visible.
  ///
  /// By default, this is set to `false`.
  final bool initializeOpened;

  /// Creates a [Collapsible] widget.
  const Collapsible({
    Key? key,
    required this.header,
    required this.content,
    this.edgeInsets = EdgeInsets.zero,
    this.heightBetweenRegions = 0.0,
    this.initializeOpened = false,
  }) : super(key: key);

  @override
  _CollapsibleState createState() => _CollapsibleState();
}

class _CollapsibleState extends State<Collapsible>
    with TickerProviderStateMixin {
  /// The animation controller to rotate the top-right button and grow the
  /// size of the primary region.
  late final controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
    value: widget.initializeOpened ? 1 : 0,
  );

  /// The rotation animation of the button.
  late final rotationAnimation = Tween<double>(
    begin: 0.0,
    end: math.pi,
  ).animate(controller);

  /// Up and down animation for the secondary region.
  late final slidingAnimation = CurvedAnimation(
    parent: controller,
    curve: Curves.ease,
  );

  /// Caching the two regions of the [Collapsible] widget.
  late List<Widget> regions = buildRegions();

  /// Builds the contents of the visible and hidden parts of the widget.
  List<Widget> buildRegions() {
    return [
      GestureDetector(
        onTap: toggleExpansion,
        behavior: HitTestBehavior.opaque,
        child: PrimaryRegion(
          animation: rotationAnimation,
          child: widget.header,
        ),
      ),
      SizeTransition(
        key: const Key('Collapsible-SizeTransition'),
        sizeFactor: controller,
        axisAlignment: 1.0,
        child: SecondaryRegion(
          heightBetweenRegions: widget.heightBetweenRegions,
          child: widget.content,
        ),
      ),
    ];
  }

  /// Open or closes the secondary region.
  void toggleExpansion() {
    final collapsibleState = CollapsibleState.of(context);

    collapsibleState.state.value = !collapsibleState.state.value;
  }

  @override
  void didUpdateWidget(covariant Collapsible oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.header != oldWidget.header ||
        widget.content != oldWidget.content) {
      regions = buildRegions();
    }
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: CollapsibleState.of(context).state,
      builder: (context, value, child) {
        if (!value) {
          controller.reverse();
        } else {
          controller.forward();
        }

        return child!;
      },
      child: Padding(
        padding: widget.edgeInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: regions,
        ),
      ),
    );
  }
}
