import 'package:flutter/material.dart';
import 'package:hello_bus/core/theme/colors.dart';
//import 'package:hello_bus/views/passenger/screen/cancel_booking_screen.dart';
import 'package:hello_bus/views/passenger/screen/payment_page.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<String> selectedSeats = [];
  double seatPrice = 29.0;

  final bookedSeats = {"B1", "A3", "B4", "D2", "E3"};

  /// 2 seats each side
  final seatLayoutLeft = [
    ["A1", "A2"],
    ["B1", "B2"],
    ["C1", "C2"],
    ["D1", "D2"],
    ["E1", "E2"],
  ];

  final seatLayoutRight = [
    ["A3", "A4"],
    ["B3", "B4"],
    ["C3", "C4"],
    ["D3", "D4"],
    ["E3", "E4"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 245, 245),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Select Your Seat",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // ROUTE CARD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: AppColors.softShadow,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Route: Colombo → Kandy",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Date: 24 Oct",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // LEGEND
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  legendItem(AppColors.available, "Available"),
                  legendItem(AppColors.booked, "Booked"),
                  legendItem(AppColors.primary, "Selected"),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // SEAT BLOCK
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: AppColors.softShadow,
                ),
                child: Column(
                  children: [
                    const Icon(Icons.navigation, size: 30),
                    const SizedBox(height: 14),

                    /// SEAT ROWS
                    Column(
                      children: List.generate(seatLayoutLeft.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// LEFT 2 seats
                              Row(
                                children: seatLayoutLeft[index]
                                    .map((seat) => buildSeat(seat))
                                    .toList(),
                              ),

                              const SizedBox(width: 35), // aisle
                              /// RIGHT 2 seats
                              Row(
                                children: seatLayoutRight[index]
                                    .map((seat) => buildSeat(seat))
                                    .toList(),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Selected Seats",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 6),

              Text(
                selectedSeats.isEmpty ? "-" : selectedSeats.join(", "),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Fare",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    "Rs ${(selectedSeats.length * seatPrice).toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedSeats.isEmpty
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentScreen(),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    disabledBackgroundColor: Colors.grey.shade400,
                  ),
                  child: const Text(
                    "Confirm Selection",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// --- BUILD SEAT TILE ---
  Widget buildSeat(String seat) {
    bool isBooked = bookedSeats.contains(seat);
    bool isSelected = selectedSeats.contains(seat);

    Color seatColor = isBooked
        ? AppColors.booked
        : isSelected
        ? AppColors.primary
        : AppColors.available;

    return GestureDetector(
      onTap: () {
        if (isBooked) return;
        setState(() {
          isSelected ? selectedSeats.remove(seat) : selectedSeats.add(seat);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 58,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: seatColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          seat,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget legendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
