import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);

    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.symmetric(horizontal: 15),
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
                  "Running",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.primaryColor),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer_sharp,
                      size: 18,
                    ),
                    SizedBox(width: 3),
                    Text("7:30 AM",
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
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
