class SignUp{
  final String name;
  final String password;

  SignUp({required this.name, required this.password});

  Map<String, dynamic> toJson() {
    return {'name': name, 'password': password};
  }
}
