import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
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
              child:

                  // SvgPicture.asset("assets/icons/app_icon.svg")
                  Image.asset(
            "assets/images/app_icon.png",
            fit: BoxFit.fill,
          )

              //  Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     FadeInLeft(
              //       animate: true,
              //       delay: const Duration(milliseconds: 300),
              //       child: Image.asset(
              //         "assets/images/soul.png",
              //         height: 20,
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),

              //     FadeInUp(
              //       animate: true,
              //       delay: const Duration(milliseconds: 1500),
              //       child: SvgPicture.asset(
              //         "assets/images/ERP.svg",
              //         height: 40,
              //       ),
              //     ),
              //   ],
              // ),
              ),
        ],
      ),
    );
  }
}
