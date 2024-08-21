import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  void handleArguments(Map<String, dynamic> arguments);

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments as Map<String, dynamic>?;

    if (arguments == null || arguments.isEmpty) {
      throw Exception('Arguments are required but none were provided.');
    }

    handleArguments(arguments);
  }
}

