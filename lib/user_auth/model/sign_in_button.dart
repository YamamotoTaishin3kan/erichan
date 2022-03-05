import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton(this.confirm, {Key? key}) : super(key: key);
  final Function confirm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        style: const ButtonStyle(),
        onPressed: () => confirm(),
        child: const Text(
          "Sign In",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class AuthButtonBase extends StatelessWidget {
  const AuthButtonBase(this.confirm, {Key? key}) : super(key: key);
  final Function confirm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        style: const ButtonStyle(),
        onPressed: () => confirm(),
        child: const Text(
          "Sign In",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
