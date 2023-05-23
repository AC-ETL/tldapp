import 'package:flutter/material.dart';

class SampleHome extends StatefulWidget {
  const SampleHome({Key? key}) : super(key: key);

  @override
  State<SampleHome> createState() => _SampleHomeState();
}

class _SampleHomeState extends State<SampleHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Custom Home."),
      ),
    );
  }
}
