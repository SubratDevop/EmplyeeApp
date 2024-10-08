import 'package:get/get.dart';

import '../../screens/common_screen/login_screen/login_screen.dart';
import '../../screens/common_screen/otp_screen/otp_screen.dart';
import '../../screens/common_screen/splash_screen/splash_screen.dart';
import '../../screens/features/beds/screens/bed_acton_screen.dart';
import '../../screens/features/beds/screens/beds_screen.dart';
import '../../screens/features/grievance/screens/grievance_screen.dart';
import '../../screens/features/grievance/screens/new_grievance_screen.dart';
import '../../screens/features/referral/referral_tab_screen.dart';
import '../../screens/features/transport/screens/book_transport_screen.dart';
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
  static String bedActionScreen = '/BedActionScreen';

  //^ Referral
  static String referralTabScreen = '/ReferralTabScreen';

  //^ Transport
  static String transportScreen = '/TransportScreen';
  static String bookTrnsportScreen = '/BookTrnsportScreen';
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
      page: () => const GrievanceScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),

  GetPage(
      name: AppPages.newGrevanceScreen,
      page: () => const NewGrevanceScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),

  //^ Beds
  GetPage(
      name: AppPages.bedsScreen,
      page: () => const BedsScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),
  GetPage(
      name: AppPages.bedActionScreen,
      page: () => const BedActionScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),

  //^ Referral
  GetPage(
      name: AppPages.referralTabScreen,
      page: () => const ReferralTabScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),

  //^ Transport
  GetPage(
      name: AppPages.transportScreen,
      page: () => const TransportScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),
  GetPage(
      name: AppPages.bookTrnsportScreen,
      page: () => const BookTrnsportScreen(),
      transition: Transition.fade,
      transitionDuration: Dimensions.fadeDuration),
];
