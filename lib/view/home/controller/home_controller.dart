import 'package:get/get.dart';

class HomeController extends GetxController {
  var items = List<String>.generate(30, (index) => "Item $index").obs;
}
