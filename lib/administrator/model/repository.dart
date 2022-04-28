import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erichan/administrator/entities/task_info.dart';
import 'package:flutter/material.dart';

// singleton
Repository localRepository = Repository();

class Repository extends ChangeNotifier {
  Repository() {
    initialize();
  }

  late List<InfoBase> infos = [];

  void initialize() async {
    final adapter = FireStoreAdapter();
    List<TaskInfo> future = await adapter.fetchRepository();

    infos = future;
    notifyListeners();
  }

  void changePriority(int oldIndex, int newIndex) {
    InfoBase oldinfo = infos.removeAt(oldIndex);
    infos.insert(newIndex, oldinfo);
    notifyListeners();
  }

  void addNewInfo(InfoBase newInfo) {
    infos.add(newInfo);
    notifyListeners();
  }

  void remove(InfoBase target) {
    infos.remove(target);
    notifyListeners();
  }
}

class FireStoreAdapter {
  final firestoreReference =
      FirebaseFirestore.instance.collection("repository");

  Future<List<TaskInfo>> fetchRepository() async {
    final QuerySnapshot snapshot = await firestoreReference.get();

    assert(snapshot.docs.length == 1);

    DocumentSnapshot document = snapshot.docs.first;
    Map<String, dynamic> remoteItems = document.data() as Map<String, dynamic>;
    List<TaskInfo> localInfos = [];

    remoteItems["item"]?.forEach((remoteInfo) {
      int day = remoteInfo["info"]["dateTime"]["day"];
      int hour = remoteInfo["info"]["dateTime"]["hour"];
      int minute = remoteInfo["info"]["dateTime"]["minute"];
      int month = remoteInfo["info"]["dateTime"]["month"];
      int year = remoteInfo["info"]["dateTime"]["year"];

      localInfos.add(TaskInfo(
          title: remoteInfo["info"]["title"],
          detail: remoteInfo["info"]["detail"],
          deadline: DateTime(year, month, day, hour, minute)));
    });
    return localInfos;
  }

  Future<void> pushRepository(TaskInfo newItem) async {
    //firestoreReference.add(data);

    Map<String, dynamic> p = {
      'info': {
        'title': "これはプッシュしたタイトルです",
        'detail': "これはプッシュした詳細です",
        'dateTime': {
          'day': 1,
          'hour': 1,
          'minute': 45,
          'month': 6,
          'year': 2022,
        }
      }
    };

    FirebaseFirestore.instance.collection('users').add({'name': '名無しのごんべ'});
    //firestoreReference.add("data");
  }
}
