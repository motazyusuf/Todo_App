import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/core/pages_route_name.dart';
import 'package:todo_app/core/routes_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(systemNavigationBarColor: Colors.black),
        child: MaterialApp(
          initialRoute: PagesRouteName.initial,
          onGenerateRoute: RoutesGenerator.onGenerateRoutes,
          title: "Todo App",
        ));
  }
}
