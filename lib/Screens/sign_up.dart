// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_signin/reusable_widgets/reusable_widget.dart';
// import 'package:firebase_signin/screens/home_screen.dart';
// import 'package:firebase_signin/utils/color_utils.dart';
// ignore_for_file: unused_local_variable, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/Screens/home_Screen.dart';
import 'package:dao/Screens/sign_in.dart';
import 'package:dao/Screens/user_home_screen.dart';
import 'package:dao/model/session_data.dart';
import 'package:dao/reusable_widgets/reusable_widget.dart';
import 'package:dao/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

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

  RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  RoundedLoadingButtonController _btnControllerGoogle =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    void _showSnackbar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 3),
        ),
      );
    }

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
            // hexStringToColor("F8FBFE"),
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

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundedLoadingButton(
                    controller: _btnController,
                    borderRadius: 20,
                    color: Colors.teal.shade700,
                    onPressed: () async {
                      // Email and password validation
                      String email = _emailTextController.text.trim();
                      String password = _passwordTextController.text.trim();

                      if (email.isEmpty ||
                          !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                              .hasMatch(email)) {
                        // Show error animation on button
                        _showSnackbar('Please enter a valid email address');
                        _btnController.reset();
                        return;
                      }
                      if (password.isEmpty || password.length < 6) {
                        // Check if password is empty or less than 6 characters
                        _showSnackbar(
                            'Please enter a valid password (min. 6 characters)');
                        _btnController.reset();
                        return;
                      }
                      try {
                        _btnController.start();
                        // Start the loading animation
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
                              "interest": ['Js', 'React', 'NextJs', 'Flutter'],
                              'summary': {
                                'displayName': value.user?.displayName,
                                'email': value.user?.email,
                                'image': value.user?.photoURL,
                              }
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
                      } on FirebaseAuthException catch (e) {
                        // Handle login error
                        _showSnackbar('Error: ${e.message}');
                        _btnController
                            .error(); // Show error animation on button
                      } finally {
                        _btnController.stop(); // Stop the loading animation
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // googleUIButton(context, true, _handleGoogleSignUp),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundedLoadingButton(
                    controller:
                        _btnControllerGoogle, // Use a different controller for Google sign-in button
                    borderRadius: 20,
                    color: Colors.teal.shade700,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/brand/google.png', // Replace with your Google logo asset
                          height: 24.0,
                          width: 24.0,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Sign Up with Google',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      // Your Google sign-in logic here
                      try {
                        _btnControllerGoogle
                            .start(); // Start the loading animation
                        await _handleGoogleSignUp(context);
                      } catch (e) {
                        // Handle sign-in error
                        print('Error: $e');
                        _showSnackbar('Error: ${e}');
                      } finally {
                        _btnControllerGoogle
                            .stop(); // Stop the loading animation
                      }
                    },
                  ),
                ),
                signInOption()
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
          'Name': _userNameTextController.text,
          'uid': userCredential.user?.uid,
          "interest": ['Js', 'React', 'NextJs', 'Flutter'],
          'summary': {
            'displayName': userCredential.user?.displayName,
            'email': userCredential.user?.email,
            'image': userCredential.user?.photoURL,
          }
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (error) {
      print(error.toString());
    }
  }

// --------------------------- Row after the login btn-----------------------------------------
  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));

            print('Screen changed');
          },
          child: const Text(
            " Sign In",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
