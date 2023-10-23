// Model
class TodoDTO {
  int id;
  String userId;
  String title;
  bool completed;

  TodoDTO({
    required this.id,
    required this.userId,
    required this.title,
    this.completed = false,
  });

  TodoDTO.fromJson(Map<String, dynamic> map)
      : id = map['id'] ?? 0,
        userId = map['userId'] ?? '',
        title = map['title'] ?? '',
        completed = map['completed'] ?? false;
}
