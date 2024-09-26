// To parse this JSON data, do
//
//     final bedServiceCenterListModel = bedServiceCenterListModelFromJson(jsonString);

import 'dart:convert';

BedServiceCenterListModel bedServiceCenterListModelFromJson(String str) => BedServiceCenterListModel.fromJson(json.decode(str));

String bedServiceCenterListModelToJson(BedServiceCenterListModel data) => json.encode(data.toJson());

class BedServiceCenterListModel {
    List<BedMasterList>? bedMasterList;
    bool? status;

    BedServiceCenterListModel({
        this.bedMasterList,
        this.status,
    });

    factory BedServiceCenterListModel.fromJson(Map<String, dynamic> json) => BedServiceCenterListModel(
        bedMasterList: json["bedMasterList"] == null ? [] : List<BedMasterList>.from(json["bedMasterList"]!.map((x) => BedMasterList.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "bedMasterList": bedMasterList == null ? [] : List<dynamic>.from(bedMasterList!.map((x) => x.toJson())),
        "status": status,
    };
}

class BedMasterList {
    dynamic createdBy;
    DateTime? creationTimeStamp;
    dynamic updatedBy;
    DateTime? updationTimeStamp;
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
        creationTimeStamp: json["creationTimeStamp"] == null ? null : DateTime.parse(json["creationTimeStamp"]),
        updatedBy: json["updatedBy"],
        updationTimeStamp: json["updationTimeStamp"] == null ? null : DateTime.parse(json["updationTimeStamp"]),
        bedMasterId: json["bedMasterId"],
        bedNo: json["bedNo"],
        bedType: json["bedType"],
        serviceCenter: json["serviceCenter"],
        bedStatus: json["bedStatus"],
        isActive: json["isActive"],
    );

    Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "creationTimeStamp": creationTimeStamp?.toIso8601String(),
        "updatedBy": updatedBy,
        "updationTimeStamp": updationTimeStamp?.toIso8601String(),
        "bedMasterId": bedMasterId,
        "bedNo": bedNo,
        "bedType": bedType,
        "serviceCenter": serviceCenterValues.reverse[serviceCenter],
        "bedStatus": bedStatus,
        "isActive": isActive,
    };
}

enum ServiceCenter {
    ORTHOPEDICS
}

final serviceCenterValues = EnumValues({
    "Orthopedics": ServiceCenter.ORTHOPEDICS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
