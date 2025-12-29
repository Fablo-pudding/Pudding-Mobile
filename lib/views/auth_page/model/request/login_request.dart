class LoginRequest {
  final String name;
  final String password;

  LoginRequest({required this.name, required this.password});

  Map<String, dynamic> toJson() {
    return {'name': name, 'password': password};
  }
}
