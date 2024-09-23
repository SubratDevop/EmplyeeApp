// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_text_size.dart';
import 'colors.dart';
import 'dimensions.dart';

InputDecoration formFieldDeocration(
    {required String hintText,
    Color? fieldErrorBorderColor,
    EdgeInsetsGeometry? contentPaddingg}) {
  return InputDecoration(
    filled: true,
    fillColor: AppColor.textFiledBgColor,
    counterText: "",
    hintText: hintText,
    hintStyle: GoogleFonts.poppins(
      fontSize: AppTextSize.body1TextSize,
      fontWeight: FontWeight.w400,
      color: AppColor.hintTextColor,
    ),
    contentPadding: contentPaddingg ??
        const EdgeInsets.symmetric(horizontal: 11, vertical: 18),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF3F8AE0)),
        borderRadius:
            BorderRadius.circular(Dimensions.curverContainerRadius - 22)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFCBD6D6)),
        borderRadius:
            BorderRadius.circular(Dimensions.curverContainerRadius - 22)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: fieldErrorBorderColor ?? AppColor.textFiledErrorBorderColor),
        borderRadius:
            BorderRadius.circular(Dimensions.curverContainerRadius - 22)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius:
            BorderRadius.circular(Dimensions.curverContainerRadius - 22)),
  );
}
