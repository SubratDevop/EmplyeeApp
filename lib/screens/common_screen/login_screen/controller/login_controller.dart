import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/handler/dio_handler.dart';
import '../../../../core/urls/app_urls.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../login_screen.dart';
import '../model/generate_otp_model.dart';

class LoginController extends GetxController {
  final numberController = TextEditingController();
  final dio = Dio();
  var generatingOTP = false.obs;

  @override
  void onInit() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // statusBarColor: AppColor.primaryColor, // Set the status bar color here
      statusBarColor: Color(0xFF7CB5EB), // Set the status bar color here
      statusBarIconBrightness: Brightness.dark, // Set text and icons color
    ));

    super.onInit();
  }

  generateOtp() async {
    generatingOTP.value = true;

    try {
      final response =
          await dio.post(Api.generateOtpURL(mobileNo: numberController.text),
              options: Options(
                method: 'POST',
              ));
      if (response.statusCode == 200) {
        var result = GenerateOtpModel.fromJson(response.data);
        if (result.status == true) {
          LoginScreen.userMobileNo = numberController.text;
          Get.toNamed('/OtpScreen');
          CustomSnackbar.showSnackbar(Get.context!, result.message!,
              snackBartype: Status.success);
        } else {
          CustomSnackbar.showSnackbar(Get.context!,
              'Failed to send OTP with error code : ${response.statusCode}',
              snackBartype: Status.failed);
        }
      }
    } on DioException catch (e) {
      final errorMessage = DioErrorHandler.handleDioError(e);
      CustomSnackbar.showSnackbar(
          Get.context!, 'Failed to send OTP with error code : $errorMessage',
          snackBartype: Status.failed);
    } catch (error) {
      Exception(error);
    }
    generatingOTP.value = false;
    update();
  }
}
