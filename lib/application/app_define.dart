import 'package:flutter/material.dart';

class StandardText extends Text {
  StandardText(String text, {Key? key, double? fontSize, Color? color})
      : super(text,
            key: key,
            style: StandardTextStyle(fontSize: fontSize, color: color));
}

class StandardTextStyle extends TextStyle {
  const StandardTextStyle({double? fontSize, Color? color = Colors.black})
      : super(fontWeight: FontWeight.bold, fontSize: fontSize, color: color);
}
