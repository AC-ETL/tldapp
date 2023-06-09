// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_signin/screens/signin_screen.dart';
// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, file_names, avoid_unnecessary_containers, non_constant_identifier_names, avoid_print

import 'package:dao/Wigets/drawer.dart';
import 'package:dao/Wigets/featured_mentors.dart';
import 'package:dao/Wigets/hero_info.dart';
import 'package:dao/Wigets/my_mentors.dart';
import 'package:dao/Wigets/skills.dart';
import 'package:dao/Wigets/upcoming_sessions.dart';
import 'package:dao/model/session_data.dart';
import 'package:dao/model/skills.dart';
import 'package:dao/utils/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:dao/sign_in.dart';
// import 'package:dao/utils/color_utils.dart';
import 'package:flutter/material.dart';
import '../Wigets/hero.dart';
import '../Wigets/app_style.dart';
// This main screen after login....

class HomeScreen extends StatefulWidget {
  //  Iniialls colors
  List<SessioinsData> sessioinsData = [];
  List<SkillData> skillData = [];
  List<Map<String, dynamic>> featuredUsers = [];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      fetchCurrentUser,
    );
    // Future.delayed(
    //   Duration(seconds: 2),
    //   fetchSkillData,
    // );
  }

//  In This is way we declare variable in dart and can use anywhere we want......

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: coustomAppBar,
      drawer: AppDrawer(),
      // -----------------------Appbar end---------------------------------
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero_Sections('section'),
                const FeaturedMentors('Featured Mentors'),
                MyMentors(),
                const SizedBox(
                  height: 25,
                ),
                const HeroInfo(),
                Skills(),
                UpCommingSessions(
                  'Up Comming Sessions',
                  'SignUp to our sessions and start your journey',
                  true,
                  true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  fetchCurrentUser() async {
    final UserEmail = FirebaseAuth.instance.currentUser?.email;
    final UserUid = FirebaseAuth.instance.currentUser?.uid;
    print('>>>>>>>>>Home<<<<<<<<$UserEmail');
    print('>>>>>>>>>Home<<<<<<<<$UserUid');
  }
//   fetchData() async {
//     var data = FirebaseFirestore.instance.collection("sessions").snapshots();
//     data.map((value) {
//       // print(value.docs[0]);

//       // List<QueryDocumentSnapshot<SessioinsData>> sessionData=value.docs!.forEach((element) { });

//       value.docs.forEach((element) {
//         setState(() {
//           widget.sessioinsData.add(SessioinsData.fromJson(element.data()));
//         });

// //
//       });
//     }).toList();
//   }

  //  This fn get the data from skills collections🎈🎈🎈
//   fetchSkillData() async {
//     var data = FirebaseFirestore.instance.collection("skills").snapshots();
//     data.map((value) {
//       // print(value.docs[0]);

//       // List<QueryDocumentSnapshot<SessioinsData>> sessionData=value.docs!.forEach((element) { });

//       value.docs.forEach((element) {
//         widget.skillData.add(SkillData.fromJson(element.data()));

// //        print("    in session ${sessioinsData.image}");
//       });
//     }).toList();
//   }
}
