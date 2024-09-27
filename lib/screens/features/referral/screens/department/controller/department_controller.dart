import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../../core/urls/app_urls.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/widgets/app_snackbar.dart';
import '../../../../../common_screen/otp_screen/otp_screen.dart';
import '../../../../grievance/model/grievance_type_model.dart';
import '../../request/model/referral_list_model.dart';

class DepartmentController extends GetxController {
  final dio = Dio();

  //* On init method
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    await getDepartmentTypeList();
    getDepartmentList(
      departmentName:
          OtpScreen.employeeInfo!.departmentName, ////! fetch from Login details
      referralPriority: selectedDepartmentName.value,
    );
  }

  //^ select  Referral Type

  RxList<GrievanceData> departmentTypes = <GrievanceData>[].obs;
  var selectedDepartmentName = "".obs;
  var selectedDepartmentId = "".obs;

  void grievanceSelected(String value) {
    selectedDepartmentId.value = value;
    getDepartmentList(
      // departmentName: "ENT",
      departmentName:
          OtpScreen.employeeInfo!.departmentName, ////! fetch from Login details
      referralPriority: selectedDepartmentName.value,
    );
    update();
  }

  Future getDepartmentTypeList() async {
    try {
      final response = await dio.get(
        Api.getreferralTypeURL(), //! same for all type sof referrals
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = GrievanceTypeModel.fromJson(response.data);
        departmentTypes.value = data.data!;
        selectedDepartmentId.value = departmentTypes[0].lookupId!.toString();
        getDepartmentList(
          // departmentName: "ENT",
          departmentName: OtpScreen
              .employeeInfo!.departmentName, ////! fetch from Login details
          referralPriority: selectedDepartmentName.value,
        );
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    update();
  }

//^ get Grievance
  RxList<ReferralList> departmentList = <ReferralList>[].obs;
  var loadingDepartment = false.obs;

  Future getDepartmentList(
      {String? employeeName = "",
      String? departmentName = "",
      String? referralPriority = ""}) async {
    loadingDepartment.value = true;

    departmentList.value = [];
    await Future.delayed(const Duration(seconds: 1));
    try {
      final response = await dio.get(
        Api.referralListListURL(
            employeeName: employeeName,
            // departmentName: "ENT",
            departmentName: departmentName, ////! fetch from Login details
            referralPriority: referralPriority),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        ReferralListListModel result =
            ReferralListListModel.fromJson(response.data);
        departmentList.value = result.referralList!;
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    loadingDepartment.value = false;
    update();
  }
}
