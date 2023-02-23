import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/Wigets/drawer.dart';
import 'package:dao/Wigets/featured_mentors.dart';
import 'package:dao/Wigets/my_mentors.dart';
import 'package:dao/Wigets/skills.dart';
import 'package:dao/Wigets/upcoming_sessions.dart';
import 'package:dao/model/mentors.dart';
import 'package:dao/model/session_data.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  List<SessioinsData>? sessioinsData;
  UserHomeScreen({required this.sessioinsData});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final String _appBartitle = 'UserHomePage';

  var selectedItem = '';

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
          PopupMenuButton(onSelected: (value) async {
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
                  //    fetchData();
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
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            UpCommingSessions(
                'Registered Sessions',
                'Sessions that you have Registered',
                false,
                true,
                widget.sessioinsData!),
            FeaturedMentors('My Mentors'),
            MyMentors(),
            Skills(false, 'Interested Skills'),
            Skills(true, 'Recommended Skills'),
            UpCommingSessions(
                'Recommended Skills',
                'Sign Up to one of our sessions and start your journey',
                false,
                true,
                widget.sessioinsData!)
          ]),
        ),
      ),
    );
  }
}
