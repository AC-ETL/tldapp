import 'package:dao/Wigets/my_mentors.dart';
import 'package:dao/Wigets/size_config.dart';
import 'package:dao/model/session_data.dart';
import 'package:dao/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import './app_style.dart';
import './size_config.dart';

class UpCommingSessions extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool moreBtn;
  //  This is List of sessions getting data from parent widget🎈🎈🎈
  List<SessioinsData> sessioinsData;

  final bool sessionShow;
  UpCommingSessions(this.title, this.subTitle, this.moreBtn, this.sessionShow,
      this.sessioinsData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            subTitle,
            style: TextStyle(fontSize: subhTextSize, color: kTextColor),
          ),
        ),
        SizedBox(
            // height: 266,
            height: MediaQuery.of(context).size.height * 0.35,
            child: sessionShow
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sessioinsData.length,
                    itemBuilder: (context, index) {
                      return Container(
                          // height: MediaQuery.of(context).size.height,
                          // width: MediaQuery.of(context).size.width / 1.5,
                          height: 169,
                          width: 250,
                          margin: EdgeInsets.only(
                              left: index == 0 ? 18 : 15,
                              right: index == 5 - 1 ? 18 : 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: kCard),
                          child: upCommingSessionsWidget(
                              sessioinsData[index].image,
                              sessioinsData[index].title,
                              sessioinsData[index].instructor,
                              sessioinsData[index].image,
                              sessioinsData[index].startTime));
                    },
                  )
                : const Text('You have no registered sessions')),
        moreBtn
            ? SizedBox(
                height: 20,
              )
            : Text(''),
        moreBtn
            ? Container(
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kCard,
                ),
                child: findButton('Load More'))
            : const Text('')
      ],
    );
  }
}
