import 'package:final_architecture/app/route/app_routes.dart';
import 'package:final_architecture/app/route/navigation.dart';
import 'package:get/get.dart';

import '../../../app/route/screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(Screen.onboarding);
    });
  }
}
