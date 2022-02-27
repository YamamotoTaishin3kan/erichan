import 'package:erichan/utilities/email.dart';
import 'package:erichan/utilities/password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';

class SignInButton extends StatelessWidget {
  SignInButton({Key? key, required this.email, required this.password})
      : super(key: key);
  Email email;
  Password password;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        style: const ButtonStyle(),
        onPressed: () async {
          try {
            final FirebaseAuth auth = FirebaseAuth.instance;
            await auth.signInWithEmailAndPassword(
              email: email.value ?? "",
              password: password.value ?? "",
            );
          } catch (e) {
            MaterialPageRoute(builder: (context) {
              return const LoginErrorScreen();
            });
          }
        },
        child: const Text(
          "Sign In",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
