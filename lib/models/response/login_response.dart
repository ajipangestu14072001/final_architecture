class LoginResponse {
  final String token;
  final String userId;

  LoginResponse({
    required this.token,
    required this.userId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
    );
  }
}
