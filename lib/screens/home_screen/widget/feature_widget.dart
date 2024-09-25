import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/app_text_size.dart';

class FeatureWidget extends StatelessWidget {
  FeatureWidget({super.key, required this.tittle, required this.iconPath});

  String tittle;
  String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF5151D6),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 30,
            width: 30,
          ),
          7.kH,
          H3Text(
            tittle: tittle,
            tittleColor: Colors.white,
            textWeight: FontWeight.w300,
            letterSpace: 1,
            textSize: 13,
          )
        ],
      ),
    );
  }
}
