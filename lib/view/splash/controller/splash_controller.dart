import 'package:digitalcenter_mobile_basecode/app/route/app_routes.dart';
import 'package:digitalcenter_mobile_basecode/app/route/navigation_helper.dart';
import 'package:digitalcenter_mobile_basecode/app/route/observer_navigator.dart';
import 'package:get/get.dart';

import '../../../app/route/screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      // Navigation.navigateTo(Screen.onboarding);
    });
  }
}
