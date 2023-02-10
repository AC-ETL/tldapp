// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:dao/Wigets/drawer.dart';
import 'package:dao/sign_in.dart';
import 'package:dao/utils/color_utils.dart';
import 'package:flutter/material.dart';
import '../Wigets/header.dart';

// This main screen after login....

class HomeScreen extends StatefulWidget {
  //  Iniialls colors
  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = Color.fromARGB(255, 149, 124, 190);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);
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
              Icons.search_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      // -----------------------Appbar end---------------------------------
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1501031170107-cfd33f0cbdcc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                ),
              ),
              child: Row(children: [
                Expanded(
                  child: Container(
                    color: Colors.amber,
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.red,
                ))
              ]),
            ),
            // child: Header(),
          ],
        ),
      ),
    );
  }
}
