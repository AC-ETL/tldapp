import './drawer.dart';
import 'package:flutter/material.dart';

class FavroitePage extends StatelessWidget {
  const FavroitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SessionPage'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: [
          Text(' Session Page'),
        ]),
      ),
      drawer: AppDrawer(),
    );
  }
}
