// ignore_for_file: unused_local_variable

import 'package:dao/Screens/home_Screen.dart';
import 'package:dao/Screens/sign_up.dart';
import 'package:dao/Screens/user_home_screen.dart';
import 'package:dao/reusable_widgets/reusable_widget.dart';
import 'package:dao/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom / 5),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("9DD5C8"),
          hexStringToColor("9DD5C8"),
          // hexStringToColor("F8FBFE"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(children: <Widget>[
              logoWidget("assets/images/Logo2.png"),

              const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter the email", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter the Password", Icons.lock_outlined, true,
                  _passwordTextController),
              const SizedBox(
                height: 30,
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
                      // Sign in with email and password
                      final userCredential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserHomeScreen(),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      // Handle login error
                      _showSnackbar('Error: ${e.message}');
                      _btnController.error(); // Show error animation on button
                    } finally {
                      _btnController.stop(); // Stop the loading animation
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              // Helper method to show a snackbar
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
                        'Sign in with Google',
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
                      _btnControllerGoogle.stop(); // Stop the loading animation
                    }
                  },
                ),
              ),
              // This is Signuprow blow the login btn..
              signUpOption()
            ]),
          ),
        ),
      ),
    );
  }

// --------------------------- Row after the login btn-----------------------------------------
  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));

            print('Screen changed');
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
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
