import 'package:erichan/infrastructure/create_button.dart';
import 'package:flutter/material.dart';
import 'infrastructure/input_email_address.dart';
import 'infrastructure/input_password.dart';
import 'infrastructure/page_title.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);

  InputEmailAddress inputEmailField = InputEmailAddress();
  InputPassword inputPasswordField = InputPassword();

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
            const PageTitle(titleName: 'CreateAccount'),
            inputEmailField,
            inputPasswordField,
            const CooperationTextButton(),
            Center(
                child: CreateAccountButton(
              email: inputEmailField.inputtedText,
              password: inputPasswordField.value,
            )),
          ],
        ),
      ),
    );
  }
}

class CooperationTextButton extends StatelessWidget {
  const CooperationTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("google連携",
        textAlign: TextAlign.left,
        style: TextStyle(color: Theme.of(context).primaryColor));
  }
}
