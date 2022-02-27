import 'package:flutter/material.dart';

class AuthError extends StatelessWidget {
  const AuthError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("認証失敗"));
  }
}
