import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class E_TicketPage extends StatelessWidget {
  const E_TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Your e-Ticket",
            style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔷 Gradient Card with QR
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF0072FF), Color(0xFF7ED5FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 130,
                      child: Image.asset(
                        "assets/images/QR code.png", // 👉 Replace with your QR
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🔖 Booking ID
            Text(
              "Booking ID: HB-789XYZ",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            // 🚌 Ticket Details Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔵 From
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.directions_bus, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text("Ampara",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Text("10:30 AM", style: GoogleFonts.poppins()),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // 🔻 To
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.red),
                          const SizedBox(width: 8),
                          Text("Colombo",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Text("6:30 PM", style: GoogleFonts.poppins()),
                    ],
                  ),

                  const Divider(height: 30),

                  // 📅 Date & Bus Operator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ticketInfo("Date", "October 26, 2024"),
                      _ticketInfo("Bus Operator", "Punchi mathaya"),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 👤 Passenger Name & Seat
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ticketInfo("Passenger", "Ajas Ahamed"),
                      _ticketInfo("Seat(s)", "A4, A5"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔘 Bottom Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bottomAction(Icons.download, "Save to Device"),
                _bottomAction(Icons.share, "Share Ticket"),
                _bottomAction(Icons.event, "Add to Calendar"),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // 📌 Ticket Info Text Widget
  Widget _ticketInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.poppins(
                fontSize: 13, color: Colors.grey.shade600)),
        Text(value,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }

  // 📌 Bottom Action Buttons
  Widget _bottomAction(IconData icon, String text) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
          child: Icon(icon, size: 26, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(text, style: GoogleFonts.poppins(fontSize: 12)),
      ],
    );
  }
}
