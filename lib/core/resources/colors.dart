import 'package:flutter/material.dart';

class AppColor {
//* App Colors
  static const lightGrayColor = Color(0xFF7A9496);
  static const deepGrayColor = Color(0xFF3F494B);

//* primary  Color

  //& Light theme
  static Color primaryColor = const Color(0xff5151D6);
  static Color curvedContainerColor = const Color(0xff3B3A99);
  static Color lightPrimary = AppColor.primaryColor;
  static const Color lightSecondary = Color(0xffE1E3E6);
  static const Color lightAccent = Color(0xffD5F1F8);
  static const Color lightBackground = Color(0xffFFFFFF);
  static const Color lightForeground = Color(0xff2CA4A4);
  static const Color appBGColor = Color(0xFFEFFAFC);

  //& Dark theme
  static const Color darkPrimary = Colors.black;
  static const Color darkBackground = Color(0xff181A20);
  static const Color darkForeground = Color(0xff202228);
  static const Color darkSecondary = Color(0xff281920);

  static const Color backgroundColor = Colors.white;

  static const Color appTitleTextColor = Color(0xFF102B3C);

  static const Color mainTitleTextColor = Color(0xff1E232C);

  static const Color bodytitleTextColorBlack = Color(0xff1E232C);
  static const Color bodytitleTextColorWhite = Color(0xffFFFFFF);

  static const Color bodysubTitleTextColor = Color(0xff333333);

//* drop Down icon Color
  static const Color primaryDropDownIconColor = Color(0xFF1E749C);
  static const Color dropDownIconColor = Color(0xFF102B3C);

//* Search Patirnt Color
  static const Color searchPatientTextColor = Color(0xFF1E749C);

//* Search Patirnt Color
  static const Color tabBarColor = Color(0xFFE3E9EA);

//* Tab Color   (my patient & My word)
  static Color appTabEnableColor = AppColor.lightPrimary;
  static const Color appTabDisableColor = Colors.white;
  static const Color unselectedTabTextColor = Color(0xFF1E749C);
  static const Color tabBGColor = Color(0xFFF4F7F7);

//* Profile

  static const Color noProfileGrayColor = Color(0xffF5F5F5);

//* Link Text Color

  static const linkTextColor = Color(0xFF2191B9); // 1F40B5

//* App bar Color

  static const appbarColor = Color(0xFFD5F1F8); // 1F40B5
  static const appbarContentColor = Color(0xFF597173);

//* circle avatar border Color

  static const avatarBorderColor = Color(0xFFB0E2F1);

//* List Element catd Shadow Color

  static const Color listElentCardShadowColor =
      Color.fromARGB(255, 57, 136, 150); //

//* container Color

  static const cardContainerColor = Color(0xFFF4F7F7); // 1F40B5
  static const searchPatientContainerColor = Color(0xFFF1FCFA); // 1F40B5

//* Buttn text color

  static const Color submitBtnTextBlack = Color(0xff1E232C);
  static const Color submitBtnTextWhite = Colors.white;

  static const Color backButtonColor = Colors.white;
  static const Color backButtonBorderColor = Color.fromARGB(255, 224, 225, 228);

//* Buttn border color

  static const Color primaryBtnBorderColor = Color(0xff19A7CE);
  static const Color blackBtnBorderColor = Color(0xff1E232C);

//* Text Field Color

  static const Color txtFldTitleTextColor = Color(0xff22292A);

  static const Color hintTextColor = Color(0xff597173);

  static const Color textFiledBgColor = Color(0xffF4F7F7);

  // static const Color detailsTextFiledBgColor = Color(0xffF7F8F9);
  static const Color detailsTextFiledBgColor = Color(0xffEDF5F4);

  static const Color textFiledBorderColor = Color(0xffE8ECF4);

  static const Color textFiledErrorBorderColor = Color(0xFFE64646);

//* OTP text Fild Color

  static const Color otpDefaultBGColor = Color(0xffF7F8F9);

  static const Color otpDefaultBorderColor = Color(0xffE8ECF4);
  static const Color otpErrorBorderColor = Colors.red;
  static final Color otpFocusBorderColor =
      const Color(0xff0073C5).withOpacity(0.50);

//* icon color
  static const Color appIconColor = Color(0xff292929);

//* form Details Container

  static const Color detailsContainerBgColor = Color(0xffEDF5F4);
  static const Color detailsContainerBORDERColor = Color(0xffE8ECF4);

//* time slot btn Color

  static const Color selectTiemeSlotBtnColor = Color(0xff014510);
  static const Color unselectTiemeSlotBtnColor = Color(0xffC7E8CE);
  static const Color tiemeSlotTxtColor = Colors.black;

//* calander text color

  static const Color calenderTextColor = Color(0xff4A5660);
  static const Color leftChevronIconColor = Color(0xffB5BEC6);
  static const Color righttChevronIconColor = Color(0xffB5BEC6);
  static const Color weekDaysColor = Color(0xffB5BEC6);
  static final Color calanderShadowColor =
      const Color(0xff000000).withOpacity(0.5);

//* splash screen

  static const Color splashColor = Color(0xff7ACCE6);
  static const Color splashTextColor1 = Color(0xFF0070C0);
  static const Color splashTextColor2 = Color(0xFF08282B);
  static const Color splashBGCololr = Color(0xFFEFFAFC);
}
