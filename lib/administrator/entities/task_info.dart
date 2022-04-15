import 'package:flutter/material.dart';

DateTime today = DateTime.now().add(const Duration(days: 1));
DateTime tomorrow = DateTime.now().add(const Duration(days: 1));

abstract class InfoBase {
  InfoBase({required this.title});

  String title;
}

class TaskInfo extends InfoBase {
  TaskInfo({required title, required this.detail}) : super(title: title);

  String detail;
  DateTime deadline = tomorrow;
}

class AlbumInfo extends InfoBase {
  AlbumInfo({required title}) : super(title: title);

  DateTime travelDate = today;
  List<Image> pictures = [];
}
