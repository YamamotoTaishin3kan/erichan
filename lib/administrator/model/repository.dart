import 'package:erichan/administrator/entities/task_info.dart';
import 'package:flutter/material.dart';

class Repository extends ChangeNotifier {
  Repository() {
    initialize();
  }

  late List<InfoBase> infos = [];

  void initialize() {
    infos.add(TaskInfo(
        title: "taishinおしっこ行きたい", detail: '最初の情報です', deadline: tomorrow));
  }

  void changePriority(int oldIndex, int newIndex) {
    InfoBase oldinfo = infos.removeAt(oldIndex);
    infos.insert(newIndex, oldinfo);
    notifyListeners();
  }

  void addNewInfo(InfoBase newInfo) {
    infos.add(newInfo);
    notifyListeners();
  }

  void removeInfo(int index) {
    infos.removeAt(index);
    notifyListeners();
  }
}
