import 'package:dao/utils/firebase.dart';
import 'package:flutter/material.dart';
import './app_style.dart';
import '../model/mentors.dart';
import './size_config.dart';

class MyMentors extends StatefulWidget {
  @override
  State<MyMentors> createState() => _MyMentorsState();
}

class _MyMentorsState extends State<MyMentors> {
  final ApiService _apiService = ApiService();

  List<Map<String, dynamic>> _featuredUsers = [];

  final List<Mentors> _allFeaturedMentors = [];
  //  This is Array or list of Mentors data whichs we used Display..
  List<Mentors> _allMentors = [];

  @override
  Widget build(BuildContext context) {
    _apiService.getUsers(true).then((users) {
      setState(() {
        _featuredUsers = users;
      });
      _featuredUsers.forEach((element) {
        _allFeaturedMentors.add(Mentors(
            name: element["summry"]["displayName"],
            workingHours: 200,
            workingfield: element["interest"].toString(),
            date: DateTime.utc(2023),
            imgurl: element["summry"]["image"],
            id: element["id"]));
        print(element);
      });
    }).catchError((error) {
      print('Error fetching users: $error');
    });

    setState(() {
      _allMentors = _allFeaturedMentors;
    });

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
              color: Colors.grey.shade200,
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
                      Icons.favorite,
                      color: primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${_allMentors[index].name}',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${_allMentors[index].workingHours.toInt()}',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
          );
        },
      ),
    );
  }
}
