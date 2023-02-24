// import 'package:dao/sign_in.dart';
import 'package:dao/Screens/sign_in.dart';
import 'package:dao/Screens/sign_up.dart';
import 'package:dao/Screens/user_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import 'package:provider/provider.dart';
import './provider/sessions_provider.dart';

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
    return ChangeNotifierProvider.value(
      // Here we providing the session data to all child widgets....
      // Here im using value provider beacuse we no need context here..
      value: SessionDataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
              .copyWith(secondary: Colors.lightGreen),
          fontFamily: 'Raleway',
        ),
        // home: SignInScreen(),
        home: HomeScreen(),
        routes: {
          '/siguppage': (context) => SignUpScreen(),
          '/signin': (context) => SignInScreen(),
          '/user': (context) => UserProfile()
        },
      ),
    );
  }
}
