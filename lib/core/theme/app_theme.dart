import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

final ThemeData helloBusTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.backgroundLight,
  textTheme: GoogleFonts.interTextTheme().apply(
    bodyColor: AppColors.secondary,
    displayColor: AppColors.secondary,
  ),

  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.error,
    surface: AppColors.backgroundLight, // Replaces deprecated 'background'
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: const TextStyle(color: AppColors.gray400, fontSize: 16),
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    isDense: true,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.neutral),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.error),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);


