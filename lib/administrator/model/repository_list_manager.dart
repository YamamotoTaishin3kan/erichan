import 'package:erichan/administrator/infrastructure/firestore_adapter.dart';
import 'package:erichan/administrator/model/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RepositoryListManager extends ChangeNotifier {
  final FireStoreAdapter adapter;
  final List<Repository> _repositories = [];

  RepositoryListManager(this.adapter);

  void createRepository() {
    String repositoryKey = adapter.createRepository();
    _repositories.add(Repository(adapter, repositoryKey));
    notifyListeners();
  }

  Future<void> setRepositories() async {
    List<String> keys = await getReositoryKeys();
    for (String key in keys) {
      _repositories.add(Repository(adapter, key));
    }
  }

  Future<List<String>> getReositoryKeys() async =>
      FireStoreAdapter().getMyRepositoryKeys();

  List<String> getReositoryNames() {
    List<String> list = [];
    for (var element in _repositories) {
      list.add(element.getRepositoryName());
    }
    return list;
  }

// providerで参照するRepositoryを固定する
  Widget setsRepositoryToWidgetUnder(Widget child, int number) {
    assert(_repositories.length >= number);
    return RepositoryLifeCycle(repository: _repositories[number], child: child);
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
