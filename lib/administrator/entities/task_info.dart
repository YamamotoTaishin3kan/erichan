import 'package:flutter/material.dart';

DateTime today = DateTime.now();
final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));

abstract class InfoBase {
  InfoBase({required this.title});

  String title;
}

class TaskInfo extends InfoBase {
  TaskInfo({
    required title,
    required this.detail,
    required this.deadline,
  }) : super(title: title);

  String detail;
  final DateTime deadline;
}

class AlbumInfo extends InfoBase {
  AlbumInfo({required title, travelDate}) : super(title: title);

  DateTime travelDate = today;
  List<Image> pictures = [];
}
