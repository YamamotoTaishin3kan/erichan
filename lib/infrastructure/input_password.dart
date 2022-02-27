import 'package:erichan/utilities/password.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  InputPassword({Key? key}) : super(key: key);
  Password value = Password();
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Theme.of(context).primaryColor),
      obscureText: false,
      decoration: InputDecoration(
        hintText: "password",
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        enabled: true,
      ),
      onChanged: (String text) {
        value = Password(input: text);
      },
    );
  }
}
