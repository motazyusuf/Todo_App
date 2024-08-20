import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/settings_provider.dart';
import 'package:todo_app/views/settings/settings_component.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);
    List<String> language = [localization.english, localization.arabic];
    List<String> mode = [localization.dark, localization.light];

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
              localization.settings,
              style: theme.textTheme.titleLarge,
            ),
          ),
        ),
        SettingsComponent(
          initial:  provider.currentLanguage == "ar" ? language[1] : language[0] ,
          options: language,
          optionsName: "${localization.language}:",
        ),
        const SizedBox(
          height: 10,
        ),
        SettingsComponent(

          initial: provider.currentMode == ThemeMode.light ? mode[1] : mode [0] ,
          options: mode,
          optionsName: "${localization.mode}:",
        )
      ],
    );
    ;
  }
}
