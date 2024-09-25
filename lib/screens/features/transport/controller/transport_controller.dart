import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../core/handler/dio_handler.dart';
import '../../../../core/urls/app_urls.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../model/transport_list_model.dart';

class TranspostController extends GetxController {
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

  Future getTransportList() async {
    // transportList.value = [];

    // log(Api.getTransportURL(
    //     employeeId: OtpScreen.employeeInfo!.employeeId.toString()));
    try {
      final response = await dio.get(
        Api.getTransportURL(
            // employeeId: OtpScreen.employeeInfo!.employeeId.toString()),
            employeeId: "1"),
      );
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
    update();
  }
}
