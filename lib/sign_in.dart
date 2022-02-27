import 'package:erichan/infrastructure/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'infrastructure/input_email_address.dart';
import 'infrastructure/input_password.dart';
import 'infrastructure/page_title.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    InputEmailAddress inputEmailField = InputEmailAddress();
    InputPassword inputPasswordField = InputPassword();

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const PageTitle(titleName: 'SignInAccount'),
            inputEmailField,
            inputPasswordField,
            Center(
                child: SignInButton(
                    email: inputEmailField.inputtedText,
                    password: inputPasswordField.value)),
          ],
        ),
      ),
    );
  }
}
