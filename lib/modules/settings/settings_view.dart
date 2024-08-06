import 'package:flutter/material.dart';
import 'package:todo_app/modules/settings/settings_component.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);
    List<String> language = ["English", "Arabic"];
    List<String> mode = ["Dark", "Light"];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            padding: EdgeInsetsDirectional.only(start: 20, top: 60),
            height: height * 0.22,
            width: width,
            decoration: BoxDecoration(color: theme.primaryColor),
            child: Text(
              "Settings",
              style: theme.textTheme.titleLarge,
            ),
          ),
        ),
        SettingsComponent(
          options: language,
          optionsName: "Language:",
        ),
        SettingsComponent(
          options: mode,
          optionsName: "Mode:",
        )
      ],
    );
    ;
  }
}
