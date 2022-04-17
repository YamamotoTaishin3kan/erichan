import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemDetailsInputForm extends StatelessWidget {
  ItemDetailsInputForm({Key? key}) : super(key: key);
  String text = "";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      enabled: true,
      maxLength: 100,
      style: const TextStyle(color: Colors.black),
      obscureText: false,
      maxLines: 10,
      decoration: const InputDecoration(labelText: '内容'),
      onChanged: (value) => (text = value),
    );
  }
}
