import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // het task from database
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection("tasks");

  // CREATE: add a new task
  Future<void> addTask(String taskTitle, String taskDetail) {
    return tasks.add({
      "taskTitle": taskTitle,
      "taskDetail": taskDetail,
      "timestamp": Timestamp.now()
    });
  }

  // READ: get task from database

  Stream<QuerySnapshot> getTaskStream() {
    final taskStream = tasks.orderBy("timestamp", descending: true).snapshots();

    return taskStream;
  }

  // UPDATE: update task given a doc id

  Future<void> updateTask(String docID, String taskTitle, String taskDetail) {
    return tasks.doc(docID).update({
      "taskTitle": taskTitle,
      "taskDetail": taskDetail,
      "timestamp": Timestamp.now()
    });
  }

  // DELETE: delete task given doc id

  Future<void> deleteTask(String docID) {
    return tasks.doc(docID).delete();
  }
}
