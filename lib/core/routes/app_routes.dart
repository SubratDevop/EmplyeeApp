import 'package:get/get.dart';

import '../../screens/splash_screen/splash_screen.dart';

class AppPages {
  static String splashScreen = '/';
  static String loginScreen = '/LoginScreen';
}

//~  pages are assiciated with GetX

final getPages = [
  GetPage(
    name: AppPages.splashScreen,
    page: () => const SplashScreen(),
  ),
  // GetPage(
  //     name: AppPages.loginScreen,
  //     page: () => const LoginScreen(),
  //     transition: Transition.fadeIn,
  //     transitionDuration: Dimensions.fadeDuration),
];
