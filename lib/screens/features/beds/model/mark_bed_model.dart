// To parse this JSON data, do
//
//     final markBedModel = markBedModelFromJson(jsonString);

import 'dart:convert';

MarkBedModel markBedModelFromJson(String str) => MarkBedModel.fromJson(json.decode(str));

String markBedModelToJson(MarkBedModel data) => json.encode(data.toJson());

class MarkBedModel {
    List<MarkBedList>? data;
    bool? status;

    MarkBedModel({
        this.data,
        this.status,
    });

    factory MarkBedModel.fromJson(Map<String, dynamic> json) => MarkBedModel(
        data: json["data"] == null ? [] : List<MarkBedList>.from(json["data"]!.map((x) => MarkBedList.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
    };
}

class MarkBedList {
    int? id;
    String? name;

    MarkBedList({
        this.id,
        this.name,
    });

    factory MarkBedList.fromJson(Map<String, dynamic> json) => MarkBedList(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
