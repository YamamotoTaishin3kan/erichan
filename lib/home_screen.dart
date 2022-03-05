import 'package:erichan/application/firebase_adapter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final User _user;

  const HomeScreen(this._user, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAdapter.signOut(),
          ),
        ],
      ),
      body: Center(
        child: Text('ログイン情報：${_user.email}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {},
      ),
    );
  }
}
