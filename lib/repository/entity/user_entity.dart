class UserEntity {
  final int userId;
  final String username;
  final String email;

  UserEntity(
      {required this.userId, required this.username, required this.email});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['userId'] as int? ?? 0,
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );
  }

  @override
  String toString() {
    return 'UserEntity{userId: $userId, username: $username, email: $email}';
  }
}
