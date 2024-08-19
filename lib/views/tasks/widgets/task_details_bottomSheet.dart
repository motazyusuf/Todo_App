import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:todo_app/models/task_model.dart';

class TaskDetailsBottomsheet extends StatelessWidget {
  TaskDetailsBottomsheet({super.key, required this.task});

  TaskModel task;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    return Container(color: Theme.of(context).bottomAppBarTheme.color,
      height: height/3,
      padding: const EdgeInsetsDirectional.only(
          start: 15, end: 15, top: 25, bottom: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            (task.title),
            style: theme.textTheme.titleLarge?.copyWith(color: theme.textTheme.bodyLarge?.color),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Divider(height:30,thickness: 3, color: theme.primaryColor,),
          ),
          SizedBox(height: 25,),
          Text(
            (task.description),
            style: theme.textTheme.titleMedium?.copyWith(color: theme.textTheme.bodyLarge?.color),
          ),
          Spacer(),
          FilledButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
            EasyLoading.show();
            FirebaseUtils.deleteTask(task);
            Navigator.pop(context);
            EasyLoading.dismiss();
              },
              child: Text("Delete"))

        ],
      ),
    );
  }
}
