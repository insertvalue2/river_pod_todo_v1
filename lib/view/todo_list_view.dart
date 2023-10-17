import 'package:flutter/material.dart';

import '../models/todo_item.dart';

// View 클래스: 할 일 목록을 보여주는 화면을 정의합니다.
class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  // 뷰에서는 직접 뷰모델을 가지고 있다.
  // _viewModel 객체가 final 이지 안에 내부 상태 값은 아니다
  final TodoListViewModel listViewModel = TodoListViewModel();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter todo item...',
              suffixIcon: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    // 데이터를 ViewModel로 위임
                    listViewModel.addItem(_controller.text);
                    _controller.clear();
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          // 할 일 목록을 화면에 표시
          child: ListView.builder(
            itemCount: listViewModel.items.length, // 코드 수정
            itemBuilder: (context, index) {
              var item = listViewModel.items[index]; // 코드 수정
              return ListTile(
                title: Text(item.title),
                trailing: Checkbox(
                  value: item.isDone,
                  onChanged: (value) {
                    print("value : ${value}");
                    setState(() {
                      listViewModel.toggleItem(item);
                    });
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
