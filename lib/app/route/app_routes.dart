import 'package:final_architecture/app/binding/onboarding_binding.dart';
import 'package:final_architecture/app/binding/splash_binding.dart';
import 'package:final_architecture/view/onboarding/pages/onboarding_page.dart';
import 'package:final_architecture/view/splash/pages/splash_page.dart';
import 'package:get/get.dart';

import '../../view/home/pages/home_page.dart';
import '../../view/login/pages/login_page.dart';
import '../binding/home_binding.dart';
import '../binding/login_binding.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const onboarding = '/onboarding';
  static const splash = '/splash';

  static List<GetPage> getPages() => [
    GetPage(
      name: onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
