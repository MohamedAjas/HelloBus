import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_bus/core/theme/colors.dart';
import 'package:material_symbols_icons/symbols.dart';

class PopularRouteCard extends StatelessWidget {
  final String from;
  final String to;
  final String price;
  final String assetImagePath; // only asset image

  const PopularRouteCard({
    super.key,
    required this.from,
    required this.to,
    required this.price,
    required this.assetImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          // Asset Image
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(assetImagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16.0),

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$from → $to",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    text: "Starting from ",
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: AppColors.textLight,
                    ),
                    children: [
                      TextSpan(
                        text: price,
                        style: GoogleFonts.inter(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Chevron Icon
          const Icon(
            Symbols.chevron_right,
            color: AppColors.textLight,
            size: 24,
          ),
        ],
      ),
    );
  }
}
