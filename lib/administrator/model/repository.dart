import 'package:erichan/administrator/entities/task_info.dart';
import 'package:erichan/administrator/infrastructure/firestore_adapter.dart';
import 'package:erichan/application/notifications_manager.dart';
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

class Repository extends ChangeNotifier {
  final FireStoreAdapter adapter;

  Repository(this.adapter) {
    initialize();
  }

  late List<InfoBase> infos = [];

  void initialize() async {
    List<TaskInfo> future = await adapter.getRepository();

    infos = future;

    NotificationsManager.deleteAllNotifications();
    for (InfoBase info in infos) {
      await NotificationsManager.setNotification(info);
    }

    notifyListeners();
  }

  void changePriority(int oldIndex, int newIndex) {
    InfoBase oldinfo = infos.removeAt(oldIndex);
    infos.insert(newIndex, oldinfo);
    notifyListeners();
  }

  void addNewInfo(InfoBase newInfo) {
    NotificationsManager.setNotification(newInfo);
    infos.add(newInfo);
    adapter.pushNewItem(newInfo as TaskInfo);
    notifyListeners();
  }

  void remove(InfoBase target) {
    NotificationsManager.deleteNotification(target);
    adapter.deleteItem(target as TaskInfo);
    infos.remove(target);
    notifyListeners();
  }
}
