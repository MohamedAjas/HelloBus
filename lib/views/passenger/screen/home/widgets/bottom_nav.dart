import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_bus/core/theme/colors.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:hello_bus/views/passenger/screen/home/bookinghistory_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withValues(alpha: 0.9),
        border: Border(
          top: BorderSide(color: AppColors.borderGrey, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, 0, Symbols.home, 'Home'),
          _buildNavItem(context, 1, Symbols.confirmation_number, 'Bookings'),
          _buildNavItem(context, 2, Symbols.sell, 'Offers'),
          _buildNavItem(context, 3, Symbols.person, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData icon, String label) {
    final bool isSelected = index == selectedIndex;
    final Color color = isSelected ? AppColors.primary : AppColors.textLight;
    final Color backgroundColor = isSelected ? AppColors.primaryLight : Colors.transparent;

    return Expanded(
      child: InkWell(
        onTap: () {
          onItemTapped(index);

          //  Navigate to Booking History when Bookings tab clicked
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BookingHistoryPage(),
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 24.0),
              const SizedBox(height: 4.0),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 10.0,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
