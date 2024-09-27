import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../core/handler/dio_handler.dart';
import '../../../../core/urls/app_urls.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../common_screen/otp_screen/otp_screen.dart';
import '../model/transport_list_model.dart';

class TransportController extends GetxController {
  final dio = Dio();

  //* On init method
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    await getTransportList();
  }

//^ get Grievance
  RxList<TransportList> transportList = <TransportList>[].obs;
  var loadingTransport = false.obs;
  Future getTransportList() async {
    loadingTransport.value = true;
    await Future.delayed(const Duration(seconds: 1));
    // transportList.value = [];

    try {
      final response = await dio.get(Api.getTransportURL(
          employeeId: OtpScreen.employeeInfo!.employeeId.toString()));
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        TransportListModel result = TransportListModel.fromJson(response.data);
        transportList.value = result.transportList!;
      }
    } on DioException catch (e) {
      final errorMessage = DioErrorHandler.handleDioError(e);
      CustomSnackbar.showSnackbar(
          Get.context!, 'Failed to send OTP with error code : $errorMessage',
          snackBartype: Status.failed);
    } catch (error) {
      Exception(error);
    }
    loadingTransport.value = false;
    update();
  }
}
