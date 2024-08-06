import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/core/pages_route_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, PagesRouteName.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: Theme.of(context).primaryColorLight),
        child: Image.asset(
          "assets/images/splashLight.png",
          fit: BoxFit.cover,
        ));
  }
}
