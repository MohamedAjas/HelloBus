import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_bus/core/theme/colors.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cardBackground,
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16, bottom: 8),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ---------------- LEFT SIDE ----------------
            Row(
              children: [
                const Icon(
                  Symbols.directions_bus,
                  color: AppColors.primary,
                  size: 30.0,
                ),
                const SizedBox(width: 12),
                Text(
                  'Hello Bus',
                  style: GoogleFonts.inter(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),

            // ---------------- RIGHT SIDE (Profile Avatar) ----------------
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/person.jpg', // <<< your asset image
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
