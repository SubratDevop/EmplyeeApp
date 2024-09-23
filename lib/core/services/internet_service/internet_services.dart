import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkServiceController extends GetxController {
  // ?      0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
  var connectionType = 0.obs;
  // var tag = 0.obs;

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();

    getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      connectionType.value = 1;
      // Get.snackbar("Hurraay", "", backgroundColor: Colors.green);
      Get.closeCurrentSnackbar();
      // Get.snackbar(
      //   "Online",
      //   "E",
      //   backgroundColor: Colors.green[50],
      //   isDismissible: false,
      // );
      // Navigator.pop(Get.context!);
    } else {
      // Get.offAll(NoInternetScreen());
      //  Get.to(() => NoInternetScreen());

      // showDialog(
      //   context: Get.context!,
      //   barrierDismissible: false,
      //   builder: (context) {
      //     return AlertDialog(
      //       shape:
      //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      //       content: Column(
      //         children: [
      //           SizedBox(
      //             height: 50,
      //             width: ScreenSize.width(context) - 100,
      //             child: Lottie.asset('Assets/lottie/no_data.json'),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           SubTittleText(
      //             tittle: "No Connection",
      //             textSize: 18,
      //             tittleColor: kPrimaryColor,
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           DescriptionText(
      //               tittle:
      //                   "No Internet Connection found. Chaeck your connection or try again"),
      //           SizedBox(
      //             height: 5,
      //           ),
      //           SubmitButtontn(
      //             text: "Try Again",
      //             onTap: () {},
      //             backgroundColor: kPrimaryColor.withOpacity(0.5),
      //           )
      //         ],
      //       ),
      //     );
      //   },
      // );

      // Get.to(NoInternetScreen());
      Get.closeCurrentSnackbar();

      Get.snackbar("You're offline", "Check your connection and try again",
          backgroundColor: Colors.red[50],
          isDismissible: false,
          duration: const Duration(days: 500));
      //     backgroundColor: Colors.red,
      //     isDismissible: false,
      //     icon: Icon(Icons.dangerous),
      //     snackPosition: SnackPosition.TOP,
      //     boxShadows: [
      //       BoxShadow(color: Colors.redAccent),
      //       BoxShadow(color: Colors.red),
      //       BoxShadow(color: Colors.redAccent),

      //     ],
      //     snackStyle: SnackStyle.FLOATING,

      //     );
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
