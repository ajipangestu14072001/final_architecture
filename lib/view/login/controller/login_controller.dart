import 'package:digitalcenter_mobile_basecode/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/request/login_request.dart';
import '../../../repositories/login/login_repository.dart';

class LoginController extends BaseController<LoginRepository> {
  LoginController(super.repository);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    isLoading.value = true;
    errorMessage.value = '';

    final request = LoginRequest(
      usernameOrEmail: usernameController.text,
      password: passwordController.text,
    );

    try {
      final loginDM = await repository?.login(request);

      isLoading.value = false;

      if (loginDM != null) {
        final token = loginDM.token;
        Get.snackbar('Success', 'Login successful. Token: $token');
      } else {
        errorMessage.value = 'Login failed. Please check your credentials.';
        Get.snackbar('Error', 'Login failed. Please check your credentials.');
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'An error occurred: ${e.toString()}';
      Get.snackbar('Error', 'An error occurred: ${e.toString()}');
    }
  }

  @override
  void handleArguments(Map<String, dynamic> arguments) {
    // TODO: implement handleArguments
  }
}
