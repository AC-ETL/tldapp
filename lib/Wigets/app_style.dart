import 'package:flutter/material.dart';

final primaryColor = Color(0xffF8FBFE);
final secondaryColor = Color(0xff9DD5C8);
final kwhite = Color.fromARGB(255, 241, 239, 239);
final kTextColor = Color(0xff1C2D56);
final kblackColor = Color(0xff000000);
final kborderOrange = Color(0xffFFB66A);
final kborderBlue = Color(0xff70C3F9);
final kiconBlue = Color.fromARGB(255, 20, 144, 226);
final kborderlightGreen = Color(0xff6BFFAB);
final kborderlightYellow = Color(0xffFFE36A);
final kborderGreyblue = Color(0xffDC8CFF);
final kbordersilver = Color(0xffD9D9D9);
final kborderblue = Color(0xff1C2D56);
final kCard = Color(0xffF4F4F4);
final String _title = 'Learning DAOs';

final coustomAppBar = AppBar(
  shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
  iconTheme: const IconThemeData(color: Colors.black),
  backgroundColor: Colors.white,
  elevation: 2,
  title: Text(
    _title,
    style: const TextStyle(color: Colors.black),
  ),
  actions: const <Widget>[
    CircleAvatar(
      backgroundColor: Color.fromARGB(255, 184, 187, 194),
      radius: 15,
      child: Icon(
        Icons.search,
        size: 19,
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 184, 187, 194),
        radius: 15,
        child: Icon(Icons.label, size: 19),
      ),
    )
  ],
);
