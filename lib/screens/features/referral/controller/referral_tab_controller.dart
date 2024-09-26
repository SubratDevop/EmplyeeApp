import 'package:employee_app/screens/features/referral/screens/department/department_screen.dart';
import 'package:employee_app/screens/features/referral/screens/my_referral/my_referral_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/request/request_screen.dart';

class ReferralTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<Tab> referralTabs = <Tab>[
    Tab(
      child: referralTabText(tittle: "Request"),
    ),
    Tab(
      child: referralTabText(tittle: "My Referral"),
    ),
    Tab(
      child: referralTabText(tittle: "Department"),
    ),
  ];

  List<Widget> referralTabsScreens = [
    const RequestScreen(),
    const MyReferralScreen(),
    const Department()
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController =
        TabController(vsync: this, length: referralTabsScreens.length);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

Widget referralTabText({required String tittle}) {
  return Text(
    tittle,
    style: GoogleFonts.outfit(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  );
}
