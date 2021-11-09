import 'package:flutter/material.dart';

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
