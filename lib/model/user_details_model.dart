// To parse this JSON data, do
//
//     final listUserModel = listUserModelFromJson(jsonString);

import 'dart:convert';

ListUserModel listUserModelFromJson(String str) => ListUserModel.fromJson(json.decode(str));

String listUserModelToJson(ListUserModel data) => json.encode(data.toJson());

class ListUserModel {
     List<User> users =[];

    ListUserModel({
        required this.users,
    });

    factory ListUserModel.fromJson(Map<String, dynamic> json) => ListUserModel(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class User {
    final String? id;
    final String? firstName;
    final String? lastName;
    final int? wallet;
    final int? phoneNumber;
    final String? email;
    final String? password;
     bool? block;
    final String? profilePhoto;
    final DateTime? createdAt;
    final int? v;

    User({
         this.id,
         this.firstName,
         this.lastName,
         this.wallet,
         this.phoneNumber,
         this.email,
         this.password,
         this.block,
         this.profilePhoto,
         this.createdAt,
         this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        wallet: json["wallet"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        block: json["block"],
        profilePhoto: json["profilePhoto"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "wallet": wallet,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "block": block,
        "profilePhoto": profilePhoto,
        "createdAt": createdAt!.toIso8601String(),
        "__v": v,
    };
}
