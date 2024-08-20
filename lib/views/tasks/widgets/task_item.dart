import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/views/tasks/widgets/task_details_bottomSheet.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TaskItem extends StatelessWidget {
  TaskItem({super.key, required this.task});

  TaskModel task;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);
    var localization = AppLocalizations.of(context)!;


    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor,
                blurRadius: 5,
                spreadRadius: 0.005,
                offset: Offset(-6, 5),
              )
            ],
            ),
      child: Slidable(


        // slide
        startActionPane: ActionPane(
          motion:  ScrollMotion(),

          children:  [

            SlidableAction(borderRadius: BorderRadius.only(topLeft: Radius.circular(18), bottomLeft: Radius.circular(18)),
              onPressed: (context) {
              FirebaseUtils.deleteTask(task);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: localization.delete,
            ),
          ],
        ),

        // task
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => TaskDetailsBottomsheet(task: task));
          },
          child: Container(color: theme.bottomAppBarTheme.color,

            child: ListTile(
              contentPadding:
                  EdgeInsetsDirectional.symmetric(vertical: 18, horizontal: 20),
              leading: Container(
                height: 150,
                width: 4,
                decoration: BoxDecoration(
                    color: task.isDone? Colors.green : theme.primaryColor,
                   ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: task.isDone?theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.green) : theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.primaryColor),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_sharp,
                        size: 18,
                      ),
                      const SizedBox(width: 3),
                      Text(DateFormat("dd MMM yyy").format(task.selectedDate),
                          style: theme.textTheme.displayMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              trailing: InkWell(
                onTap: () {
                  FirebaseUtils.updateTask(task);
                  print("Tapped");

                } ,
                child: Container(
                  height: 35,
                  width: 70,
                  decoration: BoxDecoration(
                      color: task.isDone?  Colors.transparent: theme.primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: task.isDone? Text(
                          localization.done,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.green),
                        ) : const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
