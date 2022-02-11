import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScreenRootController extends StatelessWidget {
  const ScreenRootController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter app',
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }
            if (snapshot.hasData) {
              // User が null でなない、つまりサインイン済みのホーム画面へ
              return HomeScreen();
            }
            // User が null である、つまり未サインインのサインイン画面へ
            return LogInPage();
          },
        ),
      );
}
