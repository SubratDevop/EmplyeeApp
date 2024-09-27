import 'package:animate_do/animate_do.dart';
import 'package:employee_app/core/resources/app_text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/colors.dart';
import 'controller/referral_tab_controller.dart';
import 'two_referrals/consultant_referral/conusltant_referral_screen.dart';
import 'two_referrals/departmenmt_referral/department_referral_screen.dart';

class ReferralTabScreen extends StatelessWidget {
  const ReferralTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReferralTabController());
    return Obx(
      () => Scaffold(
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            controller.isExtended.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 500),
                        child: orderOptionBtn(controller,
                            type: "Department Referral",
                            isExpandedd: controller.isExtended.value,
                            ontapBtn: () {
                          Get.to(
                            () => const DepartmentReferralScreen(),
                            transition: Transition.downToUp,
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 500),
                        child: orderOptionBtn(controller,
                            type: "Consultant Referral",
                            isExpandedd: controller.isExtended.value,
                            ontapBtn: () {
                          Get.to(() => const ConsultantReferralScreen(),
                              transition: Transition.downToUp);
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            controller.isExtended.value
                ? FadeInLeft(
                    duration: const Duration(milliseconds: 500),
                    child: FloatingActionButton(
                      onPressed: () => controller.getExtended(),
                      backgroundColor: const Color(0xFFD74761),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  )
                : FadeInRight(
                    duration: const Duration(milliseconds: 500),
                    child: FloatingActionButton.extended(
                        backgroundColor: const Color(0xFF5151D6),
                        onPressed: () => controller.getExtended(),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: H2Text(
                          tittle: "New Request",
                          tittleColor: Colors.white,
                          textSize: 15,
                        )),
                  ),
          ],
        ),
      ),
    );
  }
}

Widget orderOptionBtn(ReferralTabController controller,
    {required String type,
    required bool isExpandedd,
    required void Function()? ontapBtn}) {
  return GestureDetector(
    onTap: ontapBtn,
    child: AnimatedOpacity(
      opacity: isExpandedd ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: AppColor.lightAccent,
          color: const Color(0xFFEFFAFC),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.transparent,
          ),
          boxShadow: const [
            BoxShadow(
                blurRadius: 10,
                // blurStyle: BlurStyle.outer,
                color: Color(0xFF5151D6),
                offset: Offset(4, 4))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: H3Text(
              textWeight: FontWeight.w600,
              tittle: type,
              tittleColor: const Color(0xFF5151D6),
              textSize: 16),
        ),
      ),
    ),
  );
}
