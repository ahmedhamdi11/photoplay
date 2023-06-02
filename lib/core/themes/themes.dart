import 'package:flutter/material.dart';
import 'package:photoplay/constants.dart';

ThemeData lightTheme = ThemeData(
  colorSchemeSeed: kPrimatyColor,
  // textSelectionTheme: TextSelectionThemeData(
  // selectionColor: kPrimatyColor, selectionHandleColor: kPrimatyColor),
  fontFamily: 'Gotham',
  brightness: Brightness.light,
  scaffoldBackgroundColor: kLightScaffoldColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: kLightNavigationBarColor,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: kLightTextFieldColor,
  ),
  shadowColor: Colors.grey.withOpacity(0.25),
);

ThemeData darkTheme = ThemeData(
  colorSchemeSeed: kPrimatyColor,
  fontFamily: 'Gotham',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kDarkScaffoldColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: kDarkNavigationBarColor,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: kDarkTextFieldColor,
  ),
);
