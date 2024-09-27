import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:employee_app/screens/features/beds/controller/bed_controller.dart';
import 'package:employee_app/screens/features/beds/screens/beds_screen.dart';
import 'package:employee_app/screens/features/referral/two_referrals/departmenmt_referral/model/bed_no_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/urls/app_urls.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/widgets/app_snackbar.dart';
import '../../../../core/handler/dio_handler.dart';
import '../../../common_screen/otp_screen/otp_screen.dart';
import '../../grievance/model/save_grievance_model.dart';
import '../model/bed_service_center_model.dart';
import '../model/mark_bed_model.dart';

class BedActionController extends GetxController {
  final dio = Dio();
  final phrnController = TextEditingController();
  final remarkController = TextEditingController();
  final doctorNameController = TextEditingController();
  final patientNameController = TextEditingController();
  final bedNoController = TextEditingController();

  //* On init method
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    await getDepatrtmentTypeList();
    await getMarkBedList();
  }

  //^ select  Service center Type

  RxList<BedServiceCenterData> departmentTypes = <BedServiceCenterData>[].obs;
  var selectDepartmentTypeName = "".obs;
  var selectDepartmentTypeId = "".obs;

  void departmentTypeSelected(String value) {
    selectDepartmentTypeId.value = value;
    log(selectDepartmentTypeName.value);
    bedNos.clear();
    getBedNosList();
    update();
  }

  Future getDepatrtmentTypeList() async {
    try {
      final response = await dio.get(
        Api.getBedServiceCenterURL(),
      );
      if (response.statusCode == 200) {
        final data = BedServiceCenterModel.fromJson(response.data);
        departmentTypes.value = data.data!;
        selectDepartmentTypeId.value = departmentTypes[0].lookupId.toString();
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    update();
  }

  //^ select  Bed No

  RxList<BedMasterList> bedNos = <BedMasterList>[].obs;
  var selectBedNo = "".obs;
  var selectBedNoId = "".obs;

  void bedNoSelected(String value) {
    selectBedNoId.value = value;
    update();
  }

  getBedNosList() async {
    // selectDepartmentTypeName();
    try {
      final response = await dio.get(
        Api.getReferralBedNoURL(
            serviceCenter: selectDepartmentTypeName.value == "--Select--"
                ? "0"
                : selectDepartmentTypeName.value),
      );
      if (response.statusCode == 200) {
        final data = BedNoModel.fromJson(response.data);
        bedNos.value = data.bedMasterList!;
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    update();
  }

  //^ select  Mark Bed Type

  RxList<MarkBedList> markBedTypes = <MarkBedList>[].obs;
  var selectedmarkBedName = "".obs;
  var selectedmarkBedId = "".obs;

  void markBedSelected(String value) {
    selectedmarkBedId.value = value;
    update();
  }

  Future getMarkBedList() async {
    try {
      final response = await dio.get(
        Api.getMarkBedURL(
            bedStatus: BedsScreen.selectedBedInfo!
                .bedStatus!), //! same for all type sof referrals
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = MarkBedModel.fromJson(response.data);
        markBedTypes.value = data.data!;
        selectedmarkBedId.value = markBedTypes[0].id!.toString();
      }
    } on DioException catch (error) {
      CustomSnackbar.showSnackbar(Get.context!, '${error.message}',
          snackBartype: Status.failed);
    }
    update();
  }

//^ calander variables
  var selectOnSiteDate = "".obs;
  var selectIncedentDate2 = "".obs;

  DateTime? picked;

  void selectFromDate(DateTime? date) async {
    // selectOnSiteDate.value = date;
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.fromDateTime(date!),
    );

    if (pickedTime != null) {
      date = DateTime(
        picked!.year,
        picked!.month,
        picked!.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    }
    selectOnSiteDate.value = DateFormat('dd-MM-yyyy HH:mm').format(date);
    // log(selectOnSiteDate.value.replaceFirst(' ', 'T'));
  }

  selectingOnSiteDate() async {
    picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectOnSiteDate.value) {
      selectFromDate(picked!);
    }
  }

//^ save Bed Action

  var savingBedAction = false.obs;

  saveBed() async {
    savingBedAction.value = true;
    await Future.delayed(const Duration(seconds: 1));

    try {
      final headers = {
        "Content-Type": "application/json",
      };
      var data = {
        "bedMasterId": BedsScreen.selectedBedInfo!.bedMasterId!, // 1,
        "bedNo": BedsScreen.selectedBedInfo!.bedNo, // "B001",
        "bedType": BedsScreen.selectedBedInfo!.bedType, // "General Bed",
        "serviceCenter":
            BedsScreen.selectedBedInfo!.serviceCenter!, // "Emergency",
        "bedStatus":
            selectedmarkBedName.value, // "Blocked", // pass by drop down
        "patientMrno": phrnController.text, // "MRN421839",
        "patientName": patientNameController.text, // "Shivam Jha",
        "doctorName": doctorNameController.text, //"Hemant kumar",
        "eventDateTime": selectOnSiteDate.value
            .replaceFirst(' ', 'T'), // "25-09-2023T15:30",
        "remarks": remarkController.text, // "this is remakrs",
        "isActiveBedMaster": true,
        "createdBy": OtpScreen.employeeInfo!.employeeId, // 1,
        "updatedBy": OtpScreen.employeeInfo!.employeeId // 1
      };

      log(jsonEncode(data));
      final response = await dio.post(Api.saveBedURL(),
          data: data,
          options: Options(
            headers: headers,
            method: 'POST',
          ));

      if (response.statusCode == 200) {
        var result = SaveGrievanceModel.fromJson(response.data);

        if (result.status == true) {
          await Future.delayed(const Duration(seconds: 2));

          Get.offAll(
            const BedsScreen(), // The screen you want to navigate to
            predicate: (route) {
              return route.settings.name == '/HomeScreen';
            },
          );
          final requestController = Get.put(BedController());

          requestController.bedList();
          // Get.back();
          CustomSnackbar.showSnackbar(Get.context!, result.message!,
              snackBartype: Status.success);
          update();
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
    savingBedAction.value = false;
    update();
  }
}
