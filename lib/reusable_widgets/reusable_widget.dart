import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/Wigets/size_Config.dart';
import 'package:flutter/material.dart';
import '../Wigets/app_style.dart';

Image logoWidget(String imageName) {
  return Image.asset(imageName,
      fit: BoxFit.fitWidth,
      width: 180,
      height: 180,
      color: Colors.white,
      scale: 1.0);
}

// Text field reuseable...................
TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

// ..................... Sign up & Sign-in Button............................................😎😎
Container firebaseUIButton(BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        islogin ? 'Login' : 'Signup',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Container googleUIButton(BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        islogin ? 'Google' : 'GitHub',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

//  Outline find mentor buttons......
OutlinedButton findButton(String text) {
  return OutlinedButton(
    onPressed: () {
      print('Find Mentors.......');
    },
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
    ),
    child: Text(
      '${text}',
      style: TextStyle(fontSize: 10),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
//  Skills Tag

Row skillTag(String imurl, String name) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        // width: 120,
        // height: 50,
        child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.5,
                color: kborderblue,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: EdgeInsets.all(7),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 15,
                      backgroundColor: kwhite,
                      backgroundImage: AssetImage(imurl)),
                  SizedBox(
                    width: 3,
                  ),
                  Container(
                    width: 60,
                    child: Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.w300),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )),
      ),
    ],
  );
}

//  this widget is column of upcomming sessions
Column upCommingSessionsWidget(String imgurl, String title, String mentorname,

    String mentorimgurl, DateTime startime) {
  return Column(children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadus),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(imgurl),fit: BoxFit.fill)),
      )
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '200+Attendess',
            style: TextStyle(fontSize: 10),
          ),
          Text(
            // startime.toDate().toString(),
            startime.toString(),
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(right: 120),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    SizedBox(
      height: 15,
    ),
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: kwhite,
            backgroundImage: NetworkImage(mentorimgurl),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            mentorname,
            style: const TextStyle(fontSize: 10),
          ),
        )
      ],
    )
  ]);
}
