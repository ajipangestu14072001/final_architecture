class LoginRequest {
  final String usernameOrEmail;
  final String password;

  LoginRequest({
    required this.usernameOrEmail,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "usernameOrEmail": usernameOrEmail,
      "password": password,
    };
  }
}
