import 'dart:convert';

class SignUp {
  final String name;
  final String password;

  SignUp({required this.name, required this.password});

  factory SignUp.fromJson(Map<String, dynamic> json) {
    return SignUp(name: json['name'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'password': password};
  }
}
