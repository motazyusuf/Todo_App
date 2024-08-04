import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFFDFECDB),
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontFamily: "Poppins",
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white)));
}
