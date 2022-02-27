import 'package:erichan/sign_in.dart';
import 'package:flutter/material.dart';
import 'error_widget.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScreenRootController extends StatelessWidget {
  const ScreenRootController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, user) {
            switch (user.connectionState) {
              case ConnectionState.none:
                return const AuthError();
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
                return user.hasData
                    ? HomeScreen(user.data!)
                    : const SignInPage();
              case ConnectionState.done:
                return const AuthError();
            }
          },
        ),
      );
}
