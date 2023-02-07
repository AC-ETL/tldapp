// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_signin/screens/signin_screen.dart';

import 'package:dao/Wigets/drawer.dart';

import 'package:dao/sign_in.dart';
import 'package:flutter/material.dart';

// This main screen after login....

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 7,
        title: Text('LearningDAO'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      // -----------------------appbar end---------------------------------
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: ElevatedButton(
                child: Text("Logout"),
                onPressed: () {
                  print('User logouted');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
              ),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
