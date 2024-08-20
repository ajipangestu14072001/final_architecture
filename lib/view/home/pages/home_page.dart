import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_component/shared_component.dart';
import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      body: Obx(() => CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: CText('Home Page', fontSize: 16),
            ),
            expandedHeight: 100,
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final menuItem = homeController.gridMenuItems[index];
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        menuItem.imageUrl,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 8),
                      Text(menuItem.title),
                    ],
                  ),
                );
              },
              childCount: homeController.gridMenuItems.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  title: Text(homeController.items[index]),
                );
              },
              childCount: homeController.items.length,
            ),
          ),
        ],
      )),
    );
  }
}
