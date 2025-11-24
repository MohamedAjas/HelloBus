import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

final ThemeData helloBusLoginTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.backgroundLight,

  textTheme: GoogleFonts.interTextTheme().apply(
    bodyColor: AppColors.gray800,
    displayColor: AppColors.gray800,
  ),

  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    background: AppColors.backgroundLight,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: const TextStyle(color: AppColors.gray400, fontSize: 16),
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),

    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.gray300),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.black,
      minimumSize: const Size(double.infinity, 56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
);
