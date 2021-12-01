import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //Todo
            children: const [
              PageDescription(),
              InputTextField("Name"),
              InputTextField("Mail"),
              ConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class PageDescription extends StatelessWidget {
  const PageDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 30, 5), // もっといいのありそう
      child: Text(
        "create account",
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 36,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField(this._text);
  final String _text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: _text,
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        enabled: true,
      ),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'HomeScreen');
      },
      child: const Text(
        "次へ",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
