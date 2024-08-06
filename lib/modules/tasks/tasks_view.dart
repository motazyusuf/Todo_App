import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/modules/tasks/widgets/task_item.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  @override
  var focusedDate = DateTime.now();

  Widget build(BuildContext context) {
    final EasyInfiniteDateTimelineController dateController =
        EasyInfiniteDateTimelineController();
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 58.0),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: 20, top: 60),
                height: height * 0.22,
                width: width,
                decoration: BoxDecoration(color: theme.primaryColor),
                child: Text(
                  "To Do List",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Positioned(
                top: height * 0.16,
                child: SizedBox(
                  height: 500,
                  width: width,
                  child: EasyInfiniteDateTimeLine(
                    showTimelineHeader: false,
                    dayProps: EasyDayProps(
                      height: 100,
                      todayStyle: DayStyle(
                          dayNumStyle: theme.textTheme.bodyLarge
                              ?.copyWith(color: theme.primaryColor),
                          dayStrStyle: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.primaryColor),
                          monthStrStyle: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.primaryColor),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: theme.bottomAppBarTheme.color
                                  ?.withOpacity(0.85))),
                      inactiveDayStyle: DayStyle(
                        monthStrStyle: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.primaryColor),
                        dayNumStyle: theme.textTheme.bodyLarge
                            ?.copyWith(color: theme.primaryColor),
                        dayStrStyle: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.primaryColor),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade600,
                                blurRadius: 5,
                                spreadRadius: 0.005,
                                offset: Offset(-3, -1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            color: theme.bottomAppBarTheme.color
                                ?.withOpacity(0.85)),
                      ),
                      activeDayStyle: DayStyle(
                        monthStrStyle: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.primaryColorLight),
                        dayNumStyle: theme.textTheme.bodyLarge
                            ?.copyWith(color: theme.primaryColorLight),
                        dayStrStyle: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.primaryColorLight),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade600,
                                blurRadius: 5,
                                spreadRadius: 0.005,
                                offset: Offset(-3, -1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.red),
                      ),
                    ),
                    controller: dateController,
                    firstDate: DateTime(2024),
                    focusDate: focusedDate,
                    lastDate: DateTime(2025),
                    onDateChange: (selectedDate) {
                      setState(() {
                        print("Clicked");
                        focusedDate = selectedDate;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 5, itemBuilder: (context, index) => TaskItem()),
        )
      ],
    );
  }
}
