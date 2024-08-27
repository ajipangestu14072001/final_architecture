import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  void handleArguments(Map<String, dynamic> arguments);

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments as Map<String, dynamic>?;

    if (arguments != null && arguments.isNotEmpty) {
      handleArguments(arguments);
    }
  }
}

