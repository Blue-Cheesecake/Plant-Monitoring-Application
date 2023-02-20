import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const color = _AppColor();
  static final themeData = ThemeData(
    useMaterial3: false,
    colorSchemeSeed: const Color.fromRGBO(140, 245, 241, 1),
    textTheme: TextTheme(
      headline1: GoogleFonts.montserrat(
        color: AppTheme.color.secondaryGreen,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.montserrat(
        color: AppTheme.color.secondaryGreen,
        fontSize: 37,
        fontWeight: FontWeight.bold,
      ),
      headline3: GoogleFonts.montserrat(
        color: AppTheme.color.secondaryGreen,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.montserrat(
        color: AppTheme.color.secondaryGreen,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: AppTheme.color.secondaryGreen,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: GoogleFonts.montserrat(
        color: AppTheme.color.secondaryGreen,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

class _AppColor {
  const _AppColor();

  final lightGreen = const Color.fromRGBO(180, 218, 221, 1);
  final primaryGreen = const Color.fromRGBO(32, 111, 106, 1);
  final secondaryGreen = const Color.fromRGBO(14, 80, 76, 1);
}
