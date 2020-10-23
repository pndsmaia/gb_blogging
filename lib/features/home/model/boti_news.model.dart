import 'dart:convert';

import 'package:gbblogging/features/home/model/news.model.dart';

class BotiNewsModel {
  BotiNewsModel({
    this.news,
  });

  List<NewsModel> news;

  factory BotiNewsModel.fromJson(String str) =>
      BotiNewsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BotiNewsModel.fromMap(Map<String, dynamic> json) => BotiNewsModel(
        news:
            List<NewsModel>.from(json["news"].map((x) => NewsModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "news": List<dynamic>.from(news.map((x) => x.toMap())),
      };
}
