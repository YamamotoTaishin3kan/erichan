import 'package:flutter/material.dart';

class TitleInputForm extends TextField {
  TitleInputForm({Key? key})
      : super(
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
          onChanged: (_) {},
        );
}
