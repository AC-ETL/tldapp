import 'package:dao/Wigets/drawer.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String imgurl =
      'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80.png';
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imgurl),
            Center(
              child: Text('Muhammad sajid'),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
