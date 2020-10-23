import 'dart:convert';

class MessageModel {
    MessageModel({
        this.content,
        this.createdAt,
    });

    String content;
    DateTime createdAt;

    factory MessageModel.fromJson(String str) => MessageModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toMap() => {
        "content": content,
        "created_at": createdAt.toIso8601String(),
    };
}