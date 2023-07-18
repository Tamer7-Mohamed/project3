import 'dart:convert';

List<Todomodole> todomodoleFromJson(String str) => List<Todomodole>.from(json.decode(str).map((x) => Todomodole.fromJson(x)));

String todomodoleToJson(List<Todomodole> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todomodole {
  int userId;
  int id;
  String title;
  bool completed;

  Todomodole({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todomodole.fromJson(Map<String, dynamic> json) => Todomodole(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
