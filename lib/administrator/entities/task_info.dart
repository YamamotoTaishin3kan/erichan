import 'package:flutter/material.dart';

DateTime today = DateTime.now();
final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));

abstract class InfoBase {
  InfoBase({required this.title, required this.docID});

  String title;
  String docID;
}

class TaskInfo extends InfoBase {
  TaskInfo({
    required title,
    required this.detail,
    required this.deadline,
    required docID,
  }) : super(title: title, docID: docID);

  String detail;
  final DateTime deadline;
}

class AlbumInfo extends InfoBase {
  AlbumInfo({required title, required docID, travelDate})
      : super(title: title, docID: docID);

  DateTime travelDate = today;
  List<Image> pictures = [];
}
