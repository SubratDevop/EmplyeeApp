// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../resources/app_text_size.dart';
import '../resources/colors.dart';
import '../resources/dimensions.dart';
import '../resources/screen_size.dart';
import '../responsive/responsive_size.dart';

class CustmAppBar extends StatelessWidget {
  CustmAppBar({
    super.key,
    required this.addActionBtn,
    this.actionBtn1,
    this.leadingIcon,
    this.ontapActionBtn,
    this.bgColor,
    this.onTapBack,
    required this.tittle,
  });

  final String tittle;
  Widget? leadingIcon;
  Widget? actionBtn1;
  bool? addActionBtn;
  Color? bgColor;
  void Function()? ontapActionBtn;
  void Function()? onTapBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.width(context),
      // height: ScreenSize.width(context) >= 800 ? 80 : 70,
      // height: 80,
      color: bgColor ?? AppColor.appbarColor,
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.containerPadding, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onTapBack ??
                    () {
                      Get.back();
                    },
                child: leadingIcon ??
                    SvgPicture.asset(
                      "assets/icons/back_arrow.svg",
                      height: 30,
                      width: 30,
                    ),
              ),
              const SizedBox(
                width: 15,
              ),
              H1Text(
                  tittle: tittle,
                  tittleColor: AppColor.appTitleTextColor,
                  textSize: Responsive.isMobile(context)
                      ? 19
                      : AppTextSize.h2Textsize),
            ],
          ),
          //^ Action Buttons
          addActionBtn == false
              ? const SizedBox.shrink()
              : GestureDetector(onTap: ontapActionBtn, child: actionBtn1)
        ],
      ),
    );
  }
}
