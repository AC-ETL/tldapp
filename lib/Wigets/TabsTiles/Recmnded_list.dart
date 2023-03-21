import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
  
  leading: Container(
    height: 800,
    width: 100,
    decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.amber,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://images.unsplash.com/photo-1573164574572-cb89e39749b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80'),
              ),
  ),
  
),
onTap: () {
  print('tabed');
},

title: Text('Everything You Need To Know About Java ' , style: TextStyle( fontSize: 12),  ),

trailing: Padding(

  padding: const EdgeInsets.only(bottom: 20),
  child:   Icon(Icons.arrow_outward_sharp ,size: 15,),
),
);
  }
}