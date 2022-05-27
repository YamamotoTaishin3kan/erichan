import 'package:erichan/administrator/entities/task_info.dart';
import 'package:erichan/administrator/infrastructure/firestore_adapter.dart';
import 'package:erichan/application/notifications_manager.dart';
import 'package:flutter/material.dart';

class Repository extends ChangeNotifier {
  final FireStoreAdapter adapter;

  Repository(this.adapter) {
    initialize();
  }

  late List<Item> infos = [];

  void initialize() async {
    List<Task> future = await adapter.getRepository();

    infos = future;

    NotificationsManager.deleteAllNotifications();
    for (Item info in infos) {
      await NotificationsManager.setNotification(info);
    }

    notifyListeners();
  }

  void changePriority(int oldIndex, int newIndex) {
    Item oldinfo = infos.removeAt(oldIndex);
    infos.insert(newIndex, oldinfo);
    notifyListeners();
  }

  void addNewInfo(Item newInfo) {
    NotificationsManager.setNotification(newInfo);
    infos.add(newInfo);
    adapter.pushNewItem(newInfo as Task);
    notifyListeners();
  }

  void remove(Item target) {
    NotificationsManager.deleteNotification(target);
    adapter.deleteItem(target as Task);
    infos.remove(target);
    notifyListeners();
  }
}
