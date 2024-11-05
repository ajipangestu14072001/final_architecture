import 'package:final_architecture/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_component/shared_component.dart';
import '../controller/home_controller.dart';

class HomeView extends BasePage<HomeController> {
  const HomeView({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: Obx(() => CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Home Page ${controller.loginDM.token}'),
            ),
            expandedHeight: 100,
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final menuItem = controller.gridMenuItems[index];
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
              childCount: controller.gridMenuItems.length,
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
                  title: Text(controller.items[index]),
                );
              },
              childCount: controller.items.length,
            ),
          ),
        ],
      )),
    );
  }
}
