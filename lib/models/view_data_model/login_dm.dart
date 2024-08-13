class LoginDM {
  final String token;
  final String userId;

  LoginDM({
    required this.token,
    required this.userId,
  });

  factory LoginDM.fromJson(Map<String, dynamic> json) {
    return LoginDM(
      token: json['token'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
    );
  }
}
