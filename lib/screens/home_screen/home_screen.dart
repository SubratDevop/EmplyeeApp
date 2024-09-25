// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:employee_app/core/resources/colors.dart';
import 'package:employee_app/core/resources/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:slider_button/slider_button.dart';

import '../../core/resources/app_text_size.dart';
import '../common_screen/otp_screen/otp_screen.dart';
import 'model/feature_widget_model.dart';
import 'widget/feature_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                    child: SliderButton(
                      vibrationFlag: true,
                      alignLabel: Alignment.center,
                      action: () async {
                        ///Do something here OnSlide
                        log("SOS activated");
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
          20.kH,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: featureList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2,
                  // crossAxisCount: 4,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
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
          )
        ],
      ),
    );
  }
}
