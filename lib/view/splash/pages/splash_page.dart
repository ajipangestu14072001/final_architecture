import 'package:digitalcenter_mobile_basecode/view/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_component/shared_component.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100),
            const SizedBox(height: 20),
            CText(
              "Test - large",
              textTheme: context.textTheme.displayLarge?.copyWith(fontSize: 16),
            ),
            CText(
              'Your App Name - medium',
              textTheme: context.textTheme.displayMedium
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            CText(
              'Your App Name - small',
              textTheme: context.textTheme.displaySmall
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            CText(
              'label large',
              textTheme: context.textTheme.labelLarge
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            CText(
              'label medium',
              textTheme: context.textTheme.labelMedium
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            CText(
              'label small',
              textTheme: context.textTheme.labelSmall
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
