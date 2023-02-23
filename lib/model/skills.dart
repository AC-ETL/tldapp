// To parse this JSON data, do
//
//     final sessioinsData = sessioinsDataFromJson(jsonString);

import 'dart:convert';

SkillData sessioinsDataFromJson(String str) =>
    SkillData.fromJson(json.decode(str));

String sessioinsDataToJson(SkillData data) => json.encode(data.toJson());

class SkillData {
  SkillData({
    required this.image,
    required this.indemand,
    required this.name,
  });

  String image;
  bool indemand;
  String name;

  factory SkillData.fromJson(Map<String, dynamic> json) => SkillData(
        image: json["image"],
        indemand: json["indemand"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "indemand": indemand,
        "name": name,
      };
}
