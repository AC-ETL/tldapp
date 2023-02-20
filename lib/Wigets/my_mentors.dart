import 'package:flutter/material.dart';
import './app_style.dart';
import '../model/mentors.dart';
import 'package:intl/intl.dart';
import './size_config.dart';

class MyMentors extends StatelessWidget {
  final List<Mentors> _allMentors = [
    Mentors(
      id: 'm1',
      name: 'Holly Fax',
      workingHours: 23,
      workingfield: 'Graphic Designer',
      imgurl:
          'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80.png',
      date: DateTime.utc(2023),
    ),
    Mentors(
      id: 'm2',
      name: 'Valerie Fax',
      workingHours: 23,
      workingfield: 'Graphic Designer',
      imgurl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80.png',
      date: DateTime.utc(2023),
    ),
    Mentors(
        id: 'm3',
        name: 'James Dean',
        workingHours: 23,
        workingfield: 'Graphic Designer',
        date: DateTime.utc(2023),
        imgurl:
            'https://images.unsplash.com/photo-1639747280804-dd2d6b3d88ac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80.png'),
    Mentors(
        id: 'm4',
        name: ' Tom Jones',
        workingHours: 23,
        workingfield: 'Graphic Designer',
        date: DateTime.utc(2023),
        imgurl:
            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
    Mentors(
        id: 'm5',
        name: 'Arien Fench',
        workingHours: 23,
        workingfield: 'Graphic Designer',
        date: DateTime.utc(2023),
        imgurl:
            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        itemCount: _allMentors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 170,
            width: 170,
            margin: EdgeInsets.only(
                left: index == 0 ? 18 : 15, right: index == 5 - 1 ? 18 : 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadus),
              color: Colors.amber,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('${_allMentors[index].imgurl}'),
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 130, top: 4),
                    child: Icon(
                      Icons.heart_broken_rounded,
                      color: primaryColor,
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50, left: 5),
                            child: Text(
                              '${_allMentors[index].name}',
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 40, bottom: 3),
                            child: Text(
                              '${_allMentors[index].workingfield}',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 8),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_allMentors[index].workingHours}',
                            style: TextStyle(color: primaryColor, fontSize: 8),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                              '${DateFormat.yMd().format(_allMentors[index].date)}',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 8)),
                        ],
                      ),
                    ],
                  )
                ]),
          );
        },
      ),
    );
  }
}
