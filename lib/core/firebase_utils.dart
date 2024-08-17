import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class FirebaseUtils {

  static CollectionReference<TaskModel>getCollection() {
    return FirebaseFirestore.instance
        .collection(TaskModel.collectionName)
        .withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromJson(snapshot.data()!),
            toFirestore: (value, _) => value.toJson());
  }


  // CollectionReference<TaskModel> getCollection = FirebaseFirestore.instance
  //     .collection(TaskModel.collectionName)
  //     .withConverter<TaskModel>(
  //     fromFirestore: (snapshot, _) =>
  //         TaskModel.fromJson(snapshot.data()!),
  //     toFirestore: (value, _) => value.toJson());



  static Future<void> addTask (TaskModel task)
  {
    var collectionRef = getCollection();
    var documentRef = collectionRef.doc();
    return documentRef.set(task);
  }

  static Future<List<TaskModel>> readTask ()
  async {
    var collectionRef = getCollection();
    var data = await collectionRef.get();
    var tasksList = data.docs.map((e) => e.data(),).toList();
    return tasksList;
  }
}

