import 'package:flutter/material.dart';

import '../resources/colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        width: 40,
        child: CircularProgressIndicator(
          color: AppColor.primaryColor,
          strokeWidth: 6,
        ),
      ),
    );
  }
}
