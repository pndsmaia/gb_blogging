import 'dart:convert';
import 'package:gbblogging/features/home/model/message.model.dart';
import 'package:gbblogging/libraries/session/model/user.model.dart';

class NewsModel {
  NewsModel({
    this.user,
    this.message,
  });

  UserModel user;
  MessageModel message;

  factory NewsModel.fromJson(String str) => NewsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsModel.fromMap(Map<String, dynamic> json) => NewsModel(
        user: UserModel.fromMap(json["user"]),
        message: MessageModel.fromMap(json["message"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "message": message.toMap(),
      };
}
