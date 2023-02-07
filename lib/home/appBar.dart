import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Scaffold(),
        AppBar(
          title: Text('LearningDAO'),
        )
      ],
    );
  }
}
