import 'package:get/get.dart';
import '../../screens/common_screen/login_screen/login_screen.dart';
import '../../screens/common_screen/otp_screen/otp_screen.dart';
import '../../screens/common_screen/splash_screen/splash_screen.dart';
import '../../screens/features/beds/beds_screen.dart';
import '../../screens/features/grievance/screens/grievance_screen.dart';
import '../../screens/features/grievance/screens/new_grievance_screen.dart';
import '../../screens/features/referral/referral_screen.dart';
import '../../screens/features/transport/screens/transport_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../resources/dimensions.dart';

class AppPages {
  static String splashScreen = '/';
  static String loginScreen = '/LoginScreen';
  static String otpScreen = '/OtpScreen';
  static String homeScreen = '/HomeScreen';

//^ Grievance
  static String grievanceScreen = '/GrievanceScreen';
  static String newGrevanceScreen = '/NewGrevanceScreen';

  //^ Beds
  static String bedsScreen = '/BedsScreen';

  //^ Referral
  static String referralScreen = '/ReferralScreen';

  //^ Transport
  static String transportScreen = '/TransportScreen';
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

  //^ Grievance
  GetPage(
      name: AppPages.grievanceScreen,
      page: () => GrievanceScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),

  GetPage(
      name: AppPages.newGrevanceScreen,
      page: () =>  NewGrevanceScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),

  //^ Beds
  GetPage(
      name: AppPages.bedsScreen,
      page: () => const BedsScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),

  //^ Referral
  GetPage(
      name: AppPages.referralScreen,
      page: () => const ReferralScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),

  //^ Transport
  GetPage(
      name: AppPages.transportScreen,
      page: () => const TransportScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),
];
