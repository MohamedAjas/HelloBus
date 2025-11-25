import 'package:flutter/material.dart';
import 'package:hello_bus/views/passenger/screen/seat_select_screen.dart';
import 'package:hello_bus/views/passenger/screen/home/home_page.dart';


class BusDetailsPage extends StatefulWidget {
  const BusDetailsPage({super.key});

  @override
  State<BusDetailsPage> createState() => _BusDetailsPageState();
}

class _BusDetailsPageState extends State<BusDetailsPage> {
  int? selectedSeat;

  // 0 = available, 1 = booked, 2 = selected
  final List<int> seatStatus = [0, 0, 0, 1, 1, 0, 0, 0, 2, 1, 0, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          },
          ),
        title: const Text(
          "Badulla to Kandy",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Bus Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/bus2.jpg', // replace with your image
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            /// Bus Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.black12,
                    child: Icon(
                      Icons.directions_bus,
                      size: 32,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello Bus",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text("ND 4521", style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 6),
                          Icon(Icons.circle, size: 6, color: Colors.green),
                          SizedBox(width: 6),
                          Text(
                            "Super Luxury AC",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              "Trip Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),

            /// Trip Details Timeline
            Column(
              children: [
                _tripTile(
                  icon: Icons.directions_bus,
                  title: "Badulla",
                  subtitle: "Departs at 08:00 AM",
                ),
                SizedBox(height: 10),
                //  _timelineConnector(),
                _tripTile(
                  icon: Icons.pause_circle_filled,
                  title: "Kandy",
                  subtitle: "Approx. 10:30 AM",
                ),
                //  _timelineConnector(),
                SizedBox(height: 10),
                _tripTile(
                  icon: Icons.place,
                  title: "Badulla",
                  subtitle: "Arrives at 03:00 PM",
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              "Amenities",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _amenityItem(Icons.wifi, "Wi-Fi"),
                _amenityItem(Icons.ac_unit, "AC"),
                _amenityItem(Icons.bolt, "Charging"),
                _amenityItem(Icons.tv, "TV"),
                _amenityItem(Icons.videocam, "Camera"),
              
               //_amenityItem(Icons.airline_seat_recline_extra, "Seat Adjustment"),
               
              ],
            ),

            const SizedBox(height: 24),

            /// Rating
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.star, color: Colors.orange, size: 30),
                  SizedBox(width: 10),
                  Text("4.8  ", style: TextStyle(fontSize: 18)),
                  Text("(1,234 reviews)", style: TextStyle(color: Colors.grey)),
                  Spacer(),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              "Seat Map",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            /// Seat Grid
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade100,
              ),
              child: Column(
                children: [
                  Column(
                    children: List.generate(seatStatus.length ~/ 4, (rowIndex) {
                      int start = rowIndex * 4;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // LEFT SIDE 2 seats
                            _seatItem(start),
                            const SizedBox(width: 12),
                            _seatItem(start + 1),

                            // AISLE SPACE
                            const SizedBox(width: 28),

                            // RIGHT SIDE 2 seats
                            _seatItem(start + 2),
                            const SizedBox(width: 12),
                            _seatItem(start + 3),
                          ],
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _legend(Colors.green.shade200, "Available"),
                      _legend(Colors.grey.shade400, "Booked"),
                      _legend(Colors.blue.shade200, "Selected"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),

      /// Bottom Button
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SeatSelectionScreen()),
            );
          },
          child: const Text("Select Seats", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }

  // ---------------------- UI Components ------------------------

  Widget _tripTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Icon(icon, size: 26),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _amenityItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
          ),
          child: Icon(icon, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _seatItem(int index) {
    Color color;

    if (seatStatus[index] == 1) {
      color = Colors.grey.shade400; // booked
    } else if (seatStatus[index] == 2) {
      color = Colors.blue.shade200; // selected
    } else {
      color = Colors.green.shade200; // available
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          if (seatStatus[index] == 0) {
            seatStatus[index] = 2;
          } else if (seatStatus[index] == 2) {
            seatStatus[index] = 0;
          }
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _legend(Color color, String title) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(title, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
