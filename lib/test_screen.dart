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

  bool _userNameError = false; // Track if UserName has error
  bool _emailError = false; // Track if Email has error

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
          gradient: LinearGradient(
            colors: [
              hexStringToColor("9DD5C8"),
              hexStringToColor("9DD5C8"),
              hexStringToColor("F8FBFE"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter UserName",
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                  error: _userNameError,
                ),
                _userNameError
                    ? Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Please enter a valid UserName.',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter Email Id",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                  error: _emailError,
                ),
                _emailError
                    ? Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Please enter a valid Email Id.',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outlined,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(
                  context,
                  false,
                  () {
                    if (_validateInputs()) {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Created
