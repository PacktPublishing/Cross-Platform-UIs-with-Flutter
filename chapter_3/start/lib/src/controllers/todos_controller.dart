import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

/// A class that many Widgets can interact with to create, read,
/// update, or delete todos
///
/// Controllers glue Data Services to Flutter Widgets.
class TodosController with ChangeNotifier {
  TodosController();

  final List<Todo> _todos = [
    const Todo(
      id: 1,
      task: 'Mow the lawn',
    )
  ];
  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  Future<void> createTodo(Todo todo) async {
    _todos.add(todo);
    notifyListeners();
  }

  Future<void> update(Todo todo) async {
    final todoIndex = _todos.indexWhere((element) => todo.id == element.id);
    _todos[todoIndex] = _todos[todoIndex].copyWith(
      complete: todo.complete,
      task: todo.task,
    );

    notifyListeners();
  }

  Future<void> deleteTodo(Todo todo) async {
    _todos.remove(todo);
    notifyListeners();
  }
}

class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.task,
    this.complete = false,
  });

  final int id;
  final String task;
  final bool complete;

  @override
  List<Object> get props => [complete, id, task];

  Todo copyWith({
    int? id,
    String? task,
    bool? complete,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      complete: complete ?? this.complete,
    );
  }
}
