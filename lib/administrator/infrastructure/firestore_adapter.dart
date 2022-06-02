import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erichan/administrator/entities/task.dart';
import 'package:erichan/application/firebase_auth_adapter.dart';
import 'package:erichan/utilities/deadline.dart';

class FireStoreAdapter {
  FireStoreAdapter();
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

  String createRepository() {
    String newRepositoryID = _remoteRepositories.doc().id;

    final DocumentReference myRepositoryKeys =
        _usersCollection.doc(FirebaseAuthAdapter.getUserUID());

    myRepositoryKeys.update(
      {
        "repositoryKey": FieldValue.arrayUnion([newRepositoryID])
      },
    );

    Map<String, dynamic> newRepository = {'repositoryKey': newRepositoryID};
    _remoteRepositories.doc(newRepositoryID).set(newRepository);
    return newRepositoryID;
  }

  Future<List<Task>> getRepository(String repositoryKey) async {
    final DocumentSnapshot repositoryDocSnapshot =
        await _remoteRepositories.doc(repositoryKey).get();
    Map<String, dynamic> data =
        repositoryDocSnapshot.data() as Map<String, dynamic>;

    var repository = data["repository"];
    if (repository == null) return [];

    List<Task> taskList = [];
    List<dynamic> repositoryValue = repository as List<dynamic>;
    for (var item in repositoryValue) {
      item["dateTime"]["day"];
      int day = item["dateTime"]["day"];
      int hour = item["dateTime"]["hour"];
      int minute = item["dateTime"]["minute"];
      int month = item["dateTime"]["month"];
      int year = item["dateTime"]["year"];

      taskList.add(Task(
        title: item["title"],
        detail: item["detail"],
        deadline: Deadline(DateTime(year, month, day, hour, minute)),
      ));
    }

    return taskList;
  }

  Future<List<String>> getMyRepositoryKeys() async {
    if (FirebaseAuthAdapter.getUserUID() == "") return [];
    final DocumentSnapshot myRepositoryKeysDocSnapshot =
        await _usersCollection.doc(FirebaseAuthAdapter.getUserUID()).get();

    var data = myRepositoryKeysDocSnapshot.data();
    var repositoryKeys = (data as Map<String, dynamic>)["repositoryKey"];

    if (repositoryKeys == null) return [];

    List<String> keys = [];
    repositoryKeys.forEach((repositoryKey) {
      keys.add(repositoryKey);
    });

    return keys;
  }

  void pushNewItem(Task newItem, String key) async {
    Map<String, dynamic> data = {
      'title': newItem.title,
      'detail': newItem.detail,
      'dateTime': {
        'day': newItem.deadline.dateTime.day,
        'hour': newItem.deadline.dateTime.hour,
        'minute': newItem.deadline.dateTime.minute,
        'month': newItem.deadline.dateTime.month,
        'year': newItem.deadline.dateTime.year,
      },
    };

    final DocumentReference repository = _remoteRepositories.doc(key);

    repository.update(
      {
        "repository": FieldValue.arrayUnion([data])
      },
    );
  }

  void deleteItem(Task deleteItem, String key) async {
    Map<String, dynamic> value = {
      'title': deleteItem.title,
      'detail': deleteItem.detail,
      'dateTime': {
        'day': deleteItem.deadline.dateTime.day,
        'hour': deleteItem.deadline.dateTime.hour,
        'minute': deleteItem.deadline.dateTime.minute,
        'month': deleteItem.deadline.dateTime.month,
        'year': deleteItem.deadline.dateTime.year,
      },
    };

    final DocumentReference repository = _remoteRepositories.doc(key);
    repository.update({
      "repository": FieldValue.arrayRemove([value])
    });
  }
}
