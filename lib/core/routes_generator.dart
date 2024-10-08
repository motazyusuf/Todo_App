import 'package:flutter/material.dart';
import 'package:todo_app/core/pages_route_name.dart';
import 'package:todo_app/layouts/layout_view.dart';
import 'package:todo_app/views/login/login_view.dart';
import 'package:todo_app/views/registration/registration_view.dart';
import 'package:todo_app/views/splash/splash_view.dart';

class RoutesGenerator {

  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);

      case PagesRouteName.login:
        return MaterialPageRoute(
            builder: (context) => const LoginView(), settings: settings);

      case PagesRouteName.registration:
        return MaterialPageRoute(
            builder: (context) => const RegistrationView(), settings: settings);

      case PagesRouteName.layout:
        return MaterialPageRoute(
            builder: (context) => const LayoutView(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
    }
  }
}
