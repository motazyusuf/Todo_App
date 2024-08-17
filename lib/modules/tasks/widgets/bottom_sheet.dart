import 'package:flutter/material.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    var height = MediaQuery.sizeOf(context).height;
    var theme = Theme.of(context);
    return Container(
        height: height / 2,
        padding: EdgeInsetsDirectional.only(start: 15,end: 15, top: 25, bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // sheet title
            Text(
              ("Add New Task"),
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 20,
            ),

            // task title field
            TextFormField(controller: titleController,
              validator: (value) {
                if (value == null || value == " ") {
                  return "Please enter task title";
                } else
                  return null;
              },
              decoration: InputDecoration(
                  hintText: "Enter task title",
                  hintStyle: theme.textTheme.displayMedium),
            ),

            SizedBox(
              height: 20,
            ),

            // task description field
            TextFormField(controller: descriptionController,
              validator: (value) {
                if (value == null || value == " ") {
                  return "Please enter task description";
                } else
                  return null;
              },
              maxLines: 2,
              decoration: InputDecoration(
                  hintText: "Enter task description",
                  hintStyle: theme.textTheme.displayMedium),
            ),

            SizedBox(
              height: 20,
            ),

            // select date
            Text(
              ("Select date:"),
              style: theme.textTheme.bodySmall,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              ("20 Aug"),
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            Spacer(),

            // button
            FilledButton(onPressed: () => null, child: Text("Add"))
          ],
        ));
  }
}
