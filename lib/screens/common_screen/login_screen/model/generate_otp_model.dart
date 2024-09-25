import 'dart:convert';

GenerateOtpModel generateOtpModelFromJson(String str) =>
    GenerateOtpModel.fromJson(json.decode(str));

class GenerateOtpModel {
  String? message;
  bool? status;

  GenerateOtpModel({
    this.message,
    this.status,
  });

  factory GenerateOtpModel.fromJson(Map<String, dynamic> json) =>
      GenerateOtpModel(
        message: json["message"],
        status: json["status"],
      );
}
