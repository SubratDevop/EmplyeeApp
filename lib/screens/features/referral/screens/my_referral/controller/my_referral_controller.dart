import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../../core/urls/app_urls.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/widgets/app_snackbar.dart';
import '../../../../grievance/model/grievance_type_model.dart';
import '../../request/model/referral_list_model.dart';

class MyMyReferralController extends GetxController {
  final dio = Dio();

  //* On init method
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    await getMyReferralTypeList();
  }

  //^ select  MyReferral Type

  RxList<GrievanceData> myReferralTypes = <GrievanceData>[].obs;
  var selectedMyReferralName = "".obs;
  var selectedMyReferralId = "".obs;

  void grievanceSelected(String value) {
    selectedMyReferralId.value = value;
    getMyReferralList(
      referralPriority: selectedMyReferralName.value,
      // employeeName: OtpScreen.employeeInfo!.employeeName,   //! Login details
      employeeName: "subrat Rautaray",
    );
    update();
  }

  Future getMyReferralTypeList() async {
    try {
      final response = await dio.get(
        Api.getreferralTypeURL(), //! same for all type sof referrals
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = GrievanceTypeModel.fromJson(response.data);
        myReferralTypes.value = data.data!;
        selectedMyReferralId.value = myReferralTypes[0].lookupId!.toString();
        getMyReferralList(referralPriority: selectedMyReferralName.value);
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    update();
  }

//^ get Grievance
  RxList<ReferralList> myReferralList = <ReferralList>[].obs;
  var loadingMyReferral = false.obs;

  Future getMyReferralList(
      {String? employeeName = "",
      String? departmentName = "",
      String? referralPriority = ""}) async {
    loadingMyReferral.value = true;

    myReferralList.value = [];
    await Future.delayed(const Duration(seconds: 1));
    try {
      final response = await dio.get(
        Api.referralListListURL(
            // employeeName: OtpScreen.employeeInfo!.employeeName,   //! Login details
            employeeName: "subrat Rautaray",
            departmentName: "",
            referralPriority: referralPriority),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        ReferralListListModel result =
            ReferralListListModel.fromJson(response.data);
        myReferralList.value = result.referralList!;
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    loadingMyReferral.value = false;
    update();
  }
}
