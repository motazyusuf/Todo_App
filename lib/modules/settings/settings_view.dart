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
    List<String> mode = ["Light", "Dark"];

    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(start: 20, top: 60),
          height: height * 0.22,
          width: width,
          decoration: BoxDecoration(color: theme.primaryColor),
          child: Text(
            "Settings",
            style: theme.textTheme.titleLarge,
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              SettingsComponent(
                options: language,
                optionsName: "Language",
              ),
              SizedBox(height: 20),
              SettingsComponent(
                options: mode,
                optionsName: "Mode",
              )
            ],
          ),
        ),
      ],
    );
    ;
  }
}
