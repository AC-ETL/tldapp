import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InterestTile extends StatefulWidget {
  const InterestTile({Key? key}) : super(key: key);

  @override
  State<InterestTile> createState() => _InterestTileState();
}

class _InterestTileState extends State<InterestTile> {
  // Interest Array..
  // List<String> interest = ['React', 'HTML', 'Css', 'Flutter'];
  List<String> interest = [];
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
            'Interest',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 30,
          child: ListView.builder(
            itemCount: interest.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: index == 0 ? 10 : 15, right: index == 5 - 1 ? 18 : 0),
                child: Chip(
                  label: Text(
                    interest[index].toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.indigoAccent,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  elevation: 1,
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
          interest = userProfileData!["interest"] != null
              ? List<String>.from(userProfileData!["interest"])
              : [];
        });
        print(interest);
        print(userProfileData?['email']);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
