import 'package:digitalcenter_mobile_basecode/app/route/screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/route/navigation_helper.dart';
import '../../../base/base_page.dart';
import '../../../models/view_data_model/login_dm.dart';
import '../controller/login_controller.dart';

class LoginPage extends BasePage<LoginController> {
  const LoginPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    final controller = this.controller;
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
                // onPressed: controller.login,
                onPressed: () {
                  // FirebaseCrashlytics.instance.crash();
                  Navigation.navigateToWithArguments(
                    Screen.home,
                    arguments: {
                      'loginDM': LoginDM(
                          token: 'example_token', userId: 'example_user_id'),
                    },
                  );
                },
                child: const Text('Login'),
              );
            }),
            Obx(() {
              if (controller.errorMessage.value.isNotEmpty) {
                return Text(
                  controller.errorMessage.value,
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
