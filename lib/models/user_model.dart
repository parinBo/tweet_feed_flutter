import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? username;
  List<UserModel>? friends;
  DateTime? createDate;

  UserModel({this.id, this.username, this.friends, this.createDate});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? '',
        username: json["username"] ?? '',
        createDate: (json["createDate"] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "createDate": createDate,
        "friends": List<UserModel>.from(friends!.map((e) => e.toJson())),
      };
}
