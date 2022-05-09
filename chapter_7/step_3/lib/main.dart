import 'package:excuses_app/src/data/excuse_facade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';

void main() async {
  runApp(
    Provider(
      create: (context) => ExcuseFacade(),
      child: const ExcusesApp(),
    ),
  );
}
