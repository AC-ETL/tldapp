// To parse this JSON data, do
//
//     final sessioinsData = sessioinsDataFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

SessioinsData sessioinsDataFromJson(String str) =>
    SessioinsData.fromJson(json.decode(str));

String sessioinsDataToJson(SessioinsData data) => json.encode(data.toJson());

class SessioinsData {
  SessioinsData({
    required this.approve,
    required this.endTime,
    required this.image,
    required this.instructor,
    required this.poins,
    required this.startTime,
    required this.students,
    required this.title,
    required this.tags,
  });

  bool approve;
  DateTime endTime;
  String image;
  String instructor;
  String poins;
  DateTime startTime;
  List<String> students;
  String title;
  List<String> tags;

  factory SessioinsData.fromJson(Map<String, dynamic> json) => SessioinsData(
        approve: json["approve"],
        endTime: json["endTime"],
        image: json["image"],
        instructor: json["instructor"],
        poins: json["poins"],
        startTime: json["startTime"],
        students: List<String>.from(json["students"].map((x) => x)),
        title: json["title"],
        tags: List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "approve": approve,
        "endTime": endTime,
        "image": image,
        "instructor": instructor,
        "poins": poins,
        "startTime": startTime,
        "students": List<dynamic>.from(students.map((x) => x)),
        "title": title,
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}
