import 'package:flutter/material.dart';


class InterestTile extends StatefulWidget {
  const InterestTile({super.key});

  @override
  State<InterestTile> createState() => _InterestTileState();
}

class _InterestTileState extends State<InterestTile> {
// Interest Array..
var Interest = ['React','HTML','Css','Flutter'];

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child:  Column(
        // keep value start of the Cross and MainAxis becuase we want to title and interest tah should start at same line 
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
      Padding(
        padding: const EdgeInsets.only(right: 270 ,left: 12),
        child: Text('Interest' ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
      ),
SizedBox(height: 10,),
  Container(
    height: 30,
    child: ListView.builder(itemCount: Interest.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index){
      return Container(
        margin: EdgeInsets.only(
                left: index == 0 ? 10 : 15, right: index == 5 - 1 ? 18 : 0),
        width: 80,
        height: 40,
        child: ElevatedButton(
        onPressed: () {
          debugPrint('JavaScripte');
        },
        child: Text(Interest[index].toString() ,style: TextStyle(color: Colors.white), maxLines: 1,overflow: TextOverflow.ellipsis, ),
        style: ElevatedButton.styleFrom(
          backgroundColor:Colors.indigoAccent,
          shape: StadiumBorder(),
          // side: BorderSide(color: Color.fromARGB(255, 30, 31, 32), width: 2),
        ),
      ),
      );
    },
    ),
  )
      ],)
    );
  }
}