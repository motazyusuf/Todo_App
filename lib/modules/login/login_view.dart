import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/loginBackground.png"))),
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.1, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                textAlign: TextAlign.center,
                "Login",
                style: theme.textTheme.titleLarge),
            SizedBox(
              height: height * 0.2,
            ),
            Text("Welcome Back!",
                style: theme.textTheme.titleLarge
                    ?.copyWith(color: Colors.black, fontSize: 25))
          ],
        ),
      ),
    ));
  }
}
