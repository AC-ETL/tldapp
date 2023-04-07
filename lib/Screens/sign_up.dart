// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_signin/reusable_widgets/reusable_widget.dart';
// import 'package:firebase_signin/screens/home_screen.dart';
// import 'package:firebase_signin/utils/color_utils.dart';
// ignore_for_file: unused_local_variable, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/Screens/home_Screen.dart';
import 'package:dao/Screens/sign_in.dart';
import 'package:dao/model/session_data.dart';
import 'package:dao/reusable_widgets/reusable_widget.dart';
import 'package:dao/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  SessioinsData? sessioinsData;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("9DD5C8"),
            hexStringToColor("9DD5C8"),
            hexStringToColor("F8FBFE"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(
                  context,
                  false,
                  () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      print("Created New Account");
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(value.user?.uid)
                          .set(
                        {
                          'email': value.user?.email,
                          'Name': _userNameTextController.text,
                          'uid': value.user?.uid,
                          "interest": ['Js', 'React', 'NextJs', 'Flutter']
                        },
                      );
                      print('UserdataSubmit');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  },
                ),
                googleUIButton(context, true, _handleGoogleSignUp),
              ],
            ),
          ))),
    );
  }

  fetchData() async {
    var data = FirebaseFirestore.instance.collection("sessions").snapshots();
    data.map((value) {
      // print(value.docs[0]);
      var data2 = value.docs;

      // List<QueryDocumentSnapshot<SessioinsData>> sessionData=value.docs!.forEach((element) { });

      value.docs.forEach((element) {
        widget.sessioinsData = SessioinsData.fromJson(element.data());

//        print("    in session ${sessioinsData.image}");
      });
    }).toList();

    // print("data   $data2");s
  }

  Future<void> _handleGoogleSignUp(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'email': userCredential.user?.email,
          'Name': userCredential.user?.displayName,
          'uid': userCredential.user?.uid,
          "interest": ['Js', 'React', 'NextJs', 'Flutter']
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
