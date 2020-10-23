import 'dart:convert';

class UserModel {
  UserModel({
    this.name,
    this.profilePicture,
  });

  String name;
  String profilePicture;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "profile_picture": profilePicture,
      };
}
