import 'package:flutter/material.dart';

class SignInButton extends AuthButtonBase {
  const SignInButton({required void Function() pressed, Key? key})
      : super(title: "SignIn", confirm: pressed, key: key);
}

class CreateAccountButton extends AuthButtonBase {
  const CreateAccountButton({required void Function() pressed, Key? key})
      : super(title: "次へ", confirm: pressed, key: key);
}

class AuthButtonBase extends StatelessWidget {
  const AuthButtonBase(
      {required this.title, required void Function() this.confirm, Key? key})
      : super(key: key);
  final String title;
  final Function confirm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        style: const ButtonStyle(),
        onPressed: () => confirm(),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
