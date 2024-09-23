// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../core/resources/app_text_size.dart';
import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/screen_size.dart';
import '../../../../../../core/responsive/responsive_size.dart';

class NoOrderWidget extends StatelessWidget {
  NoOrderWidget(
      {super.key,
      this.ontapMannual,
      this.ontapOrderPrescription,
      this.controller,
      this.tittle1,
      required this.tittle2,
      this.button2,
      required this.tittle3});
  void Function()? ontapMannual;
  void Function()? ontapOrderPrescription;
  GetxController? controller;
  String? tittle1;
  String? tittle2;
  String? tittle3;
  Widget? button2;

  @override
  Widget build(BuildContext context) {
    return 
    Expanded(
      child: Container(
        width: double.infinity,
        color: const Color(0xFFEFFAFC),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/images/robot.svg",
                height: Responsive.isMobile(context)
                    ? 250
                    : Responsive.isMediumMobile(context)
                        ? 270
                        : Responsive.isLargeMobile(context)
                            ? 300
                            : 500,
                width: Responsive.isMobile(context)
                    ? 250
                    : Responsive.isLargeMobile(context)
                        ? 270
                        : Responsive.isLargeMobile(context)
                            ? 300
                            : 500,
              ),
             
              SizedBox(
                height: ScreenSize.width(context) <= 801 ? 15 : 25,
              ),
              tittle1 == ""
                  ? const SizedBox.shrink()
                  : Body1Text(
                      alignnment: TextAlign.center,
                      tittle: tittle1 ?? "",
                      tittleColor: const Color(0xFF465558),
                    ),

              SizedBox(
                height: ScreenSize.width(context) <= 801 ? 15 : 25,
              ),
              //^ Order From Prescription Btn
              tittle2 == ""
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: ontapOrderPrescription,
                      child: Container(
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: H3Text(
                              tittle: tittle2!,
                              tittleColor: Colors.white,
                              textSize: 15),
                        ),
                      ),
                    ),

              SizedBox(
                height: ScreenSize.width(context) <= 801 ? 15 : 25,
              ),

              //^ Manual Order Btn
              tittle3 == ""
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: ontapMannual,
                      child: Container(
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: AppColor.lightAccent,
                          color: const Color(0xFFD5F1F8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: H3Text(
                              tittle: tittle3!,
                              tittleColor: const Color(0xFF1F5F7F),
                              textSize: 15),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
