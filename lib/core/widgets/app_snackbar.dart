import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

import '../resources/app_text_size.dart';
import '../utils/enums.dart';
import '../utils/utils.dart';

class CustomSnackbar {
  static void showSnackbar(BuildContext context, String message,
      {required Status snackBartype, int? durationInSec}) {
    final snackbar = SnackBar(
      content: Text(message),

      duration: Duration(
          seconds: durationInSec ?? 3), // Adjust the duration as needed
      // action: SnackBarAction(
      //   label: 'Close',
      //   onPressed: () {
      //     // Code to execute when the "Close" button is pressed
      //   },
      // ),
      // behavior: SnackBarBehavior.floating,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
      backgroundColor: snackBartype == Status.success
          ? Colors.green
          : snackBartype == Status.failed
              ? Colors.red
              : snackBartype == Status.warning
                  ? Colors.yellow
                  : snackBartype == Status.loading
                      ? Colors.orange
                      : null, // Customize the background color
      elevation: 8.0, // Customize the elevation
      // margin: EdgeInsets.all(16.0), // Customize the margin
      // padding: EdgeInsets.all(12.0), // Customize the padding
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackbar,
    );
  }

  static void showGetSnackbar({
    required Status? tittle,
    required String message,
    required Status? snackBartype,
  }) {
    Get.snackbar(
      "-",
      "",
      messageText: H1Text(
        tittle: message,
        tittleColor: Colors.white.withOpacity(0.8),
      ),
      titleText: H1Text(
        tittle: tittle == Status.success
            ? "Success"
            : tittle == Status.warning
                ? "Warning"
                : tittle == Status.failed
                    ? "Failed"
                    : "-",
        tittleColor: Colors.white.withOpacity(0.9),
        textWeight: FontWeight.w700,
      ),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3), // Adjust the duration as needed
      colorText: Colors.white.withOpacity(0.8),
      backgroundColor: snackBartype == Status.success
          ? Colors.green
          : snackBartype == Status.failed
              ? Colors.red
              : Colors.orange, // Customize the background color
      // elevation: 8.0, // Customize the elevation
      // margin: EdgeInsets.all(16.0), // Customize the margin
      // padding: EdgeInsets.all(12.0), // Customize the padding
    );

    // ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void successToastification({required BuildContext context}) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      // style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
      // you can also use RichText widget for title and description parameters
      description: H1Text(
        tittle: "Order has been created successfully",
        textSize: 14,
        tittleColor: Colors.white,
        maxTextlines: 2,
      ),

      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 800),
      icon: Container(
        height: 30,
        width: 30,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5)),
        child: SvgPicture.asset(
          Utils.getImagePath(
              name: "check",
              type: AssetFolderType.icons,
              format: ImageFormat.svg),
        ),
      ),
      // primaryColor: Colors.white,
      backgroundColor: const Color(0xFF29BF80),
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 08),
      borderRadius: BorderRadius.circular(
        8,
      ),

      boxShadow: [
        BoxShadow(
          color: const Color(0xFF031429).withOpacity(0.12),
          blurRadius: 16,
          offset: const Offset(0, 4),
          spreadRadius: 0,
        )
      ],
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.none,
      closeOnClick: false,
      // pauseOnHover: true,
      dragToClose: true,

      // applyBlurEffect: true,
      // callbacks: ToastificationCallbacks(
      //   onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
      //   onCloseButtonTap: (toastItem) =>
      //       print('Toast ${toastItem.id} close button tapped'),
      //   onAutoCompleteCompleted: (toastItem) =>
      //       print('Toast ${toastItem.id} auto complete completed'),
      //   onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
      // ),
    );
  }

//! Session Expired SnackBar
  // static void sessionExpiredSnackBar(BuildContext context, String message,
  //     {required Status snackBartype, required void Function() logoutTap}) {
  //   final snackbar = SnackBar(
  //     content: Text(message),

  //     duration: const Duration(days: 365), // Adjust the duration as needed
  //     action: SnackBarAction(
  //       label: 'Logout',
  //       onPressed: logoutTap,
  //     ),
  //     behavior: SnackBarBehavior.floating,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     backgroundColor: Colors.red, // Customize the background color
  //     elevation: 8.0, // Customize the elevation
  //     // margin: EdgeInsets.all(16.0), // Customize the margin
  //     // padding: EdgeInsets.all(12.0), // Customize the padding
  //   );

  //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
  // }
}
