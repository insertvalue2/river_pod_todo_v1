import '../models/todo_dto.dart';

// ViewModel

class TodoListViewModel {
  List<TodoDTO> _items = []; // private

  // get 만들어 주기
  List<TodoDTO> get items => _items;

  // // 리스트에 TodoItem 객체를 더하는 메서드 만들어 주기
  // void addItem(String title) {
  //   _items.add(TodoItem(title: title));
  // }
  //
  // // 넘겨 받은 TodoItem 객체의 isDone 변수 값 변경 하기
  // void toggleItem(TodoItem todo) {
  //   todo.isDone = !todo.isDone;
  // }
}
