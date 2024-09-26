import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../../../core/urls/app_urls.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/widgets/app_snackbar.dart';
import '../../../../grievance/model/grievance_type_model.dart';
import '../model/referral_list_model.dart';

class RequestController extends GetxController {
  final dio = Dio();

  //* On init method
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    await getReferralTypeList();
  }

  //^ select  Referral Type

  RxList<GrievanceData> referralTypes = <GrievanceData>[].obs;
  var selectedReferralName = "".obs;
  var selectedReferralId = "".obs;

  void grievanceSelected(String value) {
    selectedReferralId.value = value;
   getReferralList(referralPriority: selectedReferralName.value);
    update();
  }

  Future getReferralTypeList() async {
    try {
      final response = await dio.get(
        Api.getreferralTypeURL(), //! same for all type sof referrals
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = GrievanceTypeModel.fromJson(response.data);
        referralTypes.value = data.data!;
        selectedReferralId.value = referralTypes[0].lookupId!.toString();
        getReferralList(referralPriority: selectedReferralName.value);
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    update();
  }

//^ get Grievance
  RxList<ReferralList> geReferralList = <ReferralList>[].obs;
  var loadingReferral = false.obs;

  Future getReferralList(
      {String? employeeName = "",
      String? departmentName = "",
      String? referralPriority = ""}) async {
    loadingReferral.value = true;

    geReferralList.value = [];
    await Future.delayed(const Duration(seconds: 1));
    try {
      final response = await dio.get(
        Api.referralListListURL(
            employeeName: employeeName,
            departmentName: departmentName,
            referralPriority: referralPriority),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        ReferralListListModel result =
            ReferralListListModel.fromJson(response.data);
        geReferralList.value = result.referralList!;
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    loadingReferral.value = false;
    update();
  }
}
