import 'package:get/get.dart';

import '../../repositories/login/login_repository.dart';
import '../../services/network/dio_module.dart';
import '../../view/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginRepository(DioModule.getInstance()));
    Get.lazyPut(() => LoginController(Get.find<LoginRepository>()));
  }
}
