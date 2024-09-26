// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:employee_app/core/resources/colors.dart';
import 'package:employee_app/core/resources/screen_size.dart';
import 'package:employee_app/screens/home_screen/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';

import '../../core/resources/app_text_size.dart';
import '../common_screen/otp_screen/otp_screen.dart';
import 'model/feature_widget_model.dart';
import 'widget/feature_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  callNumber() async {
    const number = '0000000000'; //set the number here
    // bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              // height: ScreenSize.height(context) * 0.35,
              width: ScreenSize.width(context),
              decoration: BoxDecoration(
                color: AppColor.curvedContainerColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  70.kH,
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: SvgPicture.asset(
                              "assets/images/default_patient.svg"),
                        ),
                      ),
                      15.kW,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          H2Text(
                            tittle: "Hi, Welcome 🎉",
                            tittleColor: Colors.white,
                            textWeight: FontWeight.w400,
                            textSize: 20,
                          ),
                          5.kH,
                          H1Text(
                            // tittle: "Sumedha Paul",
                            tittle: OtpScreen.employeeInfo == null
                                ? "-"
                                : OtpScreen.employeeInfo!.employeeName!,
                            tittleColor: Colors.white,
                            textWeight: FontWeight.w500,
                          )
                        ],
                      )
                    ],
                  ),
                  25.kH,
                  Container(
                      height: 60,
                      width: ScreenSize.width(context),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15)),
                      child:

                          // ElevatedButton(
                          //   // onPressed: _callEmergency,
                          //   onPressed: () => callNumber(),
                          //   child: const Text('Call Emergency (101)'),
                          // ),

                          SliderButton(
                        vibrationFlag: true,
                        alignLabel: Alignment.center,
                        action: () async {
                          callNumber();
                          return false;
                        },

                        ///Put label over here
                        label: Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: H2Text(
                            tittle: "Slide to activate SOS  >>",
                            tittleColor: Colors.white,
                            textWeight: FontWeight.w400,
                            textSize: 20,
                          ),
                        ),

                        icon: H1Text(
                          tittle: "SOS",
                          tittleColor: Colors.white,
                          textWeight: FontWeight.w500,
                          textSize: 17,
                          letterSpace: 2,
                        ),

                        shimmer: false,

                        ///Change All the color and size from here.
                        width: ScreenSize.width(context) - 40,
                        radius: 15,
                        buttonColor: const Color(0xffFF143F),
                        backgroundColor: Colors.transparent,
                        highlightedColor: Colors.white,
                        baseColor: Colors.white,
                      )),
                  5.kH,
                ],
              ),
            ),
            15.kH,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: featureList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2.5,
                    // crossAxisCount: 4,
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 14),
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () => Get.to(() => featureScreens[index]),
                    child: FeatureWidget(
                      tittle: featureList[index].tittle!,
                      iconPath: featureList[index].iconPath!,
                    ),
                  );
                },
              ),
            ),
            15.kH,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: H2Text(
                tittle: "Notifications",
                textWeight: FontWeight.w600,
                tittleColor: const Color(0xFF22262F),
              ),
            ),
            10.kH,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                // height: 125,
                width: ScreenSize.width(context),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFECEEF2).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "4 Sep 2024,4:45 PM",
                      style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF516078)),
                    ),
                    2.kH,
                    Text(
                      "Transport Request Approved",
                      style: GoogleFonts.outfit(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF22262F)),
                    ),
                    2.kH,
                    H2Text(
                      tittle:
                          "Your transport request has been approved.Pickup time: 9:00 PM at the East Wing entrance. Driver Name: Santanu Sekhar, Vehicle Number: UP05-U-7272.",
                      maxTextlines: 5,
                      textOverflow: TextOverflow.ellipsis,
                      textSize: AppTextSize.h2Textsize - 4,
                      tittleColor: const Color(0xFF516078),
                    ),
                  ],
                ),
              ),
            ),
            10.kH,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                // height: 125,
                width: ScreenSize.width(context),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFECEEF2).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "4 Sep 2024,4:45 PM",
                      style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF516078)),
                    ),
                    2.kH,
                    Text(
                      "Grievance In Progress",
                      style: GoogleFonts.outfit(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF22262F)),
                    ),
                    2.kH,
                    H2Text(
                      tittle:
                          "Your grievance has been accepted by Grievance Cell and is currently in progress. Expected resolution date: 26 Sep 2024.",
                      maxTextlines: 5,
                      textOverflow: TextOverflow.ellipsis,
                      textSize: AppTextSize.h2Textsize - 4,
                      tittleColor: const Color(0xFF516078),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
