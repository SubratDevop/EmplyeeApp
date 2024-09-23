import 'package:flutter/material.dart';

import '../resources/form_container_decoraion.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({super.key, required this.textWidget});
  final Widget? textWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 15),
      decoration: formContainerDecoration(),
      child: textWidget,
    );
  }
}
