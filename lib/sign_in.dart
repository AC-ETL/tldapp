import 'package:dao/sign_up.dart';
import 'package:dao/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './reusable_widgets/reusable_widget.dart';
import 'home.dart';

class SignInScreen extends StatefulWidget {
  // const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
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
              reusableTextField("Enter the username", Icons.person_outline,
                  false, _emailTextController),
              const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter the Password", Icons.lock_outlined, true,
                  _passwordTextController),
              const SizedBox(
                height: 30,
              ),
              firebaseUIButton(
                  context,
                  true,
                  () => {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  ),
                                })
                            .onError((error, stackTrace) => {})
                      }),
              signUpOption()
            ]),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
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
}
