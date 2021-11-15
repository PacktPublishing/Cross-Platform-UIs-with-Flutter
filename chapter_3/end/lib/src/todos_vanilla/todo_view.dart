import 'package:flutter/material.dart';
import 'package:todo/src/controllers/todos_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/src/widgets/widgets.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/todos';

  final TodosController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: TodoTextField(
                  onSubmitted: (value) {
                    controller.createTodo(Todo(
                      id: controller.todos.length + 1,
                      task: value,
                    ));
                  },
                ),
              ),
              AnimatedBuilder(
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
            ],
          ),
        ),
      ),
    );
  }
}
