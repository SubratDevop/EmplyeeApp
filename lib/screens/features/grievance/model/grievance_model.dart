// To parse this JSON data, do
//
//     final grievanceModel = grievanceModelFromJson(jsonString);

import 'dart:convert';

GrievanceModel grievanceModelFromJson(String str) =>
    GrievanceModel.fromJson(json.decode(str));

String grievanceModelToJson(GrievanceModel data) => json.encode(data.toJson());

class GrievanceModel {
  List<GrievanceList>? grievanceList;
  bool? status;

  GrievanceModel({
    this.grievanceList,
    this.status,
  });

  factory GrievanceModel.fromJson(Map<String, dynamic> json) => GrievanceModel(
        grievanceList: json["grievanceList"] == null
            ? []
            : List<GrievanceList>.from(
                json["grievanceList"]!.map((x) => GrievanceList.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "grievanceList": grievanceList == null
            ? []
            : List<dynamic>.from(grievanceList!.map((x) => x.toJson())),
        "status": status,
      };
}

class GrievanceList {
  dynamic createdBy;
  String? creationTimeStamp;
  dynamic updatedBy;
  DateTime? updationTimeStamp;
  int? grievanceId;
  String? issueDescription;
  String? dateTimeOfIncident;
  String? peopleInvolved;
  String? grievanceType;
  dynamic documentUpload;
  String? status;
  bool? isActive;

  GrievanceList({
    this.createdBy,
    this.creationTimeStamp,
    this.updatedBy,
    this.updationTimeStamp,
    this.grievanceId,
    this.issueDescription,
    this.dateTimeOfIncident,
    this.peopleInvolved,
    this.grievanceType,
    this.documentUpload,
    this.status,
    this.isActive,
  });

  factory GrievanceList.fromJson(Map<String, dynamic> json) => GrievanceList(
        createdBy: json["createdBy"],
        creationTimeStamp: json["creationTimeStamp"],
        updatedBy: json["updatedBy"],
        updationTimeStamp: json["updationTimeStamp"] == null
            ? null
            : DateTime.parse(json["updationTimeStamp"]),
        grievanceId: json["grievanceId"],
        issueDescription: json["issueDescription"],
        dateTimeOfIncident: json["dateTimeOfIncident"],
        peopleInvolved: json["peopleInvolved"],
        grievanceType: json["grievanceType"],
        documentUpload: json["documentUpload"],
        status: json["status"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "creationTimeStamp": creationTimeStamp,
        "updatedBy": updatedBy,
        "updationTimeStamp": updationTimeStamp?.toIso8601String(),
        "grievanceId": grievanceId,
        "issueDescription": issueDescription,
        "dateTimeOfIncident": dateTimeOfIncident,
        "peopleInvolved": peopleInvolved,
        "grievanceType": grievanceType,
        "documentUpload": documentUpload,
        "status": status,
        "isActive": isActive,
      };
}
