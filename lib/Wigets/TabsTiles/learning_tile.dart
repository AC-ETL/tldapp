import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LearningTile extends StatefulWidget {
  const LearningTile({Key? key}) : super(key: key);

  @override
  State<LearningTile> createState() => _LearningTileState();
}

class _LearningTileState extends State<LearningTile> {
  // Interest Array..
  // List<String> interest = ['React', 'HTML', 'Css', 'Flutter'];
  List<String> learning = [];
  Map<String, dynamic>? userProfileData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      // keep value start of the Cross and MainAxis becuase we want to title and interest tah should start at same line
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 270, left: 12),
          child: Text(
            'Learning',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 30,
          child: ListView.builder(
            itemCount: learning.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                margin: EdgeInsets.only(
                    left: index == 0 ? 10 : 15, right: index == 5 - 1 ? 18 : 0),
                child: Chip(
                  label: Text(
                    learning[index].toString(),
                    style: TextStyle(color: Colors.black87),
                  ),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  elevation: 0,
                ),
              );
            },
          ),
        )
      ],
    ));
  }

  _fetchUserData() {
    final firebaseUserUid = FirebaseAuth.instance.currentUser?.uid;
    // Here we check if the user exists, then fetch the user data...
    if (firebaseUserUid != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUserUid)
          .get()
          .then((ds) {
        setState(() {
          // Here im setting the data to class variable userProfileData
          userProfileData = ds.data();
          learning = userProfileData!["learning"] != null
              ? List<String>.from(userProfileData!["learning"])
              : [];
        });
        print(learning);
        print(userProfileData?['email']);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
