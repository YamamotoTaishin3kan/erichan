import 'package:flutter/material.dart';

class UserProfile with ChangeNotifier {
  String userEmail = "";
  String userPassword = "";

  void updateEmail(String newUserEmail) {
    userEmail = newUserEmail;
    notifyListeners();
  }

  void updatePassword(String newUserPassword) {
    userPassword = newUserPassword;
    notifyListeners();
  }
}
