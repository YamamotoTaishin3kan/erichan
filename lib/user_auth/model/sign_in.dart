import 'package:erichan/user_auth/infrastructure/button.dart';
import 'package:erichan/user_auth/infrastructure/go_to_create_account_button.dart';
import 'package:erichan/user_auth/infrastructure/password_form.dart';
import 'package:flutter/material.dart';
import '../../application/firebase_adapter.dart';
import '../infrastructure/email_form.dart';
import '../infrastructure/screen_title.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final EmailForm _emailField = EmailForm();
  final PasswordForm _passwordField = PasswordForm();

  void _confirmAction() {
    FirebaseAdapter.signInWithEmailAndPassword(
        email: _emailField.text, password: _passwordField.text);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ScreenTitle(titleName: 'SignInAccount'),
            _emailField,
            _passwordField,
            Center(child: SignInButton(pressed: _confirmAction)),
            const Go2CreateAccountButton(),
          ],
        ),
      ),
    );
  }
}
