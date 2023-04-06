import 'package:dao/Screens/home_Screen.dart';
import 'package:dao/Screens/sign_in.dart';
import 'package:dao/Screens/sign_up.dart';
import 'package:dao/Screens/user_profile.dart';
import 'package:dao/localizations/app_localization_delegate.dart';
import 'package:dao/localizations/language.dart';
import 'package:dao/provider/sessions_provider.dart';
import 'package:dao/theme/app_notifier.dart';
import 'package:dao/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutx/themes/app_theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppTheme.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ChangeNotifierProvider<AppNotifier>(
    create: (context) => AppNotifier(),
    child: ChangeNotifierProvider<FxAppThemeNotifier>(
      create: (context) => FxAppThemeNotifier(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final String textColor = '#1C2D56';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => SessionDataProvider())
      ],
      child: Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            builder: (context, child) {
              return Directionality(
                textDirection: AppTheme.textDirection,
                child: child!,
              );
            },
            localizationsDelegates: [
              AppLocalizationsDelegate(context),
              // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: Language.getLocales(),
            // home: IntroScreen(),
            // home: SplashScreen(),
            home: HomeScreen(),
            routes: {
              '/siguppage': (context) => SignUpScreen(),
              '/signin': (context) => const SignInScreen(),
              '/user': (context) => const UserProfile()
            },
          );
        },
      ),
    );
  }
}
