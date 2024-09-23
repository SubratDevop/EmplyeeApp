// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../resources/app_text_size.dart';
import '../../resources/colors.dart';
import '../../resources/screen_size.dart';

class SubmitButton extends StatelessWidget {
  final String tittle;
  final Color? textColor;
  final String? activeText;
  final IconData? activeIcon;
  final VoidCallback onTap;
  final double? tittleTextSize;
  final Color? backgroundColor;
  double? borderradius;
  final Color? borderColor;
  final Color? activeColor;
  final EdgeInsets margin;
  double? height;
  double? width;
  FontWeight? tittleWeightt;

  SubmitButton(
      {super.key,
      required this.tittle,
      this.height,
      this.width,
      this.tittleWeightt,
      this.activeText,
      this.activeIcon,
      this.borderradius,
      this.textColor,
      this.tittleTextSize,
      required this.onTap,
      this.borderColor,
      this.activeColor,
      this.margin = const EdgeInsets.symmetric(vertical: 7.5),
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? ScreenSize.width(context),
        height: height ?? 45,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.primaryColor,
          borderRadius: BorderRadius.circular(borderradius ?? 13),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
          ),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Color(0x80000000),
          //     blurRadius: 4.0,
          //     offset: Offset(0.0, 2.0), //? Offset(2, 2),
          //   ),
          // ],
          // gradient: btnGradient
        ),
        child: Center(
          child: H3Text(
              tittle: tittle,
              textWeight: tittleWeightt ?? FontWeight.w600,
              tittleColor: textColor ?? AppColor.backgroundColor,
              textSize: tittleTextSize),
        ),
      ),
    );
  }
}
