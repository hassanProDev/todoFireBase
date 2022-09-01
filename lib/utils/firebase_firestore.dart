import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';

CollectionReference<TaskModel> getCollection() {
  return FirebaseFirestore.instance
      .collection('tasks')
      .withConverter<TaskModel>(
          fromFirestore: (docSnapshot, _) {
            return TaskModel.fromJson(docSnapshot.data()!);
          },
          toFirestore: (task, _) => task.toJson());
}

Future<void> addTaskToFireStore(TaskModel task) async {
  var collection = await getCollection();
  var doc = collection.doc();
  task.id = doc.id;
  return doc.set(task);
  // collection.add(task);
}

Stream<QuerySnapshot<TaskModel>> getDataFromFireStore(DateTime dateTime) {
  var collection = getCollection();
  return collection
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteFromFireBase(TaskModel taskModel) {
  var collection = getCollection();
  return collection.doc(taskModel.id).delete();
}

void updateFromFireBase(TaskModel task) {
  var collection = getCollection();
  collection.doc(task.id).update(task.toJson());
}
