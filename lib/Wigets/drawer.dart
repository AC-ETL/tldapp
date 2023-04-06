// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/Screens/create_sessions.dart';
import 'package:dao/Screens/user_data.dart';
import 'package:dao/Screens/user_home_screen.dart';
import 'package:dao/Screens/user_profile.dart';
import 'package:dao/Screens/home_screen.dart';
import 'package:dao/Screens/sign_in.dart';
import 'package:flutter/material.dart';
import '../model/session_data.dart';
import './app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatefulWidget {
  List<SessioinsData> sessioinsData = [];
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  // final String imgurl =
  //     'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80.png';

  Map<String, dynamic>? userData;

// Taking instanceValue from FirebaseAuth..
  FirebaseAuth auth = FirebaseAuth.instance;
  signOut() async {
    print('...........$auth');
    await auth.signOut();
  }

  @override
  void initState() {
    // TODO: implement initState
    _fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[buildHeader(context), buildMenuItem(context)],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
        color: secondaryColor,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserProfile()),
            );
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top, bottom: 12),
            child: Column(children: [
              // ignore: prefer_const_constructors
              CircleAvatar(
                radius: 52,
                // Here we showing the data condittionally to profile image.............
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80.png'),
                // backgroundImage: Image.asset(),
              ),
              SizedBox(
                height: 15,
              ),
              // Here we showing the data condittionally to profile Name.............
              userData == null
                  ? Container(
                      height: 12,
                      width: 12,
                      child: Image.network('https://i.gifer.com/VZvw.gif'))
                  : Text(
                      userData?['Name'],
                      style: DefaultTextStyle.of(context)
                          .style
                          .apply(fontSizeFactor: 1.5, color: Colors.white),
                    ),
              // Here we showing the data condittionally to profile Email.............
              userData == null
                  ? Container(
                      height: 12,
                      width: 12,
                      child: Image.network('https://i.gifer.com/VZvw.gif'))
                  : Text(
                      userData?['email'],
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.white),
                    )
            ]),
          ),
        ),
      );

  Widget buildMenuItem(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 6, // verticalSpace...
          children: [
            ListTile(
              leading: const Icon(Icons.person_add_alt_1_outlined),
              title: const Text('Home'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Sessions'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserHomeScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspaces_outline),
              title: const Text('Create Sessions'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateSessionPage()),
                )
              },
            ),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Updates'),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UserDate()))
              },
            ),
            ListTile(
              leading: const Icon(Icons.notification_add_outlined),
              title: const Text('Notifications'),
              onTap: () => {print('Notifications')},
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () => {print('Settings')},
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Logout'),
              onTap: () => {
                // Here im calling sigout fn...
                signOut(),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                )
              },
            ),
          ],
        ),
      );
//  This fn write for show the email and password of specific user to the Drawer..
  _fetchUserData() {
    final firebaseUserUid = FirebaseAuth.instance.currentUser?.uid;
    // Here we checkin if the user not exist  then don't fetch the userdata...
    if (firebaseUserUid != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUserUid)
          .get()
          .then((ds) {
        setState(() {
          // Here  im seting the data to class variable userData
          userData = ds.data();
        });
        print(userData);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
