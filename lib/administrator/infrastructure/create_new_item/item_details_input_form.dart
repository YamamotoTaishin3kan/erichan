import 'package:flutter/material.dart';

class ItemDetailsInputForm extends TextFormField {
  ItemDetailsInputForm({Key? key})
      : super(
          key: key,
          enabled: true,
          maxLength: 100,
          style: const TextStyle(color: Colors.black),
          obscureText: false,
          maxLines: 10,
          decoration: const InputDecoration(labelText: '内容'),
          onChanged: (_) {},
        );
}
