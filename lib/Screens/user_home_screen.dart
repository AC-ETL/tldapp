import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/Wigets/drawer.dart';
import 'package:dao/Wigets/featured_mentors.dart';
import 'package:dao/Wigets/my_mentors.dart';
import 'package:dao/Wigets/skills.dart';
import 'package:dao/Wigets/upcoming_sessions.dart';
import 'package:dao/model/mentors.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final String _appBartitle = 'UserHomePage';

  var selectedItem = '';
  final List data = [];
  final List<Sessions> _allSessions = [
    Sessions(
      points: 1,
      image: 'jhjk',
      instructor: 'hjhj',
      approve: true,
      students: [1, 2, 4],
      endtime: DateTime.utc(2023),
      starttime: DateTime.utc(2023),
      title: 'new sessions',
      tags: ['angular', 'react'],
    )
  ];

  void datashow() {
    print(_allSessions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          _appBartitle,
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          PopupMenuButton(onSelected: (value) {
            // your logic
            setState(() {
              selectedItem = value.toString();
            });
            print(value);
            Navigator.pushNamed(context, value.toString());
          }, itemBuilder: (BuildContext bc) {
            return [
              PopupMenuItem(
                child: Text("SignUp"),
                //  value: '/siguppage',
                onTap: () {
                  fetchData();
                  print(_allSessions);
                },
              ),
              PopupMenuItem(
                child: Text("SingIn"),
                value: '/signin',
              ),
              PopupMenuItem(
                child: Text("User"),
                value: '/user',
              )
            ];
          })
        ],
        // leading: Icon(Icons.home),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            UpCommingSessions('Registered Sessions',
                'Sessions that you have Registered', false, true),
            const FeaturedMentors('My Mentors'),
            MyMentors(),
            Skills(false, 'Interested Skills'),
            Skills(true, 'Recommended Skills'),
            UpCommingSessions(
                'Recommended Skills',
                'Sign Up to one of our sessions and start your journey',
                false,
                false)
          ]),
        ),
      ),
    );
  }
}

fetchData() async {
  var data = FirebaseFirestore.instance.collection("sessions").snapshots();
  data.map((value) {
    // print(value.docs[0]);
    var data2 = value.docs;
    value.docs.forEach((element) {});
  }).toList();

  // print("data   $data2");
}
