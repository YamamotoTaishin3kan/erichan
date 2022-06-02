import 'package:erichan/utilities/deadline.dart';
import 'package:flutter/material.dart';

abstract class Item {
  Item({required this.title});
  String title;
}

class Task extends Item {
  Task({
    required title,
    required this.detail,
    required this.deadline,
  }) : super(title: title);

  final String detail;
  final Deadline deadline;
}

class Album extends Item {
  Album({required title, required docID, travelDate}) : super(title: title);

  DateTime travelDate = today;
  List<Image> pictures = [];
}
