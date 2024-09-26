import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/colors.dart';
import 'controller/referral_tab_controller.dart';

class ReferralTabScreen extends StatelessWidget {
  const ReferralTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReferralTabController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.curvedContainerColor,
          toolbarHeight: 70,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              'assets/icons/arrow-left.svg',
              height: 30,
              width: 30,
            ),
          ),
          centerTitle: false,
          title: Text(
            "Refferal",
            style: GoogleFonts.outfit(
                fontSize: 22,
                // fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              color: const Color(0xFFCCD8F9),
              child: TabBar(
                controller: controller.tabController,
                tabs: controller.referralTabs,
                unselectedLabelStyle: const TextStyle(color: Color(0xFF201F47)),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: const Color(0xFF5151D6),
                dividerColor: Colors.transparent,
                dividerHeight: 0,
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: controller.referralTabsScreens,
        ));
  }
}
