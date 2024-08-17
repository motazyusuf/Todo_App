import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var theme = Theme.of(context);

    getSelectedDate() async {
      var selectedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(data: theme, child: child!);
        },
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
      );

      if (selectedDate != null) {
        setState(() {
          currentDate = selectedDate;
        });
      }
    }

    return Container(
        height: height / 2,
        padding: const EdgeInsetsDirectional.only(
            start: 15, end: 15, top: 25, bottom: 5),
        decoration: BoxDecoration(
            color: theme.bottomAppBarTheme.color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // sheet title
            Text(
              ("Add New Task"),
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 20,
            ),

            // task title field
            TextFormField(
              cursorColor: theme.primaryColor,
              controller: titleController,
              validator: (value) {
                if (value == null || value == " ") {
                  return "Please enter task title";
                } else
                  return null;
              },
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: theme.primaryColor),
                  ),
                  hintText: "Enter task title",
                  hintStyle: theme.textTheme.displayMedium),
            ),

            const SizedBox(
              height: 20,
            ),

            // task description field
            TextFormField(
              cursorColor: theme.primaryColor,
              controller: descriptionController,
              validator: (value) {
                if (value == null || value == " ") {
                  return "Please enter task description";
                } else
                  return null;
              },
              maxLines: 2,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: theme.primaryColor),
                  ),
                  hintText: "Enter task description",
                  hintStyle: theme.textTheme.displayMedium),
            ),

            const SizedBox(
              height: 20,
            ),

            // select date
            Text(
              ("Select date:"),
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(
              height: 15,
            ),

            // choosen date
            InkWell(
              onTap: () => getSelectedDate(),
              child: Text(
                DateFormat("dd MMM yyyy").format(currentDate),
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),

            // button
            FilledButton(onPressed: () => null, child: Text("Add"))
          ],
        ));
  }
}
