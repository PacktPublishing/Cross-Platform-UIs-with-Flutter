import 'package:flutter/material.dart';
import 'package:todo/src/todo_vanilla/app.dart';
import 'package:todo/src/controllers/todo_controller.dart';

void main() async {
  final todoController = TodoController();

  // Run the app and pass in the TodoController. The app listens to the
  // TodoController for changes, then passes it further down to the
  // TodoController.
  runApp(TodoApp(todoController: todoController));
}
