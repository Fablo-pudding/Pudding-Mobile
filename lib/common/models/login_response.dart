class LoginResponse {
  final String accessToken;
  final String refreshToken;

  LoginResponse({required this.accessToken, required this.refreshToken});

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken
    };
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
