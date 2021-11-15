import 'package:flutter/material.dart';
import 'package:todo/src/controllers/todos_controller.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    Key? key,
    required this.todo,
    required this.onToggleComplete,
    required this.onDelete,
  }) : super(key: key);

  final Todo todo;
  final Function(bool? value) onToggleComplete;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: todo.complete,
      controlAffinity: ListTileControlAffinity.leading,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(todo.task),
          IconButton(onPressed: onDelete, icon: const Icon(Icons.delete))
        ],
      ),
      onChanged: onToggleComplete,
    );
  }
}
