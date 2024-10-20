import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:todo_app/core/services/extract_date.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/views/tasks/widgets/task_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  @override
  var focusedDate = extractDate(DateTime.now());

  Widget build(BuildContext context) {
    final EasyInfiniteDateTimelineController dateController =
        EasyInfiniteDateTimelineController();
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);
    var localization = AppLocalizations.of(context)!;

    return Column(
      children: [

        // Top part color and Calendar
        Padding(
          padding: const EdgeInsets.only(bottom: 58.0),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [


              // Top part color
              Container(
                padding: EdgeInsetsDirectional.only(start: 20, top: 60),
                height: height * 0.22,
                width: width,
                decoration: BoxDecoration(color: theme.primaryColor),
                child: Text(
                  localization.toDoList,
                  style: theme.textTheme.titleLarge,
                ),
              ),

              // Calendar
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
                              boxShadow: [
                                BoxShadow(
                                  color: theme.shadowColor,
                                  blurRadius: 5,
                                  spreadRadius: 0.005,
                                  offset: Offset(-3, -1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                              color: theme.bottomAppBarTheme.color)),
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
                                color: theme.shadowColor,
                                blurRadius: 5,
                                spreadRadius: 0.005,
                                offset: Offset(-3, -1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            color: theme.bottomAppBarTheme.color),
                      ),
                      activeDayStyle: DayStyle(
                        monthStrStyle: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                        dayNumStyle: theme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.white),
                        dayStrStyle: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: theme.shadowColor,
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
                        focusedDate = extractDate(selectedDate);
                        print("Clicked $focusedDate");
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

        // Tasks
        StreamBuilder(
          stream: FirebaseUtils.getDataStream(focusedDate),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              String error = snapshot.error.toString();
              return  Text(error);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                ),
              );
            }

            var tasksList = snapshot.data?.docs
                .map(
                  (e) => e.data(),
                )
                .toList();

            return Expanded(
              child: ListView.builder(
                itemCount: tasksList?.length ?? 0,
                itemBuilder: (context, index) => TaskItem(task: tasksList![index]

                ),
              ),
            );
          },
        )
      ],
    );
  }
}
