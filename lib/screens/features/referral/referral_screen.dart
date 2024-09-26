import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/colors.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
      body:
          Center(child: SvgPicture.asset("assets/images/work_in_prgress.svg")),
    );
  }
}
