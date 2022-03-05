import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton(this.confirm, {Key? key}) : super(key: key);

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
          "次へ",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
