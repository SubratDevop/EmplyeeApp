import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed('/LoginScreen');
      },
    );
    super.onInit();
  }
}
