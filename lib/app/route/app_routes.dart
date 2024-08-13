import 'package:get/get.dart';

import '../../view/login/pages/login_page.dart';
import '../binding/login_binding.dart';

class AppRoutes {
  static const login = '/login';

  static List<GetPage> getPages() => [
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
