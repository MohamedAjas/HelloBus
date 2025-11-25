import 'package:flutter/material.dart';
import 'package:hello_bus/views/passenger/screen/cancellation_confirmation_dialog.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isQRSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Payment",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),

      // Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ⭐ Booking Summary Card
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Booking Summary",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  summaryRow("Route", "Colombo to Galle"),
                  summaryRow("Departure", "24 Aug 2024, 08:00 AM"),
                  summaryRow("Passengers", "2 Adults"),
                  summaryRow("Fare", "LKR 2,400.00"),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  summaryRow("Total Amount", "LKR 2,400.00", isBold: true),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 💳 Select Payment Method
            const Text(
              "Select Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // LankaQR Option
            paymentOption(
              title: "LankaQR",
              asset: Icons.qr_code,
              selected: isQRSelected,
              onTap: () {
                setState(() {
                  isQRSelected = true;
                });
              },
            ),

            // Card Option
            paymentOption(
              title: "Credit / Debit Card",
              asset: Icons.credit_card,
              selected: !isQRSelected,
              onTap: () {
                setState(() {
                  isQRSelected = false;
                });
              },
            ),

            // 💳 Card Form Section
            if (!isQRSelected) cardForm(),
            const SizedBox(height: 20),
          ],
        ),
      ),

      // ✔ Bottom Pay Button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              minWidth: double.infinity,
              height: 55,
              color: const Color(0xFF00D05F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible:
                      false, // user cannot close by tapping outside
                  builder: (context) => const CancellationConfirmationDialog(),
                );
              },
              child: const Text(
                "Pay LKR 2,400.00",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 16, color: Colors.grey),
                SizedBox(width: 6),
                Text(
                  "Your payment is safe and secure.",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Booking Summary Row Widget
  Widget summaryRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isBold ? 18 : 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Payment Option Widget
  Widget paymentOption({
    required String title,
    required IconData asset,
    required bool selected,
    required Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? Colors.green.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? Colors.green : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Icon(
              asset,
              size: 28,
              color: selected ? Colors.green : Colors.black,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  // 🔸 Card Form Widget
  Widget cardForm() {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        children: [
          textField("Card Number", "0000 0000 0000 0000"),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: textField("Expiry Date", "MM/YY")),
              const SizedBox(width: 10),
              Expanded(child: textField("CVV", "123")),
            ],
          ),
        ],
      ),
    );
  }

  // 🔸 Text Field Reusable Widget
  Widget textField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ],
    );
  }
}
