import 'dart:convert';

class NearModel {
  NearModel({
    required this.id,
    required this.accountId,
    required this.topic,
    required this.title,
    required this.body,
    required this.postType,
    required this.time,
  });

  String id;
  String accountId;
  Topic topic;
  String title;
  String body;
  PostType postType;
  String time;

  factory NearModel.fromJson(Map<String, dynamic> json) => NearModel(
        id: json["id"],
        accountId: json["account_id"],
        topic: Topic.fromJson(json["topic"]),
        title: json["title"],
        body: json["body"],
        postType: PostType.fromJson(json["post_type"]),
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_id": accountId,
        "topic": topic.toJson(),
        "title": title,
        "body": body,
        "post_type": postType.toJson(),
        "time": time,
      };
}

List<NearModel> nearFromJson(String str) => List<NearModel>.from(json.decode(str).map((x) => NearModel.fromJson(x)));

String nearToJson(List<NearModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostType {
  PostType({
    required this.type,
    required this.url,
  });

  String type;
  String url;

  factory PostType.fromJson(Map<String, dynamic> json) => PostType(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}

class Topic {
  Topic({
    required this.id,
    required this.admin,
    required this.name,
    required this.createdTime,
    required this.description,
  });

  String id;
  String admin;
  String name;
  String createdTime;
  String description;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        admin: json["admin"],
        name: json["name"],
        createdTime: json["created_time"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin": admin,
        "name": name,
        "created_time": createdTime,
        "description": description,
      };
}
