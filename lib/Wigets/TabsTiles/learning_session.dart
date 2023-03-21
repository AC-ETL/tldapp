import 'package:dao/Wigets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LearnigSession extends StatelessWidget {
  final sessions=4;
  const LearnigSession({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
       child:  GridView.builder(
  itemCount: sessions,
  itemBuilder: (context, index) {

    padding: const EdgeInsets.all(10.0);
      
    return ListTile(
  
  leading: Container(
    // height: ,
    width: 70,
    decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.amber,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
              ),
  ),
  
),
title: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height: 12,),
    Text('9/03/2023' , style: TextStyle(fontSize: 9),),
    SizedBox(height: 3,),
    Text('Everything Design' , style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
    SizedBox(height: 2,),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      
      children: [
         Container(
            height: 16,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: kwhite,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1678346496584-e81410d1e697?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=449&q=80'),
            ),
          ),
        
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            'M sajid',
            style: const TextStyle(fontSize: 5),
            maxLines: 1,
          overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    )
  ],
),


);
  },
  
  
  
  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 1.5,
        crossAxisSpacing: 0,
        mainAxisSpacing: 1,
      ),
      
      )
      
// Padding(
//   padding: const EdgeInsets.only(right: 255  , top: 25),
//   child:  
  

//    Text('Learning' ,style: TextStyle( fontSize: 15 ,fontWeight: FontWeight.bold),),
// ),


      
    );
  }
}