import 'package:flutter/foundation.dart';

class Mentors {
  String id;
  String name;
  double workingHours;
  String workingfield;
  DateTime date;
  String imgurl;
//  Mentor Constucor.....
  Mentors(
      {required this.name,
      required this.workingHours,
      required this.workingfield,
      required this.date,
      required this.imgurl,
      required this.id});

  // factory Mentors.fromSnapshot() {

  //   return
  // }
}

class Sessions {
  int? points;
  String? image;
  String? instructor;
  bool? approve;
  List? students;
  DateTime? starttime;
  DateTime? endtime;
  String? title;
  List? tags;

  Sessions(
      {required this.points,
      required this.image,
      required this.instructor,
      required this.approve,
      required this.students,
      required this.endtime,
      required this.starttime,
      required this.title,
      required this.tags});
}
