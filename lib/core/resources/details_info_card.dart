import 'package:flutter/material.dart';

import 'app_text_size.dart';

Widget detailsInfoCard(
    {required tittle,
    required info,
    int? firstFlex,
    int? secondFlex,
    Color? leftTittleColor,
    Color? rightTittleColor,
    Widget? rightWidget,
    Widget? leftWidget}) {
  return Row(
    children: [
      Expanded(
        flex: firstFlex ?? 3,
        child: leftWidget ??
            LinkText(
              tittle: "$tittle :",
              maxTextlines: 2,
              tittleColor: leftTittleColor ?? const Color(0xFF374042),
            ),
      ),
      const SizedBox(
        width: 4,
      ),
      Expanded(
        flex: secondFlex ?? 4,
        child: rightWidget ??
            Body1Text(
                tittle: "$info",
                tittleColor: rightTittleColor ?? const Color(0xFF22292A),
                textOverflow: TextOverflow.ellipsis,
                maxTextlines: 5),
      ),
    ],
  );
}
