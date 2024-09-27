import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // statusBarColor: AppColor.primaryColor, // Set the status bar color here
      statusBarColor: Color(0xFF565BD9), // Set the status bar color here
      statusBarIconBrightness: Brightness.dark, // Set text and icons color
    ));
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed('/LoginScreen');
      },
    );
    super.onInit();
  }
}
