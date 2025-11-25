import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_bus/core/theme/colors.dart';

class RecentSearchCard extends StatelessWidget {
  final String from;
  final String to;
  final String date; // full date string

  const RecentSearchCard({
    super.key,
    required this.from,
    required this.to,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$from → $to",
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _getShortDate(date), // Use short date
            style: GoogleFonts.inter(
              fontSize: 10,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  /// Helper to convert full date string to short format (24 Oct)
  String _getShortDate(String fullDate) {
    try {
      // Example: fullDate = "Monday, 24 October 2025"
      final parts = fullDate.split(', ')[1].split(' '); // ["24", "October", "2025"]
      final day = parts[0];
      final month = parts[1];
      final shortMonth = month.substring(0, 3); // "Oct"
      return "$day $shortMonth";
    } catch (e) {
      return fullDate; // fallback if parsing fails
    }
  }
}
