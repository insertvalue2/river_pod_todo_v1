class UserDto {
  String username;
  String email;
  String password;

  UserDto({required this.username, required this.password, this.email = ""});
}
