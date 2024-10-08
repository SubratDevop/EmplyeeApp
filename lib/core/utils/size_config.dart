import 'package:flutter/material.dart';

class SizeConfigs {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
    orientation = mediaQueryData!.orientation;
    // On iPhone 11 the defaultSize = 10 almost
    // So if the screen size increase or decrease then our defaultSize also vary
    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * 0.024
        : screenWidth! * 0.024;
  }
}

double getFont(double size) {
  double defaultsSize = SizeConfigs.defaultSize! * size;
  return (defaultsSize / 10);
}

// Get the proportionate height as per screen size
double getHeight(double inputHeight) {
  double screenHeight = SizeConfigs.screenHeight!;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate width as per screen size
double getWidth(double inputWidth) {
  double screenWidth = SizeConfigs.screenWidth!;
  // 375 is the layout width that Figma provides
  return (inputWidth / 375.0) * screenWidth;
}
