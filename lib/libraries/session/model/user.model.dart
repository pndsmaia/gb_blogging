import 'dart:convert';

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.name,
    this.profilePicture,
  });

  String id;
  String email;
  String name;
  String profilePicture;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? '',
        email: json["email"] ?? '',
        name: json["name"] ?? '',
        profilePicture: json["profilePicture"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id ?? '',
        "email": email ?? '',
        "name": name ?? '',
        "profilePicture": profilePicture ?? '',
      };
}
