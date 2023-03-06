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
Map<String,dynamic>? myEmail;
Map<String,dynamic>? summry;

@override
  void initState() {
    // TODO: implement initState
  _fetch();



    super.initState();
  }


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
            // FirebaseFirestore.instance
            //     .collection("users")
            //     .doc("oW8HjYPw0sR4NqEO9lAM7hIAXDH2")
            //     .get()
            //     .then((value) {
            //   print("  ${value.data()}");
            // });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserProfile()),
            );
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top, bottom: 12),
            child: Column(children: [
              CircleAvatar(
                radius: 52,
             // Here we showing the data condittionally to profile image.............
                backgroundImage: NetworkImage(  summry==null?'https://i.gifer.com/SVKl.gif': summry?['image'], scale: 1.0),
                // backgroundImage: Image.asset(),
              ),
              SizedBox(
                height: 15,
              ),
              // Here we showing the data condittionally to profile Name.............
              summry==null? Container( height: 12 ,width: 12, child: Image.network('https://i.gifer.com/VZvw.gif') )  : Text(
                 summry?['displayName'],

                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 1.5, color: Colors.white),
              ),
              // Here we showing the data condittionally to profile Email.............
              myEmail==null?Container( height: 12 ,width: 12, child: Image.network('https://i.gifer.com/VZvw.gif') ):   Text(
                
                
                summry?['email'],
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
                        builder: (context) =>const UserDate() ))
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

  _fetch() {
    final firebaseUser =  FirebaseAuth.instance.currentUser;
    // Here we checkin if the user not exist  then don't fetch the userdata...
    if (firebaseUser != null){
       FirebaseFirestore.instance
          .collection('users')
          .doc('6g0Ri6ZfecRLHGnuLhb3UvxviBj2')
          .get()
          .then((ds) {
     final data =ds.data();
     print(data);
    final summryData  =data?['summry'];
    //  Here we rerender the widget to show backend data
    setState(() {
    myEmail=data;
    summry=summryData;
    });

    print( '>>'+summryData['email']);


      

      }).catchError((e) {
        print(e);
      });
    }
   }
}
