import 'package:flutter/material.dart';

class Palette {
  static Color _itemColor = const Color(0xFF4897d8);

  static Color getColor() {
    if (_itemColor == const Color(0xFF4897d8)) {
      _itemColor = const Color(0xFFffdb5c);
    } else if (_itemColor == const Color(0xFFffdb5c)) {
      _itemColor = const Color(0xFFfa6e59);
    } else if (_itemColor == const Color(0xFFfa6e59)) {
      _itemColor = const Color(0xFFf8a055);
    } else if (_itemColor == const Color(0xFFf8a055)) {
      _itemColor = const Color(0xFF4897d8);
    }
    return _itemColor;
  }
}
