import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/app_text_size.dart';
import '../responsive/responsive_size.dart';

Widget dataNOtFoundWidget(
    {required BuildContext context, required String tittle}) {
  return Column(
    children: [
      SvgPicture.asset(
        "assets/images/robot.svg",
        height: Responsive.isMobile(context)
            ? 200
            : Responsive.isMediumMobile(context)
                ? 270
                : Responsive.isLargeMobile(context)
                    ? 300
                    : 500,
        width: Responsive.isMobile(context)
            ? 200
            : Responsive.isLargeMobile(context)
                ? 270
                : Responsive.isLargeMobile(context)
                    ? 300
                    : 500,
      ),
      // SizedBox(
      //   height: ScreenSize.width(context) <= 801 ? 10 : 20,
      // ),
      Body1Text(
        alignnment: TextAlign.center,
        tittle: tittle,
        tittleColor: const Color(0xFF465558),
      ),
    ],
  );
}
