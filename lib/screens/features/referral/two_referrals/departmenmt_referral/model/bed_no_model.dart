// To parse this JSON data, do
//
//     final bedNoModel = bedNoModelFromJson(jsonString);

import 'dart:convert';

BedNoModel bedNoModelFromJson(String str) =>
    BedNoModel.fromJson(json.decode(str));

String bedNoModelToJson(BedNoModel data) => json.encode(data.toJson());

class BedNoModel {
  List<BedMasterList>? bedMasterList;
  bool? status;

  BedNoModel({
    this.bedMasterList,
    this.status,
  });

  factory BedNoModel.fromJson(Map<String, dynamic> json) => BedNoModel(
        bedMasterList: json["bedMasterList"] == null
            ? []
            : List<BedMasterList>.from(
                json["bedMasterList"]!.map((x) => BedMasterList.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "bedMasterList": bedMasterList == null
            ? []
            : List<dynamic>.from(bedMasterList!.map((x) => x.toJson())),
        "status": status,
      };
}

class BedMasterList {
  int? createdBy;
  String? creationTimeStamp;
  int? updatedBy;
  String? updationTimeStamp;
  int? bedMasterId;
  String? bedNo;
  String? bedType;
  String? serviceCenter;
  String? bedStatus;
  bool? isActive;

  BedMasterList({
    this.createdBy,
    this.creationTimeStamp,
    this.updatedBy,
    this.updationTimeStamp,
    this.bedMasterId,
    this.bedNo,
    this.bedType,
    this.serviceCenter,
    this.bedStatus,
    this.isActive,
  });

  factory BedMasterList.fromJson(Map<String, dynamic> json) => BedMasterList(
        createdBy: json["createdBy"],
        creationTimeStamp: json["creationTimeStamp"],
        updatedBy: json["updatedBy"],
        updationTimeStamp: json["updationTimeStamp"],
        bedMasterId: json["bedMasterId"],
        bedNo: json["bedNo"],
        bedType: json["bedType"],
        serviceCenter: json["serviceCenter"],
        bedStatus: json["bedStatus"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "creationTimeStamp": creationTimeStamp,
        "updatedBy": updatedBy,
        "updationTimeStamp": updationTimeStamp,
        "bedMasterId": bedMasterId,
        "bedNo": bedNo,
        "bedType": bedType,
        "serviceCenter": serviceCenter,
        "bedStatus": bedStatus,
        "isActive": isActive,
      };
}
