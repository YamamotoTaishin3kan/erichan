import 'package:erichan/utilities/deadline.dart';
import 'package:flutter/material.dart';

abstract class Item {
  Item({required this.title, required this.docID});

  String title;
  String docID;
}

class Task extends Item {
  Task({
    required title,
    required this.detail,
    required this.deadline,
    required docID,
  }) : super(title: title, docID: docID);

  final String detail;
  final Deadline deadline;
}

class Album extends Item {
  Album({required title, required docID, travelDate})
      : super(title: title, docID: docID);

  DateTime travelDate = today;
  List<Image> pictures = [];
}
