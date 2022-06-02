import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:erichan/administrator/infrastructure/createRepository.dart';
import 'package:erichan/administrator/model/administrator_structure.dart';
import 'package:erichan/administrator/model/repository_list_manager.dart';
import 'package:erichan/application/palette.dart';
import 'package:flutter/material.dart';

class BodyTabPairList {
  BodyTabPairList(this.repositoryManager) {
    addPairOfCreationScreenAndTab();
    addPairOfRepositoryAndTab();
  }

  List<MapEntry<Widget, TabItem>> pairList = [];
  final RepositoryListManager repositoryManager;

  void addPairOfCreationScreenAndTab() {
    TabItem tab = TabItem(Icons.create, "Create", Palette.getColor(),
        labelStyle: const TextStyle(fontWeight: FontWeight.normal));

    MapEntry<Widget, TabItem> pair =
        MapEntry(CreateRepository(repositoryManager), tab);
    pairList.add(pair);
  }

  void addPairOfRepositoryAndTab() {
    List<String> names = repositoryManager.getReositoryNames();

    for (int count = 0; count < names.length; count++) {
      Widget view = repositoryManager.setsRepositoryToWidgetUnder(
          const RepositoryView(), count);

      TabItem tab = TabItem(
          Icons.home, names[count], Palette.getRepositoryColor(),
          labelStyle: const TextStyle(fontWeight: FontWeight.normal));

      MapEntry<Widget, TabItem> pair = MapEntry(view, tab);
      pairList.add(pair);
    }
  }

  List<TabItem> getTabItems() {
    List<TabItem> items = [];
    for (var pair in pairList) {
      items.add(pair.value);
    }
    return items;
  }
}
