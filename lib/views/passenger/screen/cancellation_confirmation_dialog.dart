import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_bus/core/theme/colors.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Helper function
void showCancellationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const CancellationConfirmationDialog(),
  );
}

class CancellationConfirmationDialog extends StatelessWidget {
  const CancellationConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
      backgroundColor: AppColors.cardLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // === HEADER ===
            Stack(
              children: [
                // Close button
                Positioned(
                  right: 12,
                  top: 12,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Symbols.close,
                      size: 24,
                      color: AppColors.textLight,
                    ),
                  ),
                ),

                Column(
                  children: [
                    const SizedBox(height: 20),

                    // Icon container
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Symbols.confirmation_number,
                        color: AppColors.primary,
                        size: 34,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Text(
                      "Confirm Cancellation",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        "Are you sure you want to cancel this ticket?\nBelow is your refund summary.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: AppColors.textLight,
                          height: 1.4,
                        ),
                      ),
                    ),

                    const SizedBox(height: 26),
                  ],
                ),
              ],
            ),

            // === Refund summary area ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primary.withValues(alpha: .07),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "You will receive a refund of",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Rs 10,000",
                          style: GoogleFonts.inter(
                            fontSize: 29,
                            color: AppColors.textDark,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  _fareRow("Ticket Fare", "Rs 12,000"),
                  const Divider(),
                  _fareRow("Cancellation Fee", "-Rs 2,000",
                      isNegative: true),
                  const Divider(),
                  _fareRow("Final Refund Amount", "Rs 10,000",
                      isBold: true),
                  const SizedBox(height: 26),

                  Text(
                    "Refund will be credited to your payment method "
                    "within 5–7 business days.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      height: 1.4,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // === Action Buttons ===
            Row(
              children: [
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.neutralButton,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Don't Cancel",
                        style: GoogleFonts.inter(
                          color: AppColors.textDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        /// TODO: Handle cancellation
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Confirm & Cancel",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _fareRow(String label, String value,
      {bool isNegative = false, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.textDark,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: isNegative ? AppColors.negativeFee : AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
