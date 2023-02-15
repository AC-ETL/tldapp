import 'package:dao/Wigets/my_mentors.dart';
import 'package:dao/Wigets/size_config.dart';
import 'package:dao/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import './app_style.dart';
import './size_config.dart';

class UpCommingSessions extends StatelessWidget {
  const UpCommingSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Text(
          'Up Comming Sessions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            ' Sign Up to one of our sessions and start your journey',
            style: TextStyle(fontSize: subhTextSize, color: kTextColor),
          ),
        ),
        SizedBox(
          height: 266,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width / 1.5,
                height: 169,
                width: 250,
                margin: EdgeInsets.only(
                    left: index == 0 ? 18 : 15, right: index == 5 - 1 ? 18 : 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: kCard),
                child: upCommingSessionsWidget(
                    'assets/images/session2.png',
                    'Graphics Design',
                    'jonas Dean',
                    'assets/images/mentor1.png'),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kCard,
          ),
          child: findButton('Load More'),
        )
      ],
    );
  }
}
