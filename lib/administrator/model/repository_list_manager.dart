import 'package:erichan/administrator/infrastructure/firestore_adapter.dart';
import 'package:erichan/administrator/model/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RepositoryListManager {
  final List<Repository> _repositories = [Repository(FireStoreAdapter())];

// providerで参照するRepositoryを固定する
  Widget setsRepositoryToWidgetUnder(Widget child) {
    return RepositoryLifeCycle(repository: _repositories.first, child: child);
  }
}

class RepositoryLifeCycle extends StatelessWidget {
  const RepositoryLifeCycle(
      {Key? key, required this.child, required this.repository})
      : super(key: key);
  final Widget child;
  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: repository,
      child: child,
    );
  }
}
