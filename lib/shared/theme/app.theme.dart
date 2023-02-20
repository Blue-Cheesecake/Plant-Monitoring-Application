import 'package:flutter/material.dart';

class AppTheme {
  static const color = _AppColor();
  static final themeData = ThemeData(
    useMaterial3: false,
    colorSchemeSeed: const Color.fromRGBO(140, 245, 241, 1),
    fontFamily: "Montserrat",
    buttonTheme: ButtonThemeData(
      buttonColor: AppTheme.color.secondaryGreen,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: AppTheme.color.primaryGreen,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: AppTheme.color.primaryGreen,
        fontSize: 37,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: AppTheme.color.primaryGreen,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

class _AppColor {
  const _AppColor();

  final lightGreen = const Color.fromRGBO(180, 218, 221, 1);
  final primaryGreen = const Color.fromRGBO(32, 111, 106, 1);
  final secondaryGreen = const Color.fromRGBO(35, 112, 107, 1);
}
