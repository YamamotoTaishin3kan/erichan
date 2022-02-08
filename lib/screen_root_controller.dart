import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScreenRoot extends StatelessWidget {
  const ScreenRoot({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String root;

    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
        root = 'LogInPage';
      } else {
        debugPrint('User is signed in!');
        root = 'HomeScreen';
      }
    });

    return MaterialApp(
      initialRoute: 'LogInPage',
      routes: {
        'LogInPage': (context) => LogInPage(),
        'HomeScreen': (context) => const HomeScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
    );
  }
}
