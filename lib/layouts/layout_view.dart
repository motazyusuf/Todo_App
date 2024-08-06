import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modules/settings/settings_view.dart';
import '../modules/tasks/tasks_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

var currentIndex = 0;

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);
    var layouts = [const TasksView(), const SettingsView()];

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor),
      child: Scaffold(
        backgroundColor: theme.primaryColorLight,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: theme.floatingActionButtonTheme.backgroundColor,
          onPressed: () {},
          child: CircleAvatar(
            backgroundColor: theme.primaryColor,
            radius: 24,
            child: Icon(
              Icons.add,
              color: theme.primaryColorLight,
            ),
          ),
        ),
        body: layouts[currentIndex],
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8,
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  label: "Tasks",
                  icon: ImageIcon(AssetImage("assets/icons/tasksIcon.png"))),
              BottomNavigationBarItem(
                  label: "Settings",
                  icon: ImageIcon(AssetImage("assets/icons/settingsIcon.png")))
            ],
          ),
        ),
      ),
    );
  }
}

