import 'package:flutter/material.dart';

class AppColors {
  // --- Existing Registration Colors (Untouched) ---
  static const Color primary = Color(0xFF00BFA6);
  static const Color secondary = Color(0xFF2D3748);
  static const Color neutral = Color(0xFFE2E8F0);
  static const Color error = Color(0xFFE53E3E);
  static const Color backgroundLight = Color(0xFFF7FAFC);

  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);

  // --- Additional Colors for Login Page (NEW, SAFE) ---
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color googleRed = Color(0xFFDB4437);
  static const Color facebookBlue = Color(0xFF1877F2);

  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textLight = Color(0xFF757575);

  static const Color border = Color(0xFFE5E7EB);
  static const Color iconColor = Color(0xFF4B5563);

  static const Color inputBackground = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  static const Color success = Color(0xFF22C55E);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray800 = Color(0xFF1F2937);

  // --- Additional Colors for Splash Screen
  static const Color backgroundTop = Color(0xFF00BFA6);
  static const Color backgroundBottom = Color(0xFF005A4E);
  static const Color footerGradientStart = Color(0xFF002D27);
  static const Color buttonTextDark = Color(0xFF005A4E);
  static final Color watermarkText = Colors.white.withValues(alpha: 0.05);

  // ##############  H O M E  P A G E  ################

  // Secondary light background (Primary / 20)
  static const Color primaryLight = Color(0xFFEBF3FE);

  // Backgrounds
  static const Color backgroundGrey = Color(0xFFF6F8F7);
  static const Color inputFillColor = Color(0xFFF6F8F7);

  // Text Colors
  static const Color borderGrey = Color(0xFFE2E8F0);
  static const Color accentText = Color(0xFF3B82F6); // Prices in popular routes

  // ---------------------------
  // Custom Shadows
  // ---------------------------

  // Main Search Card: shadow-lg
  // Equivalent of:
  // 0 10px 15px -3px rgba(0,0,0,0.1)
  // 0 4px 6px -4px rgba(0,0,0,0.1)
  static const List<BoxShadow> lgShadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.10),
      offset: Offset(0, 10),
      blurRadius: 15,
      spreadRadius: -3,
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.10),
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -4,
    ),
  ];

  // Small Cards Shadow:
  // shadow-[0_0_4px_rgba(0,0,0,0.1)]
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.10),
      offset: Offset(0, 0),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  // Seat Selction Screen Color

  static const primarySeat = Color(0xff4CAF50); // Selected seats
  static const booked = Color(0xff4da3ff); // Booked seats
  static const available = Color(0xffE0E0E0); // Light grey
  static const seatText = Colors.black;
  static const background = Colors.white;
  static const darkText = Color(0xff1D1D1D);
  static const greyText = Color(0xff737373);

  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 10,
      spreadRadius: 2,
      offset: const Offset(0, 4),
    ),
  ];

  // Cancel booking conformation screen

  static const backgroundCan = Color(0xffF4F5F7);
  static const textDarkCan = Color(0xff1E1E1E);
  static const greyTextCan = Color(0xff7A7A7A);

  static const primaryBlue = Color(0xff237BFF);

  static const redButton = Color(0xffD91C3C);

  static final softShadow2 = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
}
