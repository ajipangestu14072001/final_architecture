import 'package:get/get.dart';

import '../../../app/route/navigation.dart';

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
    Navigation.navigateToLogin(onFinish: (){
      print("DWI AJI PANGESTU");
    });
  }

  void skipOnboarding() {
    finishOnboarding();
  }
}
