import 'package:flutter/material.dart';

class AppDecorations {
  // --- Existing Registration Shadow (DO NOT TOUCH) ---
  static const BoxShadow softShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.05),
    offset: Offset(0, 4),
    blurRadius: 14.0,
  );

  // --- Additional Decorations for Login Page (NEW, SAFE) ---

  // Card / Container shadow for login screen
  static const List<BoxShadow> loginCardShadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.10),
      offset: Offset(0, 6),
      blurRadius: 12,
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04),
      offset: Offset(0, 2),
      blurRadius: 6,
    ),
  ];

  // Light border decoration for text fields / boxes
  static BoxDecoration loginInputDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      color: Color(0xFFE5E7EB), // Light border gray
      width: 1,
    ),
  );

  // Social login button shadow
  static const List<BoxShadow> socialButtonShadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.12),
      offset: Offset(0, 5),
      blurRadius: 10,
    ),
  ];
}
