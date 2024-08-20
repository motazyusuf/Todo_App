import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../core/settings_provider.dart';

class SettingsComponent extends StatefulWidget {
  SettingsComponent(
      {super.key, required this.options, required this.optionsName, required this.initial});

  List<String> options;
  String optionsName;
  String initial;

  @override
  State<SettingsComponent> createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);
    double height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.optionsName}: ",
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 5),
            child: CustomDropdown<String>(
              initialItem: widget.initial,
              closedHeaderPadding: EdgeInsets.all(10),
              hintText: "${widget.optionsName}",
              decoration: CustomDropdownDecoration(
                  headerStyle: theme.textTheme.bodySmall?.copyWith(
                      color: theme.primaryColor, fontWeight: FontWeight.normal),
                  hintStyle: theme.textTheme.bodySmall?.copyWith(
                      color: theme.primaryColor, fontWeight: FontWeight.normal),
                  listItemStyle: theme.textTheme.bodySmall?.copyWith(
                      color: theme.primaryColor, fontWeight: FontWeight.normal),
                  closedBorder: Border.all(color: theme.primaryColor),
                  expandedBorder: Border.all(color: theme.primaryColor),
                  expandedFillColor: theme.bottomAppBarTheme.color,
                  closedFillColor: theme.bottomAppBarTheme.color,
                  expandedBorderRadius: BorderRadius.circular(1),
                  closedBorderRadius: BorderRadius.circular(1)),
              items: widget.options,
              onChanged: (value) {
                if (value == "Dark" || value == "داكن") {
                  provider.changeMode(ThemeMode.dark);
                  provider.changeSplashPath("assets/images/splashDark.png");
                }
                 else if (value == "Light" || value == "مضيء") {
                  provider.changeMode(ThemeMode.light);
                  provider.changeSplashPath("assets/images/splashLight.png");
                }
                if(value == "English" || value== "الانجليزية"){
                  provider.changeLanguage("en");
                }
                else if(value == "Arabic" || value== "العربية"){
                  provider.changeLanguage("ar");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
