import 'package:erichan/utilities/email.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmailForm extends StatelessWidget {
  EmailForm({Key? key}) : super(key: key);
  Email text = Email(text: '');
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Theme.of(context).primaryColor),
      obscureText: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => value!.isEmpty ? 'Email can\'t be empty' : null,
      onChanged: (value) => text = Email(text: value),
      decoration: InputDecoration(
        hintText: "email",
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        enabled: true,
      ),
    );
  }
}
