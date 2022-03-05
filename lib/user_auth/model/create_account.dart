import 'package:erichan/firebase_adapter.dart';
import 'package:erichan/user_auth/model/create_account_button.dart';
import 'package:flutter/material.dart';
import 'email_form.dart';
import 'go_to_sign_in_button.dart';
import 'password_form.dart';
import 'screen_title.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({Key? key}) : super(key: key);

  final EmailForm _emailField = EmailForm();
  final PasswordForm _passwordField = PasswordForm();

  void _confirmAction() {
    FirebaseAdapter.createUserWithEmailAndPassword(
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
            const ScreenTitle(titleName: 'CreateAccount'),
            _emailField,
            _passwordField,
            Center(child: CreateAccountButton(_confirmAction)),
            const Go2SignInButton(),
          ],
        ),
      ),
    );
  }
}
