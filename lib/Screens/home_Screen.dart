// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:dao/Wigets/drawer.dart';
import 'package:dao/Wigets/featured_mentors.dart';
import 'package:dao/Wigets/hero_info.dart';
import 'package:dao/Wigets/my_mentors.dart';
import 'package:dao/Wigets/skills.dart';
import 'package:dao/Wigets/upcoming_sessions.dart';
// import 'package:dao/sign_in.dart';
// import 'package:dao/utils/color_utils.dart';
import 'package:flutter/material.dart';
import '../Wigets/hero.dart';
import '../Wigets/upcoming_sessions.dart';

// This main screen after login....

class HomeScreen extends StatefulWidget {
  //  Iniialls colors
  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = Color.fromARGB(255, 149, 124, 190);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//  In This is way we declare variable in dart and can use anywhere we want......

  static const String _title = 'Learning DAO';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          _title,
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
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
      ),
      drawer: const AppDrawer(),
      // -----------------------Appbar end---------------------------------
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero_Sections('section'),
                const FeaturedMentors(),
                MyMentors(),
                SizedBox(
                  height: 25,
                ),
                HeroInfo(),
                Skills(),
                UpCommingSessions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
