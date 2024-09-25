
import 'dart:convert';

GrievanceTypeModel grievanceTypeModelFromJson(String str) => GrievanceTypeModel.fromJson(json.decode(str));

String grievanceTypeModelToJson(GrievanceTypeModel data) => json.encode(data.toJson());

class GrievanceTypeModel {
    List<GrievanceData>? data;
    bool? status;

    GrievanceTypeModel({
        this.data,
        this.status,
    });

    factory GrievanceTypeModel.fromJson(Map<String, dynamic> json) => GrievanceTypeModel(
        data: json["data"] == null ? [] : List<GrievanceData>.from(json["data"]!.map((x) => GrievanceData.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
    };
}

class GrievanceData {
    int? lookupId;
    String? lookupName;

    GrievanceData({
        this.lookupId,
        this.lookupName,
    });

    factory GrievanceData.fromJson(Map<String, dynamic> json) => GrievanceData(
        lookupId: json["lookupId"],
        lookupName: json["lookupName"],
    );

    Map<String, dynamic> toJson() => {
        "lookupId": lookupId,
        "lookupName": lookupName,
    };
}
