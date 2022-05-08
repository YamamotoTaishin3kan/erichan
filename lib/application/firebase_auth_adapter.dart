import 'package:erichan/user_auth/entities/email.dart';
import 'package:erichan/user_auth/entities/password.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthAdapter {
  static final FirebaseAuth _firebase = FirebaseAuth.instance;

  static void createUserWithEmailAndPassword(
      {required Email email, required Password password}) async {
    try {
      await _firebase.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } catch (e) {
      print('アカウント作成失敗: $e');

      String em = email.text;
      String pas = password.text;
      print("ダメなメール:$emダメなパスワード:$pas");
    }
  }

  static void signInWithEmailAndPassword(
      {required Email email, required Password password}) async {
    try {
      await _firebase.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } catch (e) {
      print('サインイン失敗: $e');

      String em = email.text;
      String pas = password.text;
      print("ダメなメール:$emダメなパスワード:$pas");
    }
  }

  static void signOut() async {
    _firebase.signOut();
  }
}
