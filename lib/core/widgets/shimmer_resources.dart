import 'package:flutter/material.dart';
import '../resources/screen_size.dart';

class ShimmerResources {
  static final baseColor = Colors.grey[300]!;
  static const borderRadius = 05.0;
  static final highlightColor = Colors.grey[100]!;
  static const heightt = 20.0;

  static dividerShimmer(BuildContext context) {
    return Divider(color: baseColor);
  }

  static small1WidthCcontainer(BuildContext? context,
      {double? containerHeight, double? width}) {
    return Container(
      width:width ?? ScreenSize.width(context!) * 0.242, // 100
      height: containerHeight ?? heightt,
      decoration: containerDecoration(),
    );
  }

  static small2WidthCcontainer(BuildContext? context,
      {double? containerHeight,double? width}) {
    return Container(
      width:width ?? ScreenSize.width(context!) * 0.291, // 120
      height: containerHeight ?? heightt,
      decoration: containerDecoration(),
    );
  }

  static smallWidthCcontainer(BuildContext? context,
      {double? containerHeight,double? width}) {
    return Container(
      width:width ?? ScreenSize.width(context!) * 0.365, // 150
      height: containerHeight ?? heightt,
      decoration: containerDecoration(),
    );
  }

  static middleWidth1Ccontainer(BuildContext? context,
      {double? containerHeight,double? width}) {
    return Container(
      width:width ?? ScreenSize.width(context!) * 0.436, //180
      height: containerHeight ?? heightt,
      decoration: containerDecoration(),
    );
  }

  static middleWidth2Ccontainer(BuildContext? context,
      {double? containerHeight,double? width}) {
    return Container(
      width:width ?? ScreenSize.width(context!) * 0.53, //2containerHeight
      height: containerHeight ?? heightt,
      decoration: containerDecoration(),
    );
  }

  static middleWidth3Ccontainer(BuildContext? context,
      {double? containerHeight,double? width}) {
    return Container(
      width:width ?? ScreenSize.width(context!) * 0.606, // 250
      height: containerHeight ?? heightt,
      decoration: containerDecoration(),
    );
  }

  static fullWidthCcontainer(BuildContext? context, {double? containerHeight}) {
    return Container(
      width: ScreenSize.width(context!),
      height: containerHeight ?? heightt,
      decoration: containerDecoration(),
    );
  }

  static containerDecoration() {
    return BoxDecoration(
        color: baseColor, borderRadius: BorderRadius.circular(borderRadius));
  }
}
