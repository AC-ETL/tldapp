import 'package:dao/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';


class LearningTile extends StatefulWidget {
 final Learning=['ML','AI',"Networing",'Reboot'];



   LearningTile({super.key});
  @override
  State<LearningTile> createState() => _LearningTileState();
}

class _LearningTileState extends State<LearningTile> {
  @override
  Widget build(BuildContext context) {
    return Container( child: Column(

   children: [  const Padding(
        padding:  EdgeInsets.only(right: 270 ,left: 12),
        child: Text('Learning' ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
      ),
SizedBox(height: 10,),
 Container(
    height: 30,
    //  Here im building the List view for Learning Tile 
    child: ListView.builder(itemCount: widget.Learning.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index){
      return Container(
        margin: EdgeInsets.only(
                left: index == 0 ? 10 : 15, right: index == 5 - 1 ? 18 : 0),
        width: 80,
        height: 40,
        child: findButton(widget.Learning[index].toString()) ,);   

    }
    ,)

    ),]
    ),);
  }
}