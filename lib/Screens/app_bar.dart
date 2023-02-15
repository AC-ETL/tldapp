import 'package:flutter/material.dart';

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBar(
          title: const Text('LearningDAO'),
        )
      ],
    );
  }
}
