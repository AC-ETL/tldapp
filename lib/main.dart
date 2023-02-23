// import 'package:dao/sign_in.dart';
import 'package:dao/Screens/sign_in.dart';
import 'package:dao/Screens/sign_up.dart';
import 'package:dao/Screens/user_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String textColor = '#1C2D56';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Raleway',
      ),
      // home: SignInScreen(),
      home: HomeScreen(),
      routes: {
        '/siguppage': (context) =>  SignUpScreen(),
        '/signin': (context) =>  SignInScreen(),
        '/user': (context) =>  UserProfile()
      },
    );
  }
}
