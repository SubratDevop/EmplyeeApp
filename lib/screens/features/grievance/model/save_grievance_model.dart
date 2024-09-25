// To parse this JSON data, do
//
//     final saveGrievanceModel = saveGrievanceModelFromJson(jsonString);

import 'dart:convert';

SaveGrievanceModel saveGrievanceModelFromJson(String str) => SaveGrievanceModel.fromJson(json.decode(str));

String saveGrievanceModelToJson(SaveGrievanceModel data) => json.encode(data.toJson());

class SaveGrievanceModel {
    String? message;
    bool? status;

    SaveGrievanceModel({
        this.message,
        this.status,
    });

    factory SaveGrievanceModel.fromJson(Map<String, dynamic> json) => SaveGrievanceModel(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}
