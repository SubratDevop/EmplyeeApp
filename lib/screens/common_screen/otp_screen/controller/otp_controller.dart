import 'package:dio/dio.dart';
import 'package:employee_app/core/utils/enums.dart';
import 'package:employee_app/core/widgets/app_snackbar.dart';
import 'package:get/get.dart';

import '../../../../core/handler/dio_handler.dart';
import '../../../../core/urls/app_urls.dart';
import '../../login_screen/login_screen.dart';
import '../model/login_model.dart';
import '../otp_screen.dart';

class OtpController extends GetxController {
  final dio = Dio();

  generateOtp({required String otp}) async {
    print(Api.loginURL(mobileNo: LoginScreen.userMobileNo!, otp: otp));
    try {
      final response = await dio.post(
          Api.loginURL(mobileNo: LoginScreen.userMobileNo!, otp: otp),
          options: Options(
            method: 'POST',
          ));
      if (response.statusCode == 200) {
        var result = LoginModel.fromJson(response.data);
        if (result.status == true) {
          OtpScreen.employeeInfo = result.employeeDetails;
          Get.toNamed('/HomeScreen');
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
    update();
  }
}
