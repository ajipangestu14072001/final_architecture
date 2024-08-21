import 'dart:ui';

import 'package:get/get.dart';

class ArgumentHelper {
  static Map<String, dynamic>? getArguments() {
    return Get.arguments as Map<String, dynamic>?;
  }

  static VoidCallback? getOnFinish() {
    final arguments = getArguments();
    return arguments?['onFinish'] as VoidCallback?;
  }
}
