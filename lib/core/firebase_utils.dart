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





  static Future<void> addTask (TaskModel task)
  {
    // reference the collection || create if !exist
    var collectionRef = getCollection();

    // create empty document with id
    var documentRef = collectionRef.doc();

    task.id = documentRef.id;

    // set values to document
    return documentRef.set(task);
  }

  static Future<List<TaskModel>> readTask (DateTime selectedTime)
  async {

    // reference the collection and query || create if !exist and query
    var collectionRef = getCollection().where("selectedDate", isEqualTo: selectedTime.millisecondsSinceEpoch);

    // get documents
    var data = await collectionRef.get();

    // get the document data
    var tasksList = data.docs.map((document) => document.data(),).toList();
    return tasksList;
  }

  static Stream<QuerySnapshot<TaskModel>> getDataStream(DateTime selectedTime)
  {

    // reference the collection and query || create if !exist and query
    var collectionRef = getCollection().where("selectedDate",
        isEqualTo: selectedTime.millisecondsSinceEpoch);

    // stream snapshots
    var stream = collectionRef.snapshots();

    return stream;
  }

  static Future<void> deleteTask (TaskModel task)
  async {
    // reference the collection and query || create if !exist and query
    var collectionRef = getCollection();

    // get snapshots
    var documentRef =  collectionRef.doc(task.id);
    // delete the document
   return documentRef.delete();
  }

  static Future<void> updateTask (TaskModel task)
  async {
    // reference the collection and query || create if !exist and query
    var collectionRef = getCollection();

    // get snapshots
    var documentRef =  collectionRef.doc(task.id);
    // delete the document
    return documentRef.update({
      "isDone": true
    });
  }
}

