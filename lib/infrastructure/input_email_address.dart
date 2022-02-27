import 'package:erichan/utilities/email.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputEmailAddress extends StatelessWidget {
  InputEmailAddress({Key? key}) : super(key: key);
  Email inputtedText = Email();
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Theme.of(context).primaryColor),
      obscureText: false,
      decoration: InputDecoration(
        hintText: "email",
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        enabled: true,
      ),
      onChanged: (String text) {
        inputtedText.updateContents(text);
      },
    );
  }
}
