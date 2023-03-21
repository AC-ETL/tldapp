import 'package:flutter/material.dart';

class Badges extends StatelessWidget {


 const Badges({super.key});
 final int items=7;
 
  @override
  Widget build(BuildContext context) {
    return Container(
   
child: Column(

   children: [  const Padding(
        padding:  EdgeInsets.only(right: 270 ,left: 12),
        child: Text('Badges' ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
      ),
SizedBox(height: 10,),
 Container(
    height: 30,
    //  Here im building the List view for Learning Tile 
    child: ListView.builder(itemCount:items,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context,index){
      child:return(
        Container( 
           margin: EdgeInsets.only(
                left: index == 0 ? 10 : 15, right: index == 7 - 1 ? 18 : 0),

          child: CircleAvatar(backgroundColor: Color.fromARGB(224, 223, 223, 222) ,child: Icon(Icons.alarm ,size: 19, color: Color.fromARGB(133, 123, 123, 123),),), 


         )
      );
    },
    )

    ),]
    ),






   
    );
  }
}