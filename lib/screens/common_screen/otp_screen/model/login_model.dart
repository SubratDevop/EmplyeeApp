import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  EmployeeDetails? employeeDetails;
  String? message;
  bool? status;

  LoginModel({
    this.employeeDetails,
    this.message,
    this.status,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        employeeDetails: json["employeeDetails"] == null
            ? null
            : EmployeeDetails.fromJson(json["employeeDetails"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "employeeDetails": employeeDetails?.toJson(),
        "message": message,
        "status": status,
      };
}

class EmployeeDetails {
  dynamic createdBy;
  DateTime? creationTimeStamp;
  dynamic updatedBy;
  DateTime? updationTimeStamp;
  int? employeeId;
  String? employeeName;
  String? email;
  String? gender;
  String? mobileNo;
  String? dob;
  dynamic employeeImage;
  String? employeeType;
  String? emergencyContact;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? country;
  bool? isActive;
  String? departmentName;
  String? age;
  String? hospitalName;
  String? hospitalContact;

  EmployeeDetails({
    this.createdBy,
    this.creationTimeStamp,
    this.updatedBy,
    this.updationTimeStamp,
    this.employeeId,
    this.employeeName,
    this.email,
    this.gender,
    this.mobileNo,
    this.dob,
    this.employeeImage,
    this.employeeType,
    this.emergencyContact,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.country,
    this.isActive,
    this.departmentName,
    this.age,
    this.hospitalName,
    this.hospitalContact,
  });

  factory EmployeeDetails.fromJson(Map<String, dynamic> json) =>
      EmployeeDetails(
        createdBy: json["createdBy"],
        creationTimeStamp: json["creationTimeStamp"] == null
            ? null
            : DateTime.parse(json["creationTimeStamp"]),
        updatedBy: json["updatedBy"],
        updationTimeStamp: json["updationTimeStamp"] == null
            ? null
            : DateTime.parse(json["updationTimeStamp"]),
        employeeId: json["employeeId"],
        employeeName: json["employeeName"],
        email: json["email"],
        gender: json["gender"],
        mobileNo: json["mobileNo"],
        dob: json["dob"],
        employeeImage: json["employeeImage"],
        employeeType: json["employeeType"],
        emergencyContact: json["emergencyContact"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        country: json["country"],
        isActive: json["isActive"],
        departmentName: json["departmentName"],
        age: json["age"],
        hospitalName: json["hospitalName"],
        hospitalContact: json["hospitalContact"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "creationTimeStamp": creationTimeStamp?.toIso8601String(),
        "updatedBy": updatedBy,
        "updationTimeStamp": updationTimeStamp?.toIso8601String(),
        "employeeId": employeeId,
        "employeeName": employeeName,
        "email": email,
        "gender": gender,
        "mobileNo": mobileNo,
        "dob": dob,
        "employeeImage": employeeImage,
        "employeeType": employeeType,
        "emergencyContact": emergencyContact,
        "address": address,
        "city": city,
        "state": state,
        "pincode": pincode,
        "country": country,
        "isActive": isActive,
        "departmentName": departmentName,
        "age": age,
        "hospitalName": hospitalName,
        "hospitalContact": hospitalContact,
      };
}
