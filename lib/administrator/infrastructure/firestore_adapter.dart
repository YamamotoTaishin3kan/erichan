import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erichan/administrator/entities/task_info.dart';

class FireStoreAdapter {
  final repositoryCollection =
      FirebaseFirestore.instance.collection("repository");

  Future<List<TaskInfo>> getRepository() async {
    final QuerySnapshot snapshot = await repositoryCollection.get();

    return snapshot.docs.map((document) {
      Map<String, dynamic> remoteItem = document.data() as Map<String, dynamic>;

      int day = remoteItem["item"]["dateTime"]["day"];
      int hour = remoteItem["item"]["dateTime"]["hour"];
      int minute = remoteItem["item"]["dateTime"]["minute"];
      int month = remoteItem["item"]["dateTime"]["month"];
      int year = remoteItem["item"]["dateTime"]["year"];

      return TaskInfo(
          title: remoteItem["item"]["title"],
          detail: remoteItem["item"]["detail"],
          deadline: DateTime(year, month, day, hour, minute),
          docID: document.id);
    }).toList();
  }

  void pushNewItem(TaskInfo newItem) async {
    Map<String, dynamic> data = {
      'item': {
        'title': newItem.title,
        'detail': newItem.detail,
        'dateTime': {
          'day': newItem.deadline.day,
          'hour': newItem.deadline.hour,
          'minute': newItem.deadline.minute,
          'month': newItem.deadline.month,
          'year': newItem.deadline.year,
        },
      }
    };

    DocumentReference<Map<String, dynamic>> newItemDocument =
        await repositoryCollection.add(data);

    newItem.docID = newItemDocument.id;
  }

  void deleteItem(TaskInfo deleteItem) {
    repositoryCollection.doc(deleteItem.docID).delete();
  }
}
