import 'package:dao/Wigets/TabsTiles/Recommended_tile.dart';
import 'package:dao/Wigets/TabsTiles/coaching_tile.dart';

import '../TabsTiles/badges_tile.dart';

import '../../Wigets/TabsTiles/learning_tile.dart';
import 'package:dao/Wigets/TabsTiles/interest_tile.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellowAccent,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 270, left: 12),
            child: Center(
              child: Text(
                'About me',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 12),
            height: 50,
            width: double.infinity,
            child: Text(
                'I\'m a front end developer with almost 1 year experiance in web and app development'),
          ),
          const InterestTile(),
          const SizedBox(
            height: 20,
          ),
          LearningTile(),
          const SizedBox(
            height: 20,
          ),
          Coaching(),
          const SizedBox(
            height: 20,
          ),
          const Badges(),
          const SizedBox(
            height: 20,
          ),
          Recommended(),
        ],
      ),
    );
  }
}
