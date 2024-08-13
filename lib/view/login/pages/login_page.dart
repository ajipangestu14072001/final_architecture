import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.usernameController,
              decoration: const InputDecoration(labelText: 'Username or Email'),
            ),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: controller.login,
                child: const Text('Login'),
              );
            }),
            Obx(() {
              if (controller.loginError.value.isNotEmpty) {
                return Text(
                  controller.loginError.value,
                  style: const TextStyle(color: Colors.red),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}