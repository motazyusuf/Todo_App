import 'package:flutter/material.dart';

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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 58.0),
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
      ],
    );
    ;
  }
}
