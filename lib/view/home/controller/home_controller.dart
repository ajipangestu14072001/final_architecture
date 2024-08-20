import 'package:get/get.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import '../../../models/grid_menu_items.dart';
import '../../../utils/firebase/remote_config_utils.dart';

class HomeController extends GetxController {
  final RxList<String> items = List<String>.generate(30, (index) => "Item $index").obs;

  RxList<GridMenuItem> gridMenuItems = <GridMenuItem>[
    GridMenuItem(
        title: 'Menu 1',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Android_logo_2019.png'),
    GridMenuItem(
        title: 'Menu 2',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Android_logo_2019.png'),
    GridMenuItem(
        title: 'Menu 3',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Android_logo_2019.png'),
    GridMenuItem(
        title: 'Menu 4',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Android_logo_2019.png'),
    GridMenuItem(
        title: 'Menu 5',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Android_logo_2019.png'),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchRemoteConfig();
  }

  Future<void> _fetchRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.fetchAndActivate();
      final String jsonString = remoteConfig.getString("grid_menu_visibility");

      print('Remote Config JSON: $jsonString');

      if (jsonString.isNotEmpty) {
        final Map<String, bool> visibilityMap = await RemoteConfigUtils().parseJsonConfig(jsonString);

        gridMenuItems.value = gridMenuItems.map((menuItem) {
          final visible = visibilityMap[menuItem.title] ?? true;
          return GridMenuItem(
            title: menuItem.title,
            imageUrl: menuItem.imageUrl,
            visible: visible,
          );
        }).where((menuItem) => menuItem.visible).toList();
      } else {
        print('Remote config JSON is empty.');
      }
    } catch (e) {
      print("Error fetching remote config: $e");
    }
  }
}
