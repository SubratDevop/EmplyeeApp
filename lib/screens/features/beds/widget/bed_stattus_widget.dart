import 'package:employee_app/core/extesnions/sizedbox.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/app_text_size.dart';

Widget besStatusWidget({required String tittle, required Color statusColor}) {
  return Row(
    children: [
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: statusColor),
      ),
      07.kW,
      H3Text(
        tittle: tittle,
        tittleColor: Colors.black,
        textWeight: FontWeight.w500,
        textSize: AppTextSize.h2Textsize - 2,
      )
    ],
  );
}
