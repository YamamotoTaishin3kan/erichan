import 'package:flutter/material.dart';

import 'chameleon_card.dart';

class Repository extends ChangeNotifier {
  Repository() {
    items = <Widget>[
      const ChameleonCard(key: ValueKey("d"), text: "最初のやつ"),
    ];
  }
  late List<Widget> items;

  void changePriority(int oldIndex, int newIndex) {
    Widget oldItem = items.removeAt(oldIndex);
    items.insert(newIndex, oldItem);
    notifyListeners();
  }

  void addNewItem(Widget newItem) {
    items.add(newItem);
    notifyListeners();
  }

  void removeItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}
