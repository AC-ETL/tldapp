import 'package:dao/Wigets/TabsTiles/learning_session.dart';
import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 270, left: 12, top: 20),
          child: Center(
            child: Text(
              'Learning',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        LearnigSession(),
      ],
    ));
  }
}
