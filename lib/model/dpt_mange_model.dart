// To parse this JSON data, do
//
//     final manageDptModel = manageDptModelFromJson(jsonString);


import 'dart:convert';

ManageDptModel manageDptModelFromJson(String str) => ManageDptModel.fromJson(json.decode(str));

String manageDptModelToJson(ManageDptModel data) => json.encode(data.toJson());

class ManageDptModel {
     List<Department> departments=[];

    ManageDptModel({
        required this.departments,
    });

    factory ManageDptModel.fromJson(Map<String, dynamic> json) => ManageDptModel(
        departments: List<Department>.from(json["departments"].map((x) => Department.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "departments": List<dynamic>.from(departments.map((x) => x.toJson())),
    };
}

class Department {
    final String? id;
    final String? departmentName;
    final String? departmentDiscription;
    final String? departmentImage;
     bool? show;
    final int? v;

    Department({
       this.id,
       this.departmentName,
       this.departmentDiscription,
       this.departmentImage,
       this.show,
       this.v,
    });

    factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["_id"],
        departmentName: json["departmentName"],
        departmentDiscription: json["departmentDiscription"],
        departmentImage: json["departmentImage"],
        show: json["show"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "departmentName": departmentName,
        "departmentDiscription": departmentDiscription,
        "departmentImage": departmentImage,
        "show": show,
        "__v": v,
    };
}
