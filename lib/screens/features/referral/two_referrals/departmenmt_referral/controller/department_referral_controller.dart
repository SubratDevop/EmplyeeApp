import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:employee_app/screens/common_screen/otp_screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/handler/dio_handler.dart';
import '../../../../../../core/urls/app_urls.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/widgets/app_snackbar.dart';
import '../../../../beds/model/bed_service_center_model.dart';
import '../../../../grievance/model/grievance_type_model.dart';
import '../../../../grievance/model/save_grievance_model.dart';
import '../../../referral_tab_screen.dart';
import '../../../screens/request/controller/request_controller.dart';
import '../model/bed_no_model.dart';

class DepartmentReferralController extends GetxController {
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
    await getPriorityTypeList();
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

  //^ select  Priority Type

  RxList<GrievanceData> priorityTypes = <GrievanceData>[].obs;
  var selectedPriorityName = "".obs;
  var selectedPriorityId = "".obs;

  void prioritySelected(String value) {
    selectedPriorityId.value = value;
    update();
  }

  Future getPriorityTypeList() async {
    try {
      final response = await dio.get(
        Api.getreferralTypeURL(), //! same for all type sof referrals
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = GrievanceTypeModel.fromJson(response.data);
        priorityTypes.value = data.data!;
        selectedPriorityId.value = priorityTypes[0].lookupId!.toString();
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

//^ save department Referral

  var savingDepartmentReferral = false.obs;

  saveDepartmentReferral() async {
    savingDepartmentReferral.value = true;
    await Future.delayed(const Duration(seconds: 1));

    try {
      final headers = {
        "Content-Type": "application/json",
      };
      var data = {
        "referralType": "Department Referral",
        "consultantName":
            doctorNameController.text, // " " in case of Consultant
        "departmentName": selectDepartmentTypeName
            .value, //"Cardiology", // " " in case of department
        "patientMrno": phrnController.text, // "MRNO39308949",
        "patientName": patientNameController.text, // "Smita Dey",
        "bedNo": selectBedNo.value, // "B001",
        "referralPriority": selectedPriorityName.value, // "Emergency",
        "remarks": remarkController
            .text, // "Urgent case, requires immediate attention",
        "referralDateTime": selectOnSiteDate.value
            .replaceFirst(' ', 'T'), // "27-09-2024T10:30",
        "isActive": true,
        "referralStatus": "Pending",
        "bedId": int.parse(selectBedNoId.value), // 1,
        "bedStatus": "Blocked",
        "createdBy": OtpScreen.employeeInfo!.employeeId, // 1,
        "updatedBy": OtpScreen.employeeInfo!.employeeId // 1
      };

      log(jsonEncode(data));
      final response = await dio.post(Api.saveReferralURL(),
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
            const ReferralTabScreen(), // The screen you want to navigate to
            predicate: (route) {
              return route.settings.name == '/HomeScreen';
            },
          );
          final requestController = Get.put(RequestController());

          requestController.geReferralList();
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
    savingDepartmentReferral.value = false;
    update();
  }
}
