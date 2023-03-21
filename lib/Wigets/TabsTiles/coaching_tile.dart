import 'package:flutter/material.dart';
import '../../reusable_widgets/reusable_widget.dart';
class Coaching extends StatelessWidget {

  var Leacturs=['ML','AI',"Networing",'Reboot'];

   Coaching ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( child: Column(

   children: [  const Padding(
        padding:  EdgeInsets.only(right: 270 ,left: 12),
        child: Text('Coaching' ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
      ),
SizedBox(height: 10,),
 Container(
    height: 30,
    child: ListView.builder(itemCount: Leacturs.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index){
      return Container(
        margin: EdgeInsets.only(
                left: index == 0 ? 10 : 15, right: index == 5 - 1 ? 18 : 0),
        width: 80,
        height: 40,
        child: findButton(Leacturs[index].toString()) ,);   

    }
    ,)

    ),]
    ),);
  }
}