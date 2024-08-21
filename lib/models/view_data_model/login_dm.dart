import '../../app/route/navigation_args_helper.dart';

class LoginDM implements ToJsonConvertible {
  final String token;
  final String userId;

  LoginDM({required this.token, required this.userId});

  @override
  Map<String, dynamic> toJson() => {
    'token': token,
    'userId': userId,
  };

  factory LoginDM.fromJson(Map<String, dynamic> json) => LoginDM(
    token: json['token'] as String,
    userId: json['userId'] as String,
  );
}