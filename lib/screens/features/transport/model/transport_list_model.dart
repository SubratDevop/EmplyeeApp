// To parse this JSON data, do
//
//     final transportListModel = transportListModelFromJson(jsonString);

import 'dart:convert';

TransportListModel transportListModelFromJson(String str) =>
    TransportListModel.fromJson(json.decode(str));

String transportListModelToJson(TransportListModel data) =>
    json.encode(data.toJson());

class TransportListModel {
  List<TransportList>? transportList;
  bool? status;

  TransportListModel({
    this.transportList,
    this.status,
  });

  factory TransportListModel.fromJson(Map<String, dynamic> json) =>
      TransportListModel(
        transportList: json["transportList"] == null
            ? []
            : List<TransportList>.from(
                json["transportList"]!.map((x) => TransportList.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "transportList": transportList == null
            ? []
            : List<dynamic>.from(transportList!.map((x) => x.toJson())),
        "status": status,
      };
}

class TransportList {
  dynamic createdBy;
  String? creationTimeStamp;
  dynamic updatedBy;
  DateTime? updationTimeStamp;
  int? transportId;
  String? pickupLocation;
  String? dropLocation;
  String? dateTime;
  int? employeeId;
  String? status;
  bool? isActive;

  TransportList({
    this.createdBy,
    this.creationTimeStamp,
    this.updatedBy,
    this.updationTimeStamp,
    this.transportId,
    this.pickupLocation,
    this.dropLocation,
    this.dateTime,
    this.employeeId,
    this.status,
    this.isActive,
  });

  factory TransportList.fromJson(Map<String, dynamic> json) => TransportList(
        createdBy: json["createdBy"],
        creationTimeStamp: json["creationTimeStamp"],
        updatedBy: json["updatedBy"],
        updationTimeStamp: json["updationTimeStamp"] == null
            ? null
            : DateTime.parse(json["updationTimeStamp"]),
        transportId: json["transportId"],
        pickupLocation: json["pickupLocation"],
        dropLocation: json["dropLocation"],
        dateTime: json["dateTime"],
        employeeId: json["employeeId"],
        status: json["status"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "creationTimeStamp": creationTimeStamp,
        "updatedBy": updatedBy,
        "updationTimeStamp": updationTimeStamp?.toIso8601String(),
        "transportId": transportId,
        "pickupLocation": pickupLocation,
        "dropLocation": dropLocation,
        "dateTime": dateTime,
        "employeeId": employeeId,
        "status": status,
        "isActive": isActive,
      };
}
