class LoginRequest {
  final String name;
  final String password;

  LoginRequest({required this.name, required this.password});

  Map<String, dynamic> toJson() {
    return {'name': name, 'password': password};
  }

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(name: json['name'], password: json['password']);
  }
}