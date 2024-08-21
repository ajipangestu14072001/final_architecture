import 'dart:ui';

import 'package:final_architecture/app/route/screen.dart';
import 'package:get/get.dart';

import 'navigation_args_helper.dart';

class Navigation {
  static void navigateToHome({String? username, required dynamic data}) {
    Get.toNamed(
      Screen.home,
      arguments: NavigationArgsHelper.toJson({
        'username': username,
        'data': data,
      }),
    );
  }

  static void navigateToLogin({VoidCallback? onFinish}) {
    Get.toNamed(
      Screen.login,
      arguments: {
        'onFinish': onFinish,
      },
    );
  }

  static void goOnboarding(){
    Get.offAllNamed(Screen.onboarding);
  }
}

