// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

//* Text Sizes
class AppTextSize {
  static double h1Textsize = 24.0;
  static double h2Textsize = 20.0;
  static double h3TextSize = 17.0;
  static double body1TextSize = 14.0;
  static double body2TextSize = 12.0;
  static double body3TextSize = 10.0;
  static double linkTextSize = 14.0;
  //~ splash screen
  static double splashTextSize = 16.0;
}

//* font weights
class AppFontWeights {
  static FontWeight splashTextWeight1 = FontWeight.w700;
  static FontWeight splashTextWeight2 = FontWeight.w500;
}

//* APP Custom TextWidgets

//~ Splash Text

class SplashText extends StatelessWidget {
  SplashText(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textWeight,
      this.textOverflow,
      this.textSize});

  String tittle;
  Color? tittleColor;
  int? maxTextlines;
  TextAlign? alignnment;
  double? textSize;
  FontWeight? textWeight;
  TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: textSize ?? AppTextSize.splashTextSize,
        fontWeight: textWeight ?? FontWeight.w700,
        color: tittleColor ?? AppColor.splashTextColor1,
      ),
    );
  }
}

//~ Body1_Text

class Body1Text extends StatelessWidget {
  Body1Text(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textWeight,
      this.textOverflow,
      this.textSize});

  String tittle;
  Color? tittleColor;
  int? maxTextlines;
  TextAlign? alignnment;
  double? textSize;
  FontWeight? textWeight;
  TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      textAlign: alignnment ?? TextAlign.start,
      style: GoogleFonts.poppins(
        fontSize: textSize ?? AppTextSize.body1TextSize,
        fontWeight: textWeight ?? FontWeight.w400,
        color: tittleColor ?? AppColor.splashTextColor1,
      ),
    );
  }
}

//~ Body2_Text

class Body2Text extends StatelessWidget {
  Body2Text(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textWeight,
      this.textOverflow,
      this.textSize});

  String tittle;
  Color? tittleColor;
  int? maxTextlines;
  TextAlign? alignnment;
  double? textSize;
  TextOverflow? textOverflow;
  FontWeight? textWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: textSize ?? AppTextSize.body2TextSize,
        fontWeight: textWeight ?? FontWeight.w400,
        color: tittleColor ?? AppColor.splashTextColor1,
      ),
    );
  }
}
//~ Body3_Text

class Body3Text extends StatelessWidget {
  Body3Text(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textWeight,
      this.textOverflow,
      this.textSize});

  String tittle;
  Color? tittleColor;
  int? maxTextlines;
  TextAlign? alignnment;
  double? textSize;
  FontWeight? textWeight;
  TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      textAlign: alignnment ?? TextAlign.start,
      style: GoogleFonts.poppins(
        fontSize: textSize ?? AppTextSize.body3TextSize,
        fontWeight: textWeight ?? FontWeight.w500,
        color: tittleColor ?? AppColor.splashTextColor1,
      ),
    );
  }
}
//~ Body4_Text

class Body4Text extends StatelessWidget {
  Body4Text(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textWeight,
      this.textOverflow,
      this.textSize});

  String tittle;
  Color? tittleColor;
  int? maxTextlines;
  TextAlign? alignnment;
  double? textSize;
  FontWeight? textWeight;
  TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      textAlign: alignnment ?? TextAlign.start,
      style: GoogleFonts.outfit(
        fontSize: textSize ?? AppTextSize.body3TextSize + 2,
        fontWeight: textWeight ?? FontWeight.w500,
        color: tittleColor ??const  Color(0xFF857B94),
      ),
    );
  }
}

//~ H1_Text

class H1Text extends StatelessWidget {
  H1Text(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textWeight,
      this.textOverflow,
      this.textSize});

  String tittle;
  Color? tittleColor;
  int? maxTextlines;
  TextAlign? alignnment;
  double? textSize;
  FontWeight? textWeight;
  TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: textSize ?? AppTextSize.h1Textsize - 3,
        fontWeight: textWeight ?? FontWeight.w600,
        color: tittleColor ?? AppColor.splashTextColor1,
      ),
    );
  }
}
//~ H2_Text

class H2Text extends StatelessWidget {
  H2Text(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textWeight,
      this.textOverflow,
      this.textSize});

  String tittle;
  Color? tittleColor;
  int? maxTextlines;
  TextAlign? alignnment;
  double? textSize;
  FontWeight? textWeight;
  TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: textSize ?? AppTextSize.h2Textsize,
        fontWeight: textWeight ?? FontWeight.w600,
        color: tittleColor ?? AppColor.splashTextColor1,
      ),
    );
  }
}
//~ H3_Text

class H3Text extends StatelessWidget {
  H3Text(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textWeight,
      this.textOverflow,
      this.textSize});

  String tittle;
  Color? tittleColor;
  int? maxTextlines;
  TextAlign? alignnment;
  double? textSize;
  FontWeight? textWeight;
  TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: textSize ?? AppTextSize.h3TextSize,
        fontWeight: textWeight ?? FontWeight.w600,
        color: tittleColor ?? AppColor.splashTextColor1,
      ),
    );
  }
}

//~ Link_Text

class LinkText extends StatelessWidget {
  LinkText(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textWeight,
      this.textOverflow,
      this.textSize});

  String tittle;
  Color? tittleColor;
  int? maxTextlines;
  TextAlign? alignnment;
  double? textSize;
  FontWeight? textWeight;
  TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      textAlign: alignnment ?? TextAlign.start,
      style: GoogleFonts.poppins(
        fontSize: textSize ?? AppTextSize.linkTextSize,
        fontWeight: textWeight ?? FontWeight.w500,
        color: tittleColor ?? AppColor.linkTextColor,
      ),
    );
  }
}

//~ Search Patient

class SearchPatientText extends StatelessWidget {
  SearchPatientText(
      {super.key,
      required this.tittle,
      this.alignnment,
      this.maxTextlines,
      this.tittleColor,
      this.textWeight,
      this.textOverflow,
      this.textSize});

  String tittle;
  Color? tittleColor;
  int? maxTextlines;
  TextAlign? alignnment;
  double? textSize;
  FontWeight? textWeight;
  TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxTextlines,
      textAlign: alignnment ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: textSize ?? AppTextSize.h2Textsize,
        fontWeight: textWeight ?? FontWeight.w700,
        color: tittleColor ?? AppColor.searchPatientTextColor,
      ),
    );
  }
}
