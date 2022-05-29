import 'package:erichan/administrator/infrastructure/firestore_adapter.dart';
import 'package:flutter/material.dart';

class CreateRepository extends StatelessWidget {
  CreateRepository({Key? key}) : super(key: key);
  final FireStoreAdapter adapter = FireStoreAdapter();

  @override
  Widget build(BuildContext context) {
    adapter.createRepository();
    return Container(
      color: Colors.red,
    );
  }
}
