import 'package:dao/Wigets/drawer.dart';
import 'package:dao/Wigets/number_widget.dart';
import 'package:flutter/material.dart';
import '../Wigets/app_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final String imgurl =
      'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80.png';
  final double coverHeight = 200;
  final double profileImageHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [buildTop(), buildContent()],
    ));
  }
// This is widget method containinh somemore widgets..
  Widget buildTop() {
    final double top = coverHeight - profileImageHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildCoverImage(),
          Positioned(top: top, child: builProfileImage())
        ]);
  }

  Widget buildCoverImage() {
    return Container(
      color: kborderGreyblue,
      child: Image.network(
        imgurl,
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget builProfileImage() {
    return CircleAvatar(
      radius: profileImageHeight / 2,
      backgroundColor: kwhite,
      child: CircleAvatar(
        radius: 65,
        backgroundImage: NetworkImage(imgurl),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: [
        SizedBox(
          height: 80,
        ),
        Text('Muhammad Sajid',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 8,
        ),
        Text('Web Developer'),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            circuleAvatar(FontAwesomeIcons.twitter, kiconBlue),
            const SizedBox(
              width: 12,
            ),
            circuleAvatar(FontAwesomeIcons.facebook, kiconBlue),
            const SizedBox(
              width: 12,
            ),
            circuleAvatar(FontAwesomeIcons.linkedin, kiconBlue),
            const SizedBox(
              width: 12,
            ),
            circuleAvatar(FontAwesomeIcons.github, kblackColor),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Divider(),
        NumberWidget(),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 16,
        ),
        Divider(),
        SizedBox(
          height: 16,
        ),
        buildAbout(),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text('About',
        //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(
        //           'Iam a flutter with vast expriance of app development and want to learn everyday new things '),
        //     )
        //   ],
        // ),
      ],
    );
  }

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 16,
            ),
            Text(
                'Iam a flutter with vast expriance of app development and want to learn everyday new things ')
          ],
        ),
      );

  Widget circuleAvatar(IconData icon, Color iconColor) {
    return CircleAvatar(
        radius: 20,
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.white,
          child: InkWell(
            child: Center(
                child: Icon(
              icon,
              size: 25,
              color: iconColor,
            )),
            onTap: () {},
          ),
        ));
  }
}
