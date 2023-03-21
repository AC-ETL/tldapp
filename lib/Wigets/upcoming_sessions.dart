
import 'package:dao/Wigets/size_config.dart';
import 'package:dao/provider/sessions_provider.dart';
import 'package:dao/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import './app_style.dart';
import 'package:provider/provider.dart';

class UpCommingSessions extends StatefulWidget {
  final String title;
  final String subTitle;
  final bool moreBtn;
  //  This is List of sessions getting data from parent widget🎈🎈🎈
  // List<SessioinsData> sessioinsData;
  
  

  final bool sessionShow;
  UpCommingSessions(
    this.title,
    this.subTitle,
    this.moreBtn,
    this.sessionShow,
  );

  @override
  State<UpCommingSessions> createState() => _UpCommingSessionsState();
}

class _UpCommingSessionsState extends State<UpCommingSessions> {
var sessions=[];

  // void initState() {
  //   SessionDataProvider sessionsData =
  //       Provider.of<SessionDataProvider>(context, listen: false);
  //   sessionsData.fetchData();
    
  //     sessions = sessionsData.sessions;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    //  Here we listening the data pass the data to upcommingsession widget....🎈🎈
    final sessionsData = Provider.of<SessionDataProvider>(context);
       sessionsData.fetchData();
     
     sessions = sessionsData.sessions;
     setState(() {
        sessions;
     });
   
    // Here we accessing the method who return the all sessions data
    


    return sessions.isEmpty?const Text('data') : Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            widget.subTitle,
            style: TextStyle(fontSize: subhTextSize, color: kTextColor),
          ),
        ),
        SizedBox(
            // height: 266,
            height: MediaQuery.of(context).size.height * 0.35,
            child: widget.sessionShow
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sessions.length,
                    itemBuilder: (context, index) {
                      return  Container(
                        // height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 169,
                        // width: 250,
                        margin: EdgeInsets.only(
                            left: index == 0 ? 18 : 15,
                            right: index == 5 - 1 ? 18 : 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: kCard),
                        child: upCommingSessionsWidget(
                            sessions[index].image,
                            sessions[index].title,
                            sessions[index].instructor,
                            sessions[index].image,
                            sessions[index].endTime.toDate()),
                      );
                    },
                  )
                : const Text('You have no registered sessions')),
        widget.moreBtn
            ? SizedBox(
                height: 20,
              )
            : Text(''),
        widget.moreBtn
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