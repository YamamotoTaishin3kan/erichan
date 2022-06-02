import 'package:erichan/administrator/infrastructure/firestore_adapter.dart';
import 'package:erichan/administrator/model/repository_list_manager.dart';
import 'package:flutter/material.dart';

class CreateRepository extends StatelessWidget {
  const CreateRepository(this.repositoryList, {Key? key}) : super(key: key);
  final RepositoryListManager repositoryList;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        repositoryList.createRepository();
      },
      child: const Text("作成"),
    );
  }
}
