import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/Screens/sign_in.dart';
import 'package:dao/Wigets/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDate extends StatefulWidget {
  const UserDate({super.key});

  @override
  State<UserDate> createState() => _UserDateState();
}

class _UserDateState extends State<UserDate> {

  // Map<String,dynamic>? myEmail;
  var myEmail;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: [
          TextButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>const SignInScreen()));
              },
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              label: Text(
                'Log out',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: _fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done){
              return const Text("Loading data...Please wait");
            }
            return Text('$myEmail');
          },
        ),

      ),
    );
  }

  _fetch() async {
    final firebaseUser =  FirebaseAuth.instance.currentUser;
    if (firebaseUser != null){
       FirebaseFirestore.instance
          .collection('users')
          .doc('6g0Ri6ZfecRLHGnuLhb3UvxviBj2')
          .get()
          .then((ds) {
     final data =ds.data();
     print(data);
    final summryData  =data?['summry'];
    
    myEmail=summryData['email'];

    print(summryData['email']);


      

      }).catchError((e) {
        print(e);
      });
    }
   }

 }
