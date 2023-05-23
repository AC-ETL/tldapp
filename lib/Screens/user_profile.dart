// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/Wigets/number_widget.dart';
import 'package:dao/Wigets/ProfileTabs/about_me.dart';
import 'package:dao/Wigets/ProfileTabs/my_shecdule.dart';
import 'package:dao/Wigets/ProfileTabs/reward.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Wigets/app_style.dart';
import '../Wigets/ProfileTabs/activity.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String imgurl =
      'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80.png';
  final double coverHeight = 200;
  final double profileImageHeight = 144;
  Map<String, dynamic>? userProfileData;
// Here im Creating variable for displying data coditionaly..
  var AboutV = true;
  var RewardV = false;
  var ActivityV = false;
  var MYScheduleV = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [buildTop(), buildContent()],
    ));
  }

// This is widget method containinh somemore widgets..
  Widget buildTop() {
    final double top = coverHeight - profileImageHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildCoverImage(),
          Positioned(top: top, child: builProfileImage())
        ]);
  }

  Widget buildCoverImage() {
    return Container(
      color: kborderGreyblue,
      child: Image.network(
        imgurl,
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget builProfileImage() {
    return CircleAvatar(
      radius: profileImageHeight / 2,
      backgroundColor: kwhite,
      child: CircleAvatar(
        radius: 65,
        backgroundImage: NetworkImage(imgurl),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: [
        SizedBox(
          height: 80,
        ),
        userProfileData == null
            ? Container(
                height: 12,
                width: 12,
                child: Image.network('https://i.gifer.com/VZvw.gif'))
            : Text(userProfileData?['Name'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 8,
        ),
        Text('Web Developer'),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            circuleAvatar(FontAwesomeIcons.twitter, kiconBlue),
            const SizedBox(
              width: 12,
            ),
            circuleAvatar(FontAwesomeIcons.facebook, kiconBlue),
            const SizedBox(
              width: 12,
            ),
            circuleAvatar(FontAwesomeIcons.linkedin, kiconBlue),
            const SizedBox(
              width: 12,
            ),
            circuleAvatar(FontAwesomeIcons.github, kblackColor),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Divider(),
        NumberWidget(),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 16,
        ),
        Divider(),

        UserPrfileTabs(),
        Divider(),
        // SizedBox(height: 12,),

        Container(
          child: Column(
            children: [
              // This widget conditionaly show on the screen when click on the tabs....
              if (AboutV) const AboutMe(),
              if (ActivityV) const Activity(),
              if (RewardV) const Reward(),
              if (MYScheduleV) const MYSchedule()
            ],
          ),
        ),
      ],
    );
  }

  Widget UserPrfileTabs() => Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: Text('About',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onTap: () {
                setState(() {
                  AboutV = true;
                  ActivityV = false;
                  RewardV = false;
                  MYScheduleV = false;
                });

                print('About');
              },
            ),
            InkWell(
              child: Text('Activity',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onTap: () {
                setState(() {
                  AboutV = false;
                  ActivityV = true;
                  RewardV = false;
                  MYScheduleV = false;
                });

                print('Activity');
              },
            ),
            InkWell(
              child: Text('Reward',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onTap: () {
                setState(() {
                  AboutV = false;
                  ActivityV = false;
                  RewardV = true;
                  MYScheduleV = false;
                });

                print('Reward');
              },
            ),
            InkWell(
              child: Center(
                child: Text('My Schedule',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              onTap: () {
                setState(() {
                  AboutV = false;
                  ActivityV = false;
                  RewardV = false;
                  MYScheduleV = true;
                });

                print('My Schedule');
              },
            ),
          ],
        ),
      );

  Widget circuleAvatar(IconData icon, Color iconColor) {
    return CircleAvatar(
        radius: 20,
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.white,
          child: InkWell(
            child: Center(
                child: Icon(
              icon,
              size: 25,
              color: iconColor,
            )),
            onTap: () {},
          ),
        ));
  }

  _fetchUserData() {
    final firebaseUserUid = FirebaseAuth.instance.currentUser?.uid;
    // Here we checkin if the user not exist  then don't fetch the userdata...
    if (firebaseUserUid != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUserUid)
          .get()
          .then((ds) {
        setState(() {
          // Here  im seting the data to class variable userData
          userProfileData = ds.data();
          imgurl = userProfileData!["summry"]["image"];
        });
        print(userProfileData?['email']);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
