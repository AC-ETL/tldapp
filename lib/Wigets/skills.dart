import 'package:dao/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import './app_style.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'In-Demand Skills',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              skillTag('assets/images/view.png', 'Viewjs'),
              skillTag('assets/images/js.png', 'JavaScript'),
              skillTag('assets/images/angular.png', 'Angular'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              skillTag('assets/images/redux.png', 'Redux'),
              skillTag('assets/images/react.png', 'React'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              skillTag('assets/images/nodejs.png', 'Nodejs'),
              skillTag('assets/images/express.png', 'Express'),
              skillTag('assets/images/ts.png', 'TypeScript'),
            ],
          )
        ],
      ),
    );
  }
}
