import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/request/login_request.dart';
import '../../../repositories/login/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository _repository;

  LoginController(this._repository);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var loginError = ''.obs;

  Future<void> login() async {
    isLoading.value = true;
    loginError.value = '';

    final request = LoginRequest(
      usernameOrEmail: usernameController.text,
      password: passwordController.text,
    );

    try {
      final loginDM = await _repository.login(request);

      isLoading.value = false;

      if (loginDM != null) {
        final token = loginDM.token;
        Get.snackbar('Success', 'Login successful. Token: $token');
      } else {
        loginError.value = 'Login failed. Please check your credentials.';
        Get.snackbar('Error', 'Login failed. Please check your credentials.');
      }
    } catch (e) {
      isLoading.value = false;
      loginError.value = 'An error occurred: ${e.toString()}';
      Get.snackbar('Error', 'An error occurred: ${e.toString()}');
    }
  }
}
