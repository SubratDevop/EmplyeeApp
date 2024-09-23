// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

import '../../resources/app_text_size.dart';
import '../../resources/screen_size.dart';

class LogOutButton extends StatelessWidget {
  final Color? textColor;
  final String? activeText;
  final IconData? activeIcon;
  final VoidCallback onTap;
  final double? tittleTextSize;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? activeColor;
  final EdgeInsets margin;
  double? height;
  double? width;

  LogOutButton(
      {super.key,
      this.height,
      this.width,
      this.activeText,
      this.activeIcon,
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
          color: const Color(0xFFFFEFF1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.logout,
                color: Color(0xFFFF0A54),
              ),
              H3Text(
                  tittle: "Logout",
                  tittleColor: const Color(0xFFFF0A54),
                  textSize: tittleTextSize),
            ],
          ),
        ),
      ),
    );
  }
}
