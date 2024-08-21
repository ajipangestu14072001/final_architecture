import 'package:get/get.dart';

import 'app_routes.dart';
import 'navigation_args_helper.dart';

class Navigation {
  static void navigateToHome({String? username, required dynamic data}) {
    Get.toNamed(
      AppRoutes.home,
      arguments: NavigationArgsHelper.toJson({
        'username': username,
        'data': data,
      }),
    );
  }

  static void navigateToLogin() {
    Get.toNamed(AppRoutes.login);
  }
}
