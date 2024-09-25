// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

InputDecoration formFieldDeocration(
    {required String hintText,
    Color? fieldErrorBorderColor,
    EdgeInsetsGeometry? contentPaddingg}) {
  return InputDecoration(
    filled: true,
    fillColor: const Color(0xFFF4F7F7),
    counterText: "",
    hintText: hintText,
    hintStyle: GoogleFonts.outfit(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF8595AB),
    ),
   
    contentPadding: contentPaddingg ??
        const EdgeInsets.symmetric(horizontal: 11, vertical: 18),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF8595AB)),
        borderRadius: BorderRadius.circular(12)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF8595AB)),
        borderRadius: BorderRadius.circular(12)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: fieldErrorBorderColor ?? AppColor.textFiledErrorBorderColor),
        borderRadius: BorderRadius.circular(12)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12)),
  );
}
