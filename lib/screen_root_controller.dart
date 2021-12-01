import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_page.dart';

class ScreenRoot extends StatelessWidget {
  const ScreenRoot({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: 'LogInPage',
        routes: {
          'LogInPage': (context) => const LogInPage(),
          'HomeScreen': (context) => HomeScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const LogInPage());
  }
}
