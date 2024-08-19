import 'package:todo_app/core/services/extract_date.dart';

class TaskModel {
  String? id;
  String title;
  String description;
  DateTime selectedDate;
  bool isDone;

  static const String collectionName = "tasksCollection";

  TaskModel(
      {this.id,
      required this.title,
      required this.description,
      required this.selectedDate,
      this.isDone = false});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        selectedDate: DateTime.fromMillisecondsSinceEpoch(json["selectedDate"]),
        isDone: json["isDone"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "selectedDate": extractDate(selectedDate).millisecondsSinceEpoch,
      "isDone": isDone,
    };
  }
}
