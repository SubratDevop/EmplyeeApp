import 'package:get/get.dart';
import '../../screens/common_screen/login_screen/login_screen.dart';
import '../../screens/common_screen/otp_screen/otp_screen.dart';
import '../../screens/common_screen/splash_screen/splash_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../resources/dimensions.dart';

class AppPages {
  static String splashScreen = '/';
  static String loginScreen = '/LoginScreen';
  static String otpScreen = '/OtpScreen';
  static String homeScreen = '/HomeScreen';
}

//~  pages are assiciated with GetX

final getPages = [
  GetPage(
    name: AppPages.splashScreen,
    page: () => SplashScreen(),
  ),
  GetPage(
      name: AppPages.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Dimensions.fadeDuration),
  GetPage(
      name: AppPages.otpScreen,
      page: () => OtpScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),
  GetPage(
      name: AppPages.homeScreen,
      page: () => const HomeScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),
];
