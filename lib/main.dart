import 'package:flutter/material.dart';
import 'package:todo_app/core/application_theme_manager.dart';
import 'package:todo_app/core/pages_route_name.dart';
import 'package:todo_app/core/routes_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ApplicationThemeManager.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRouteName.initial,
      onGenerateRoute: RoutesGenerator.onGenerateRoutes,
      title: "Todo App",
    );
  }
}


