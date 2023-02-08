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
//  In This is way we declare variable in dart and can use anywhere we want......
  static const String _title = 'Learning DAO';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 7,
        title: const Text(_title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.document_scanner,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      // -----------------------Appbar end---------------------------------
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
