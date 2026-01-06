class SignUpRequest {
  final String name;
  final String password;

  SignUpRequest({required this.name, required this.password});

  Map<String, dynamic> toJson() {
    return {'name': name, 'password': password};
  }
}
