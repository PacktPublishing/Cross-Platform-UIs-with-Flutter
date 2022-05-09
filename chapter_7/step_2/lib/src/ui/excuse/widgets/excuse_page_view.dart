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
    var selectedExcuse = excuses[currentExcuse];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: ExcuseCard(
        key: ValueKey(selectedExcuse.id),
        excuse: selectedExcuse,
      ),
    );
  }
}
