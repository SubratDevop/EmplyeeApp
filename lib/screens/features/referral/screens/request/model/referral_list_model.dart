// To parse this JSON data, do
//
//     final referralListListModel = referralListListModelFromJson(jsonString);

import 'dart:convert';

ReferralListListModel referralListListModelFromJson(String str) => ReferralListListModel.fromJson(json.decode(str));

String referralListListModelToJson(ReferralListListModel data) => json.encode(data.toJson());

class ReferralListListModel {
    List<ReferralList>? referralList;
    bool? status;

    ReferralListListModel({
        this.referralList,
        this.status,
    });

    factory ReferralListListModel.fromJson(Map<String, dynamic> json) => ReferralListListModel(
        referralList: json["referralList"] == null ? [] : List<ReferralList>.from(json["referralList"]!.map((x) => ReferralList.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "referralList": referralList == null ? [] : List<dynamic>.from(referralList!.map((x) => x.toJson())),
        "status": status,
    };
}

class ReferralList {
    dynamic createdBy;
    String? creationTimeStamp;
    dynamic updatedBy;
    String? updationTimeStamp;
    int? referralId;
    String? referralType;
    String? consultantName;
    String? departmentName;
    String? patientMrno;
    String? patientName;
    String? bedNo;
    String? serviceCenter;
    String? referralPriority;
    String? remarks;
    String? referralDateTime;
    bool? isActive;
    int? bedId;
    String? bedStatus;

    ReferralList({
        this.createdBy,
        this.creationTimeStamp,
        this.updatedBy,
        this.updationTimeStamp,
        this.referralId,
        this.referralType,
        this.consultantName,
        this.departmentName,
        this.patientMrno,
        this.patientName,
        this.bedNo,
        this.serviceCenter,
        this.referralPriority,
        this.remarks,
        this.referralDateTime,
        this.isActive,
        this.bedId,
        this.bedStatus,
    });

    factory ReferralList.fromJson(Map<String, dynamic> json) => ReferralList(
        createdBy: json["createdBy"],
        creationTimeStamp: json["creationTimeStamp"],
        updatedBy: json["updatedBy"],
        updationTimeStamp: json["updationTimeStamp"],
        referralId: json["referralId"],
        referralType: json["referralType"],
        consultantName: json["consultantName"],
        departmentName: json["departmentName"],
        patientMrno: json["patientMrno"],
        patientName: json["patientName"],
        bedNo: json["bedNo"],
        serviceCenter: json["serviceCenter"],
        referralPriority: json["referralPriority"],
        remarks: json["remarks"],
        referralDateTime: json["referralDateTime"],
        isActive: json["isActive"],
        bedId: json["bedId"],
        bedStatus: json["bedStatus"],
    );

    Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "creationTimeStamp": creationTimeStamp,
        "updatedBy": updatedBy,
        "updationTimeStamp": updationTimeStamp,
        "referralId": referralId,
        "referralType": referralType,
        "consultantName": consultantName,
        "departmentName": departmentName,
        "patientMrno": patientMrno,
        "patientName": patientName,
        "bedNo": bedNo,
        "serviceCenter": serviceCenter,
        "referralPriority": referralPriority,
        "remarks": remarks,
        "referralDateTime": referralDateTime,
        "isActive": isActive,
        "bedId": bedId,
        "bedStatus": bedStatus,
    };
}
