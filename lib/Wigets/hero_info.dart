import 'package:dao/reusable_widgets/reusable_widget.dart';
import 'package:dao/utils/color_utils.dart';
import 'package:flutter/material.dart';
import '../Wigets/size_config.dart';

class HeroInfo extends StatelessWidget {
  const HeroInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      // width: 700,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        gradient: LinearGradient(colors: [
          hexStringToColor("9DD5C8"),
          hexStringToColor("9DD5C8"),
          hexStringToColor("F8FBFE"),
        ], begin: Alignment.topLeft, end: Alignment.centerRight),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Helping the world one Mentor at a time',
            style: TextStyle(
              fontSize: hTextSize,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(28, 45, 86, 1),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Sifting through the overwhelming content  ',
          style: TextStyle(
            fontSize: subhTextSize,
            color: Color.fromRGBO(28, 45, 86, 1),
          ),
        ),
        Text(
          'on the internet will slow you down.Break through ',
          style: TextStyle(
            fontSize: subhTextSize,
            color: Color.fromRGBO(28, 45, 86, 1),
          ),
        ),
        Text(
          ' the noise and get specific advice directly from the experts..',
          style: TextStyle(
            fontSize: subhTextSize,
            color: Color.fromRGBO(28, 45, 86, 1),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          height: 30,
          // width: MediaQuery.of(context).size.width,
          width: 140,
          child: findButton('Let’s Find a Mentor'),
        )
      ]),
    );
  }
}
