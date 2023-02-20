import 'package:dao/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import './app_style.dart';

class Skills extends StatelessWidget {
  final bool skills;
  final title;

  Skills(this.skills, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              skillTag('assets/images/view.png', 'Viewjs'),
              skills
                  ? skillTag('assets/images/js.png', 'JavaScriptsgffgf')
                  : const Text(''),
              skillTag('assets/images/angular.png', 'Angular'),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          skills
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    skillTag('assets/images/redux.png', 'Redux'),
                    skillTag('assets/images/react.png', 'React'),
                  ],
                )
              : Text(''),
          const SizedBox(
            height: 12,
          ),
          skills
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    skillTag('assets/images/nodejs.png', 'Nodejs'),
                    skillTag('assets/images/express.png', 'Express'),
                    skillTag('assets/images/ts.png', 'TypeScript'),
                  ],
                )
              : Text('')
        ],
      ),
    );
  }
}
