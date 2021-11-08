import 'package:flutter/material.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/src/widgets/todo_list_tile.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/todos';

  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final todo = controller.todos[index];
                  return TodoListTile(
                    todo: todo,
                    onToggleComplete: (bool? value) {
                      controller.update(todo.copyWith(complete: value));
                    },
                    onDelete: () {
                      controller.deleteTodo(todo);
                    },
                  );
                },
                itemCount: controller.todos.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
