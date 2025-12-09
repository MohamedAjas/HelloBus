import 'package:flutter/material.dart';
import 'package:hello_bus/core/theme/colors.dart';
import 'package:hello_bus/views/passenger/screen/cancellation_confirmation_dialog.dart';

class CancelBookingScreen extends StatelessWidget {
  const CancelBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundCan,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.03),
            child: Column(
              children: [
                // ===== BACK BUTTON =====
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: Row(
                    children: [
                      MouseRegion(
                        cursor:
                            SystemMouseCursors.click, // Changes cursor to hand
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: AppColors.softShadow,
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: AppColors.textDarkCan,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.03),

                // ===== TITLE =====
                const Text(
                  "Are you sure you want\nto cancel?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDarkCan,
                    height: 1.3,
                  ),
                ),

                SizedBox(height: h * 0.04),

                // ===== CARD =====
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: AppColors.softShadow,
                    ),
                    child: Column(
                      children: [
                        infoTile(
                          icon: Icons.route,
                          title: "Route",
                          value: "New York → Boston",
                        ),
                        divider(),
                        infoTile(
                          icon: Icons.calendar_month,
                          title: "Departure",
                          value: "Mon, Oct 28, 2024 at 10:30 AM",
                        ),
                        divider(),
                        infoTile(
                          icon: Icons.group,
                          title: "Passengers",
                          value: "2 Passengers, Seats: 12A, 12B",
                        ),
                        divider(),
                        infoTile(
                          icon: Icons.confirmation_number,
                          title: "Booking ID",
                          value: "HB-123XYZ",
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: h * 0.03),

                // ===== NOTE =====
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Full refund if cancelled 24 hours prior to\ndeparture.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.greyTextCan,
                      height: 1.4,
                    ),
                  ),
                ),

                SizedBox(height: h * 0.05),

                // ===== CANCEL BUTTON =====
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Show the cancellation confirmation dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const CancellationConfirmationDialog(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redButton,
                        padding: EdgeInsets.symmetric(vertical: h * 0.022),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        "Yes, Cancel Booking",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ===== REUSABLE INFO TILE =====
  Widget infoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primaryBlue, size: 26),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.greyTextCan,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDarkCan,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ===== DIVIDER =====
  Widget divider() => const Padding(
    padding: EdgeInsets.symmetric(vertical: 18),
    child: Divider(thickness: 1, color: Color(0xffE5E5E5)),
  );
}
