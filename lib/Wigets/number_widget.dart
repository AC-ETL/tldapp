import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        builButtons(text: 'Projects', value: 123),
        builButtons(text: 'Following', value: 2524),
        builButtons(text: 'Followers', value: 6354)
      ],
    );
  }

  Widget builButtons({required String text, required int value}) =>
      MaterialButton(
        onPressed: () {},
        padding: EdgeInsets.symmetric(vertical: 4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('$value',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 12,
              ),
              Text(
                '$text',
                style: TextStyle(fontSize: 16),
              ),
            ]),
      );
}
