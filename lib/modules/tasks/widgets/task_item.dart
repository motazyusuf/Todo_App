import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/modules/tasks/widgets/task_details_bottomSheet.dart';

class TaskItem extends StatelessWidget {
  TaskItem({super.key, required this.task});

  TaskModel task;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);

    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => TaskDetailsBottomsheet(task: task));
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: theme.shadowColor,
                    blurRadius: 5,
                    spreadRadius: 0.005,
                    offset: Offset(-6, 5),
                  )
                ],
                color: theme.bottomAppBarTheme.color,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding:
                  EdgeInsetsDirectional.symmetric(vertical: 18, horizontal: 20),
              leading: Container(
                height: 100,
                width: 4,
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(8)),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: theme.textTheme.bodyMedium
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
              trailing: Container(
                height: 35,
                width: 70,
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
