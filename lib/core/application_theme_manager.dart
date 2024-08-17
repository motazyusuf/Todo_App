import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color primaryColor = Color(0xff5d9cec);
  static const Color deviceSystemNavigationBarLight = Color(0xffdfecdb);
  static const Color deviceSystemNavigationBarDark = Color(0xFF141922);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    primaryColorLight: deviceSystemNavigationBarLight,
    primaryColorDark: Colors.black,
    shadowColor: Colors.grey.shade600,
    bottomAppBarTheme: const BottomAppBarTheme(
      height: 93,
      color: Colors.white,
      shape: CircularNotchedRectangle(),
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.white),
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: const TextTheme(
      // Title
      titleLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      titleMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white),

      // Body
      bodyLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.black),
      bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      bodySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black),

      // Display
      displayMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF797979)),

      displaySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF797979)),

      //Label
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedIconTheme: IconThemeData(color: primaryColor, size: 35),
      unselectedIconTheme: IconThemeData(size: 30),
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    primaryColorLight: Color(0xff060e1e),
    primaryColorDark: Colors.black,
    secondaryHeaderColor: Colors.white,
    shadowColor: Colors.black,
    bottomAppBarTheme: const BottomAppBarTheme(
      height: 93,
      color: deviceSystemNavigationBarDark,
      shape: CircularNotchedRectangle(),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: deviceSystemNavigationBarDark),
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: const TextTheme(
      // Title
      titleLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      titleMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      titleSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.white),

      // Body
      bodyLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.white),
      bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      bodySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white),

      // Display
      displayMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white),

      displaySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white),

      //Label
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedIconTheme: IconThemeData(color: primaryColor, size: 35),
      unselectedIconTheme: IconThemeData(size: 30, color: Colors.white),
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
  );
}
