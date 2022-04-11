import 'package:flutter/material.dart';

class StandardText extends Text {
  StandardText(String text, {Key? key, double? fontSize})
      : super(text, key: key, style: StandardTextStyle(fontSize: fontSize));
}

class StandardTextStyle extends TextStyle {
  const StandardTextStyle({double? fontSize})
      : super(fontWeight: FontWeight.bold, fontSize: fontSize);
}
