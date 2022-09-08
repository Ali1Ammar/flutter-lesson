import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testing/src/data/todo.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo todo;
  final bool value;
  final VoidCallback onCheck;
  const TodoItemWidget(
      {super.key,
      required this.todo,
      required this.value,
      required this.onCheck});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: (d) {
        onCheck();
      },
      title: Text(todo.title!),
      subtitle: Text("hello"),
    );
  }
}
