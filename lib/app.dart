import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

import 'package:idle_rpg_flutter/app/pages/auth/register_page.dart';
import 'package:idle_rpg_flutter/app/themes/theme.dart';

import 'app/pages/auth/login_page.dart';
import 'app/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigatorHolder.navigatorKey,
      initialRoute: HomePage.routeName,
      theme: AppTheme.lightTheme,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        LoginPage.routeName: (context) => const LoginPage(),
      },
    );
  }
}
