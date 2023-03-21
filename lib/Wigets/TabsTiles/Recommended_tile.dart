import 'package:dao/Wigets/TabsTiles/Recmnded_list.dart';
import 'package:dao/Wigets/app_style.dart';
import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
       child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
   children: [  const Padding(
        padding:  EdgeInsets.only(left: 12),
        child: Text(' MY Recommendetions' ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
      ),
SizedBox(height: 10,),


SizedBox(height: 20,),
RecommendedList(),
SizedBox(height: 10,),
Divider(),
SizedBox(height: 20,),
RecommendedList(),
SizedBox(height: 10,),
Divider(),
SizedBox(height: 20,),
RecommendedList(),
SizedBox(height: 10,),
Divider(),
SizedBox(height: 20,),
RecommendedList(),
SizedBox(height: 10,),
Divider(),


]
 

,),) ;
  }
}