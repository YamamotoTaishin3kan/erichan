import 'package:erichan/administrator/model/repository.dart';
import 'package:erichan/application/firebase_auth_adapter.dart';
import 'package:erichan/application/palette.dart';
import 'package:flutter/material.dart';
import 'administrator_structure.dart';

class Administrator extends StatelessWidget {
  Administrator({Key? key}) : super(key: key);

  final RepositoryListManager repositoryList = RepositoryListManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AdministratorAppBar(),
      body: repositoryList.setsRepositoryToWidgetUnder(const RepositoryView()),
    );
  }
}

class AdministratorAppBar extends AppBar {
  AdministratorAppBar({Key? key})
      : super(key: key, backgroundColor: Palette.getColor(), actions: [
          IconButton(
              onPressed: () => FirebaseAuthAdapter.signOut(),
              icon: const Icon(Icons.logout))
        ]);
}
