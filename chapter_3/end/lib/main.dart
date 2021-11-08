import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/todo_with_provider/app.dart';

void main() async {
  final todoController = TodoController();

  // Run the app and pass in the TodoController. The app listens to the
  // TodoController for changes, then passes it further down to the
  // TodoController.
  runApp(ChangeNotifierProvider.value(
    value: todoController,
    child: const TodoApp(),
  ));
}
