import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/Screens/home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserManagement {
  storeNewUser(user, context) {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .set({'email': user.email, 'uid': user.uid})
        .then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          ),
        )
        .catchError((e) {
          print(e);
        });

    // Firestore.instance
    //     .collection('users')
    //     .document(firebaseUser.uid)
    //     .setData()
  }
}
