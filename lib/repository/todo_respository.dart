import 'package:dio/dio.dart';
import 'package:my_todo_riverpod_v1/models/todo_dto.dart';

class TodoRepository {
  final Dio _dio = Dio();
  static final TodoRepository _singleton = TodoRepository._internal();

  factory TodoRepository() {
    return _singleton;
  }

  TodoRepository._internal();

  Future<List<TodoDTO>> fetchTodos() async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/todos');
    final data = List<Map<String, dynamic>>.from(response.data);
    return data
        .map((json) => TodoDTO(
              id: json['id'],
              userId: json['userId'],
              title: json['title'],
              completed: json['completed'],
            ))
        .toList();
  }
}
