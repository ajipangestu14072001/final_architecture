import 'package:final_architecture/app/route/app_routes.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  final List<String> onboardingPages = [
    "Welcome to the App",
    "Discover Features",
    "Get Started"
  ];

  void nextPage() {
    if (currentPage < onboardingPages.length - 1) {
      currentPage.value++;
    } else {
      finishOnboarding();
    }
  }

  void finishOnboarding() {
    Get.offAllNamed(AppRoutes.login);
  }

  void skipOnboarding() {
    finishOnboarding();
  }
}
