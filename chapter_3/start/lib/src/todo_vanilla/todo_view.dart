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
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: TodoTextField(
                  onSubmitted: (value) {
                    controller.createTodo(Todo(
                      id: controller.todos.length,
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

class TodoTextField extends StatefulWidget {
  const TodoTextField({
    Key? key,
    required this.onSubmitted,
  }) : super(key: key);
  final Function(String value) onSubmitted;
  @override
  _TodoTextFieldState createState() => _TodoTextFieldState();
}

class _TodoTextFieldState extends State<TodoTextField> {
  late final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration.collapsed(
        hintText: 'What needs to be done?',
      ),
      onSubmitted: (value) async {
        widget.onSubmitted(value);

        _controller.clear();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
