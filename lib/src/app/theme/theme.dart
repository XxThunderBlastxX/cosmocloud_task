import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static Color primaryColor = const Color(0xFF1c63ed);

  static ThemeData theme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    fontFamily: GoogleFonts.dosis().fontFamily,
    textTheme: TextTheme(
      labelLarge: GoogleFonts.dosis(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.dosis(
        fontSize: 20,
        fontWeight: FontWeight.w300,
      ),
      labelSmall: GoogleFonts.dosis(
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
