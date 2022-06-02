import 'package:erichan/administrator/entities/task.dart';
import 'package:erichan/administrator/infrastructure/firestore_adapter.dart';
import 'package:erichan/application/notifications_manager.dart';
import 'package:flutter/material.dart';

class Repository extends ChangeNotifier {
  Repository(this.adapter, this.repositoryKey) {
    initialize();
  }

  final FireStoreAdapter adapter;
  final String repositoryKey;
  final List<Item> infos = [];

  void initialize() async {
    List<Task> future = await adapter.getRepository(repositoryKey);
    infos.addAll(future);

    NotificationsManager.deleteAllNotifications();
    for (Item info in infos) {
      await NotificationsManager.setNotification(info);
    }
    notifyListeners();
  }

  String getRepositoryName() {
    return "Repository1";
  }

  void changePriority(int oldIndex, int newIndex) {
    Item oldinfo = infos.removeAt(oldIndex);
    infos.insert(newIndex, oldinfo);
    notifyListeners();
  }

  void addNewInfo(Item newInfo) {
    NotificationsManager.setNotification(newInfo);
    infos.add(newInfo);
    adapter.pushNewItem(newInfo as Task, repositoryKey);
    notifyListeners();
  }

  void remove(Item target) {
    NotificationsManager.deleteNotification(target);
    adapter.deleteItem(target as Task, repositoryKey);
    infos.remove(target);
    notifyListeners();
  }
}
