import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/handler/dio_handler.dart';
import '../../../../core/urls/app_urls.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../common_screen/otp_screen/otp_screen.dart';
import '../../grievance/model/save_grievance_model.dart';
import 'transport_controller.dart';

class BookTransportController extends GetxController {
  final dio = Dio();
  final dropController = TextEditingController();
  final transportController = Get.put(TransportController());

  // final home = "${OtpScreen.employeeInfo!.address}, "
  //     "${OtpScreen.employeeInfo!.city} ${OtpScreen.employeeInfo!.pincode}, "
  //     "${OtpScreen.employeeInfo!.state}, "
  //     "${OtpScreen.employeeInfo!.country} ";

  final home = "123 Main St, Bhubaneswar-751024, Odisha, India";

  //^ select Pickup Location

  RxList<String> pickupLocations = [
    "BMT Front Gate",
    "Kasturba Gandhi Hospital Pickup Point",
    "MCH",
    "Nursing Girl Hostel",
    "Schyctrric Front Gate",
    "SSB Gate 2",
    "SSB Bank of Baroda Gate",
    "SSH Emergency",
    "SSH Peadtric",
    "Trauma Centre Emergency Gate"
  ].obs;
  var selectedPickupLocation = "".obs;

  void pickupLocationSelected(String value) {
    selectedPickupLocation.value = value;
    update();
  }
  //^ select Drop Location

  RxList<String> dropLocations = [
    "BMT Front Gate",
    "Kasturba Gandhi Hospital Pickup Point",
    "MCH",
    "Nursing Girl Hostel",
    "Schyctrric Front Gate",
    "SSB Gate 2",
    "SSB Bank of Baroda Gate",
    "SSH Emergency",
    "SSH Peadtric",
    "Trauma Centre Emergency Gate"
  ].obs;
  var selectedDropLocation = "".obs;

  void dropLocationSelected(String value) {
    selectedDropLocation.value = value;
    update();
  }

  @override
  void onInit() {
    // log(home.toString());
    super.onInit();
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

//^ save Transport

  RxBool savingTransport = false.obs;

  saveTransport() async {
    savingTransport.value = true;
    await Future.delayed(const Duration(seconds: 1));
    try {
      final headers = {
        "Content-Type": "application/json",
      };
      var data = {
        "pickupLocation":
            selectedPickupLocation.value, // "123 Main St Bhubaneswar India",
        "dropLocation":
            selectedDropLocation.value, // "456 Elm St, City, Country",
        "dateTime": selectOnSiteDate.value
            .replaceFirst(' ', 'T'), // "24-09-2023T15:30",
        "employeeId": OtpScreen.employeeInfo!.employeeId, //1,
        "status": "Scheduled",
        "createdBy": OtpScreen.employeeInfo!.employeeId, // 1,
        "updatedBy": OtpScreen.employeeInfo!.employeeId, //1
      };

      log(jsonEncode(data));
      final response = await dio.post(Api.saveTransportURL(),
          data: data,
          options: Options(
            headers: headers,
            method: 'POST',
          ));

      if (response.statusCode == 200) {
        var result = SaveGrievanceModel.fromJson(response.data);

        if (result.status == true) {
          transportController.getTransportList();
          // await Future.delayed(const Duration(seconds: 3));
          Get.offAllNamed('/TransportScreen', predicate: (route) {
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
    savingTransport.value = false;
    update();
  }
}
