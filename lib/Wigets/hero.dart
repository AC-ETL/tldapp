import 'package:dao/reusable_widgets/reusable_widget.dart';
import 'package:dao/utils/color_utils.dart';
import 'package:flutter/material.dart';
import './app_style.dart';

class Hero_Sections extends StatelessWidget {
  final String name;
  final String imgurl =
      'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.png';
  final String imgurl2 =
      'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.png';
  final String imgurl3 =
      'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.png';
  final String imgurl4 =
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80.png';
  final String imgurl5 =
      'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.png';
  final String imgurl6 =
      'https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80.png';

  Hero_Sections(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.3,
      // width: MediaQuery.of(context).size.width * 1,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        gradient: LinearGradient(colors: [
          hexStringToColor("9DD5C8"),
          hexStringToColor("9DD5C8"),
          hexStringToColor("F8FBFE"),
        ], begin: Alignment.topLeft, end: Alignment.centerRight),
      ),
      // image: DecorationImage(
      //   fit: BoxFit.cover,
      //   image: NetworkImage(
      //       'https://images.unsplash.com/photo-1501031170107-cfd33f0cbdcc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
      // ),

      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(children: [
            Text(
              'Find and Book a',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(28, 45, 86, 1)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Mentor for your 1:1',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(28, 45, 86, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 33),
              child: Text(
                'help today!',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(28, 45, 86, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 5),
              child: Text(
                'We have over 200 Mentors available,',
                style: TextStyle(
                    fontSize: 8, color: Color.fromRGBO(28, 45, 86, 1)),
              ),
            ),
            Text(
              'qualified in over 300 subjects',
              style: TextStyle(
                fontSize: 8,
                color: Color.fromRGBO(28, 45, 86, 1),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 20,
              width: 100,
              child: findButton('Find Mentor'),
            )
          ]),
        ),
        // -------------------------------Second Column------------------------------------------------
        Container(
          width: 170,
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 12, left: 70),
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: kborderlightYellow,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(imgurl),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(
                  right: 80,
                ),
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: kborderBlue,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(imgurl2),
                  ),
                )),
            CircleAvatar(
              radius: 27,
              backgroundColor: kborderlightGreen,
              child: CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(imgurl3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 7, bottom: 10),
                    child: CircleAvatar(
                      backgroundColor: kborderGreyblue,
                      radius: 22,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(imgurl4, scale: 1.0),
                      ),

                      // backgroundImage: Image.asset(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: kbordersilver,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(imgurl5, scale: 1.0),
                      ),

                      // backgroundImage: Image.asset(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: CircleAvatar(
                      backgroundColor: kborderlightYellow,
                      radius: 22,
                      child: CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(imgurl6, scale: 1.0)),

                      // backgroundImage: Image.asset(),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          // color: Colors.red,
        ),
      ]),
    );
    // child: Header(),
  }
}
