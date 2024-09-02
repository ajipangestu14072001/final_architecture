import 'package:final_architecture/app/route/screen.dart';
import 'package:get/get.dart';
import '../../view/home/pages/home_page.dart';
import '../../view/login/pages/login_page.dart';
import '../../view/onboarding/pages/onboarding_page.dart';
import '../../view/splash/pages/splash_page.dart';
import '../binding/home_binding.dart';
import '../binding/login_binding.dart';
import '../binding/onboarding_binding.dart';
import '../binding/splash_binding.dart';

/// [AppRoutes Class]
/// Definition: A class that organizes and manages application routes.
/// Purpose: Centralizes route definitions and their associated bindings for an application, facilitating navigation and dependency injection with GetX.
/// [getPages Method]
/// Definition: A static method that returns a list of GetPage objects.
/// - Returns: List<GetPage> — a list of route definitions used by GetX for navigation.
/// Purpose: Provides a centralized location to define all the routes for the application. Each route is associated with a page and its corresponding binding.
/// [GetPage Instances]
/// Each GetPage instance defines a route in the application.
/// - name: The route name, which should match the string used for navigation.
/// - page: A callback function returning the widget that should be displayed for this route. The widget is usually a screen or view in the application.
/// - binding: An instance of the binding class associated with the route. This class is used for dependency injection and ensures that required dependencies are initialized before the route is displayed.

// Definition of the AppRoutes class to manage application routes
class AppRoutes {
  // Static method to define the list of application routes
  static List<GetPage> getPages() => [
        // Route for the onboarding screen
        GetPage(
          name: Screen.onboarding,
          page: () => const OnboardingView(),
          binding: OnboardingBinding(),
        ),
        // Route for the login screen
        GetPage(
          name: Screen.login,
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
        // Route for the home screen
        GetPage(
          name: Screen.home,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        // Route for the splash screen
        GetPage(
          name: Screen.splash,
          page: () => const SplashView(),
          binding: SplashBinding(),
        ),
      ];
}
