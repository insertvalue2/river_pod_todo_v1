import 'package:flutter/material.dart';
import 'package:my_todo_riverpod_v1/view/todo_list_view.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("TodoList")),
          body: TodoListView(), // 코드 수정
        ),
      ),
    );
  }
}
