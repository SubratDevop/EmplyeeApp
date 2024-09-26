// To parse this JSON data, do
//
//     final bedServiceCenterModel = bedServiceCenterModelFromJson(jsonString);

import 'dart:convert';

BedServiceCenterModel bedServiceCenterModelFromJson(String str) => BedServiceCenterModel.fromJson(json.decode(str));

String bedServiceCenterModelToJson(BedServiceCenterModel data) => json.encode(data.toJson());

class BedServiceCenterModel {
    List<BedServiceCenterData>? data;
    bool? status;

    BedServiceCenterModel({
        this.data,
        this.status,
    });

    factory BedServiceCenterModel.fromJson(Map<String, dynamic> json) => BedServiceCenterModel(
        data: json["data"] == null ? [] : List<BedServiceCenterData>.from(json["data"]!.map((x) => BedServiceCenterData.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
    };
}

class BedServiceCenterData {
    int? lookupId;
    String? lookupName;

    BedServiceCenterData({
        this.lookupId,
        this.lookupName,
    });

    factory BedServiceCenterData.fromJson(Map<String, dynamic> json) => BedServiceCenterData(
        lookupId: json["lookupId"],
        lookupName: json["lookupName"],
    );

    Map<String, dynamic> toJson() => {
        "lookupId": lookupId,
        "lookupName": lookupName,
    };
}
