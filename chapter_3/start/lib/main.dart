import 'package:flutter/material.dart';
import 'package:todo/src/todos_vanilla/app.dart';
import 'package:todo/src/controllers/todos_controller.dart';

void main() async {
  final todoController = TodosController();

  // Run the app and pass in the TodosController. The app listens to the
  // TodosController for changes, then passes it further down to the
  // TodosController.
  runApp(TodosApp(todoController: todoController));
}
