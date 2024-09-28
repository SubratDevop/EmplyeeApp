import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:employee_app/screens/common_screen/otp_screen/otp_screen.dart';
import 'package:get/get.dart';

import '../../../../core/urls/app_urls.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../model/grievance_model.dart';
import '../model/grievance_type_model.dart';

class GrievanceController extends GetxController {
  final dio = Dio();

  //* On init method
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    await getGrievanceTypeList();
    await getGrievanceList("", "");
  }

  //^ select  Grievance Type

  RxList<GrievanceData> grievanceTypes = <GrievanceData>[].obs;
  var selectedGrievanceName = "".obs;
  var selectedGrievanceId = "".obs;

  void grievanceSelected(String value) {
    selectedGrievanceId.value = value;
    getGrievanceList("", selectedGrievanceName.value);
    log(selectedGrievanceName.value.toString());
    update();
  }

  Future getGrievanceTypeList() async {
    try {
      final response = await dio.get(
        Api.getGrievanceTypeURL(),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = GrievanceTypeModel.fromJson(response.data);
        grievanceTypes.value = data.data!;
        selectedGrievanceId.value = grievanceTypes[0].lookupId!.toString();
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    update();
  }

//^ get Grievance
  RxList<GrievanceList> grievanceList = <GrievanceList>[].obs;
  var loadingGrivance = false.obs;

  Future getGrievanceList(String? grievanceId, String? grievanceType) async {
    loadingGrivance.value = true;
    log(OtpScreen.employeeInfo!.employeeId.toString());
    grievanceList.value = [];
    await Future.delayed(const Duration(seconds: 1));
    try {
      final response = await dio.get(
        Api.getGrievanceURL(
            grievanceId: grievanceId,
            grievanceType: grievanceType,
            employeeId: OtpScreen.employeeInfo!.employeeId.toString()),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        GrievanceModel result = GrievanceModel.fromJson(response.data);
        grievanceList.value = result.grievanceList!;
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    loadingGrivance.value = false;
    update();
  }
}
