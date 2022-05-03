import 'package:erichan/administrator/entities/task_info.dart';
import 'package:erichan/administrator/infrastructure/firestore_adapter.dart';
import 'package:flutter/material.dart';

// singleton
Repository localRepository = Repository();

class Repository extends ChangeNotifier {
  final adapter = FireStoreAdapter();

  Repository() {
    initialize();
  }

  late List<InfoBase> infos = [];

  void initialize() async {
    List<TaskInfo> future = await adapter.getRepository();

    infos = future;
    notifyListeners();
  }

  void changePriority(int oldIndex, int newIndex) {
    InfoBase oldinfo = infos.removeAt(oldIndex);
    infos.insert(newIndex, oldinfo);
    notifyListeners();
  }

  void addNewInfo(InfoBase newInfo) {
    infos.add(newInfo);
    adapter.pushNewItem(newInfo as TaskInfo);
    notifyListeners();
  }

  void remove(InfoBase target) {
    adapter.deleteItem(target as TaskInfo);
    infos.remove(target);
    notifyListeners();
  }
}
