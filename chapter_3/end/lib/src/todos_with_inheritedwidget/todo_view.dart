import 'package:flutter/material.dart';
import 'package:todo/src/controllers/todos_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/src/widgets/todo_list_tile.dart';
import 'package:todo/src/widgets/widgets.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  static const routeName = '/todos';

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
          child: Column(
            children: [
              Builder(
                builder: (BuildContext context) {
                  final controller = TodosScope.of(context);

                  return Column(
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
                      ListView.builder(
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
                      ),
                    ],
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

class TodosScope extends InheritedNotifier<TodosController> {
  const TodosScope({
    Key? key,
    TodosController? notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static TodosController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodosScope>()!.notifier!;
  }
}
