// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_text_size.dart';
import 'form_container_decoraion.dart';

class ContainerWithTextField extends StatelessWidget {
  const ContainerWithTextField({super.key, this.hintText, this.bgcolorr});

  final String? hintText;
  final Color? bgcolorr;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
      ),
      decoration:
          formContainerDecoration(bgcolor: bgcolorr ?? Colors.transparent),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText ?? "0.0",
            hintStyle: GoogleFonts.outfit(
              fontSize: AppTextSize.body1TextSize,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF597173),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
