import 'package:erichan/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'user_profile.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            PageTitle(),
            InputTextField("Mail"),
            InputTextField("Password"),
            CooperationTextButton(),
            Center(child: ConfirmButton()),
          ],
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "create account",
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 32,
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
      style: TextStyle(color: Theme.of(context).primaryColor),
      obscureText: false,
      decoration: InputDecoration(
        hintText: _text,
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        enabled: true,
      ),
      onChanged: (String inputText) {
        if (_text == "Mail") {
          context.read<UserProfile>().userEmail = inputText;
        } else if (_text == "Password") {
          context.read<UserProfile>().userPassword = inputText;
        }
      },
    );
  }
}

class CooperationTextButton extends StatelessWidget {
  const CooperationTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("google連携",
        textAlign: TextAlign.left,
        style: TextStyle(color: Theme.of(context).primaryColor));
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        style: const ButtonStyle(),
        onPressed: () async {
          try {
            // メール/パスワードでユーザー登録
            final FirebaseAuth auth = FirebaseAuth.instance;
            await auth.createUserWithEmailAndPassword(
              email: context.read<UserProfile>().userEmail,
              password: context.read<UserProfile>().userPassword,
            );
            // ユーザー登録に成功した場合
            // チャット画面に遷移＋ログイン画面を破棄
            await Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              }),
            );
          } catch (e) {
            MaterialPageRoute(builder: (context) {
              return const LoginErrorScreen();
            });
          }
        },
        child: const Text(
          "次へ",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
