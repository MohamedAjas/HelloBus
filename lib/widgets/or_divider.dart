import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_bus/core/theme/colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.gray300),
        ),
        const SizedBox(width: 16),
        Text(
          "or",
          style: GoogleFonts.inter(
            color: AppColors.gray500,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Divider(color: AppColors.gray300),
        ),
      ],
    );
  }
}
