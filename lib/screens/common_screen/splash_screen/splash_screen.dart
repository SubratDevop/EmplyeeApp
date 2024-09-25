import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Builder(builder: (context) {
              return Image.asset(
                'assets/images/Splash.png', // Path to your SVG file
                fit: BoxFit.cover, // Cover the entire screen
              );
            }),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInLeft(
                  animate: true,
                  delay: const Duration(milliseconds: 300),
                  child: Image.asset(
                    "assets/images/soul.png",
                    height: 20,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                
                FadeInUp(
                  animate: true,
                  delay: const Duration(milliseconds: 1500),
                  child: SvgPicture.asset(
                    "assets/images/ERP.svg",
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
