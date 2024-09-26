import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:employee_app/screens/features/grievance/controller/grievance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/handler/dio_handler.dart';
import '../../../../core/urls/app_urls.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../model/grievance_type_model.dart';
import '../model/save_grievance_model.dart';

class NewGrievanceController extends GetxController {
  final dio = Dio();
  final pepoleController = TextEditingController();
  final descriptionController = TextEditingController();
  final grivanceController = Get.put(GrievanceController());

  //* On init method
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    await getGrievanceTypeList();
  }

  //^ select  Grievance Type

  RxList<GrievanceData> grievanceTypes = <GrievanceData>[].obs;
  var selectedGrievanceName = "".obs;
  var selectedGrievanceId = "".obs;

  void grievanceSelected(String value) {
    selectedGrievanceId.value = value;
    update();
  }

  Future getGrievanceTypeList() async {
    try {
      final response = await dio.get(
        Api.getGrievanceTypeURL(),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        GrievanceTypeModel data = GrievanceTypeModel.fromJson(response.data);
        grievanceTypes.value = data.data!;
        selectedGrievanceId.value = grievanceTypes[0].lookupId.toString();
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
  }

  selectingOnSiteDate() async {
    picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectOnSiteDate.value) {
      selectFromDate(picked!);
    }
  }

//^ save Grievance

  var savingGrievance = false.obs;

  saveGrivance() async {
    savingGrievance.value = true;
    await Future.delayed(const Duration(seconds: 1));

    try {
      final headers = {
        "Content-Type": "application/json",
      };
      var data = {
        // "grievanceId": int.parse(selectedGrievanceId.value), // 1,
        "issueDescription":
            descriptionController.text, //"The product arrived damaged.",
        "dateTimeOfIncident": selectOnSiteDate.value
            .replaceFirst(' ', 'T'), // "24-09-2023T15:30",
        "peopleInvolved": pepoleController.text, // "John Doe",
        "grievanceType": selectedGrievanceName.value, //"Damaged Goods",
        "status": "Submitted",
        "isActive": true
      };

      log(jsonEncode(data));
      final response = await dio.post(Api.saveGrievanceURL(),
          data: data,
          options: Options(
            headers: headers,
            method: 'POST',
          ));

      if (response.statusCode == 200) {
        var result = SaveGrievanceModel.fromJson(response.data);

        if (result.status == true) {
          grivanceController.getGrievanceList("", "");
          // await Future.delayed(const Duration(seconds: 3));
          Get.offAllNamed('/GrievanceScreen', predicate: (route) {
            return route.settings.name == '/HomeScreen';
          });
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
    savingGrievance.value = false;
    update();
  }
}
