import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleInputForm extends StatelessWidget {
  TitleInputForm({Key? key}) : super(key: key);
  String text = "";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      enabled: true,
      maxLength: 30,
      style: const TextStyle(color: Colors.black),
      obscureText: false,
      maxLines: 1,
      decoration: const InputDecoration(
        hintText: 'タイトルを入力してください',
        labelText: 'タイトル',
      ),
      onChanged: (value) => (text = value),
    );
  }
}
