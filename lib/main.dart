import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/application_theme_manager.dart';
import 'package:todo_app/core/pages_route_name.dart';
import 'package:todo_app/core/routes_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/settings_provider.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      themeMode: provider.currentMode,
      theme: ApplicationThemeManager.lightTheme,
      darkTheme: ApplicationThemeManager.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRouteName.initial,
      onGenerateRoute: RoutesGenerator.onGenerateRoutes,
      title: "Todo App",
    );
  }
}


