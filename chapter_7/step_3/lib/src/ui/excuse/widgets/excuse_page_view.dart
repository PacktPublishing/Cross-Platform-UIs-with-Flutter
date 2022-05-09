import 'package:animations/animations.dart';
import 'package:excuses_app/src/data/data.dart';
import 'package:flutter/material.dart';

import 'excuse_card.dart';

class ExcusePageView extends StatelessWidget {
  final List<Excuse> excuses;
  final int currentExcuse;

  const ExcusePageView({
    Key? key,
    this.excuses = const [],
    this.currentExcuse = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedExcuse = excuses[currentExcuse];

    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation, secondAnimation) {
        return FadeTransition(
          opacity: Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).animate(secondAnimation),
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 1.0,
              end: 0.0,
            ).animate(secondAnimation),
            child: SlideTransition(
              position: Tween<Offset>(
                end: Offset.zero,
                begin: const Offset(1.5, 0.0),
              ).animate(animation),
              child: child,
            ),
          ),
        );
      },
      child: ExcuseCard(
        key: ValueKey(selectedExcuse.id),
        excuse: selectedExcuse,
      ),
    );
  }
}
