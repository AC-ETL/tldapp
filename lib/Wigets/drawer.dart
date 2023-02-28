import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/Screens/create_sessions.dart';
import 'package:dao/Screens/user_home_screen.dart';
import 'package:dao/Wigets/carsuol.dart';
import 'package:dao/Screens/sessions.dart';
import 'package:dao/Screens/user_profile.dart';
import 'package:dao/Screens/home_screen.dart';
import 'package:dao/Screens/sign_in.dart';
import 'package:flutter/material.dart';
import '../model/session_data.dart';
import './carsuol.dart';
import './app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatefulWidget {
  List<SessioinsData> sessioinsData = [];
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final String imgurl =
      'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80.png';

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            FirebaseFirestore.instance
                .collection("users")
                .doc("oW8HjYPw0sR4NqEO9lAM7hIAXDH2")
                .get()
                .then((value) {
              print("  ${value.data()}");
            });
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const UserProfile()),
            // ),
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top, bottom: 12),
            child: Column(children: [
              CircleAvatar(
                radius: 52,

                backgroundImage: NetworkImage(imgurl, scale: 1.0),
                // backgroundImage: Image.asset(),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Muhammad Sajid",
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 1.5, color: Colors.white),
              ),
              Text(
                "sajid93116@gmail.com",
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
                  MaterialPageRoute(
                      builder: (context) => const CreateSessions()),
                )
              },
            ),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Updates'),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomCarouselFB2()))
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()))
              },
            ),
          ],
        ),
      );

  fetchData() async {
    var data = FirebaseFirestore.instance.collection("sessions").snapshots();
    data.map((value) {
      // print(value.docs[0]);
      var data2 = value.docs;

      // List<QueryDocumentSnapshot<SessioinsData>> sessionData=value.docs!.forEach((element) { });

      for (var element in value.docs) {
        setState(() {
          //SessioinsData sessioinsData=SessioinsData.fromJson(element.data());
          widget.sessioinsData.add(SessioinsData.fromJson(element.data()));
        });
        //widget.sessioinsData=value.docs as List<SessioinsData>;

        //  print("    in session ${widget.sessioinsData!.image}");
      }
    }).toList();

    // print("data   $data2");s
  }
}
