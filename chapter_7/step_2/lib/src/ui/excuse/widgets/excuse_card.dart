import 'package:excuses_app/src/data/data.dart';
import 'package:flutter/material.dart';

class ExcuseCard extends StatelessWidget {
  final Excuse? excuse;

  const ExcuseCard({Key? key, this.excuse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
        excuse!.text!,
        style: textTheme.headline2,
      ),
    );
  }
}
