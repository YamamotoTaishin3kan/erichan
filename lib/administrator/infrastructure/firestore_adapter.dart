import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erichan/administrator/entities/task_info.dart';
import 'package:erichan/application/firebase_auth_adapter.dart';
import 'package:erichan/utilities/deadline.dart';

class FireStoreAdapter {
  final _repositoryCollection =
      FirebaseFirestore.instance.collection("repository");
  final _usersCollection = FirebaseFirestore.instance.collection("users");

  final _remoteRepositories =
      FirebaseFirestore.instance.collection("repositories");

  void registerMyself() {
    Map<String, String> userInfo = {
      'uniqueID': FirebaseAuthAdapter.getUserUID()
    };

    _usersCollection.doc(FirebaseAuthAdapter.getUserUID()).set(userInfo);
    FirebaseAuthAdapter.getUserUID();
  }

  void createRepository() {
    String newRepositoryID = _remoteRepositories.doc().id;

    _usersCollection
        .doc(FirebaseAuthAdapter.getUserUID())
        .set({'Repository': newRepositoryID});

    Map<String, dynamic> newRepository = {'newRepositoryID': newRepositoryID};

    _remoteRepositories.doc(newRepositoryID).set(newRepository);
    _remoteRepositories.doc(newRepositoryID).collection("repository");
  }

  Future<List<Task>> getRepository() async {
    final QuerySnapshot snapshot = await _repositoryCollection.get();

    return snapshot.docs.map((document) {
      Map<String, dynamic> remoteItem = document.data() as Map<String, dynamic>;

      int day = remoteItem["item"]["dateTime"]["day"];
      int hour = remoteItem["item"]["dateTime"]["hour"];
      int minute = remoteItem["item"]["dateTime"]["minute"];
      int month = remoteItem["item"]["dateTime"]["month"];
      int year = remoteItem["item"]["dateTime"]["year"];

      return Task(
          title: remoteItem["item"]["title"],
          detail: remoteItem["item"]["detail"],
          deadline: Deadline(DateTime(year, month, day, hour, minute)),
          docID: document.id);
    }).toList();
  }

  void pushNewItem(Task newItem) async {
    Map<String, dynamic> data = {
      'item': {
        'title': newItem.title,
        'detail': newItem.detail,
        'dateTime': {
          'day': newItem.deadline.dateTime.day,
          'hour': newItem.deadline.dateTime.hour,
          'minute': newItem.deadline.dateTime.minute,
          'month': newItem.deadline.dateTime.month,
          'year': newItem.deadline.dateTime.year,
        },
      }
    };

    DocumentReference<Map<String, dynamic>> newItemDocument =
        await _repositoryCollection.add(data);

    newItem.docID = newItemDocument.id;
  }

  void deleteItem(Task deleteItem) {
    _repositoryCollection.doc(deleteItem.docID).delete();
  }
}
