import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../core/urls/app_urls.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../model/bed_service_center_list_model.dart';
import '../model/bed_service_center_model.dart';

class BedController extends GetxController {
  final dio = Dio();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    await getBedTypeList();
    await getBedServiceCenterList("", "0");
  }

  //^ select  Grievance Type

  RxList<BedServiceCenterData> bedTypes = <BedServiceCenterData>[].obs;
  var selectBedServiceCenterName = "".obs;
  var selectBedServiceCenterId = "".obs;

  void servceSenterSelected(String value) {
    selectBedServiceCenterId.value = value;
    getBedServiceCenterList(selectBedServiceCenterName.value, "0");
    log(selectBedServiceCenterName.value.toString());
    update();
  }

  Future getBedTypeList() async {
    try {
      final response = await dio.get(
        Api.getBedServiceCenterURL(),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = BedServiceCenterModel.fromJson(response.data);
        bedTypes.value = data.data!;
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    update();
  }

//^ get Bed List
  RxList<BedMasterList> bedList = <BedMasterList>[].obs;
  var loadingBeds = false.obs;

  Future getBedServiceCenterList(String? serviceCenter, String? page) async {
    loadingBeds.value = true;
    bedList.value = [];
    log("getBedServiceCenterList method called");
    await Future.delayed(const Duration(seconds: 1));
    try {
      final response = await dio.get(
        Api.bedServiceCenterListURL(serviceCenter: serviceCenter, page: page),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        BedServiceCenterListModel result =
            BedServiceCenterListModel.fromJson(response.data);
        bedList.value = result.bedMasterList!;
        log(bedList[0].bedMasterId.toString());
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    loadingBeds.value = false;
    update();
  }
}
