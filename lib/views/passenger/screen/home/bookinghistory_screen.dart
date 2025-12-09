import 'package:flutter/material.dart';
import 'package:hello_bus/views/passenger/screen/eticket_screen.dart';

class BookingHistoryPage extends StatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  State<BookingHistoryPage> createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  // ========================== DATA LISTS ==========================
  List<Map<String, dynamic>> upcomingList = [
    {
      "status": "Upcoming",
      "fromShort": "AMP",
      "from": "Ampara",
      "toShort": "KDY",
      "to": "Kandy",
      "date": "Mon, 28 Oct",
      "time": "10:30 AM",
    },
  ];

  List<Map<String, dynamic>> completedList = [
    {
      "status": "Completed",
      "fromShort": "CMB",
      "from": "Colombo",
      "toShort": "AMP",
      "to": "Ampara",
      "date": "Mon, 20 Oct",
      "time": "07:00 AM",
      "buttonText": "Leave Review",
      "buttonColor": const Color(0xFF00D05F),
      "textColor": Colors.white,
    }
  ];

  List<Map<String, dynamic>> cancelledList = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () => Navigator.pop(context),),
        title: const Text(
          "Booking History",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.green,
              tabs: const [
                Tab(text: "Upcoming"),
                Tab(text: "Completed"),
                Tab(text: "Cancelled"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                upcomingTab(),
                completedTab(),
                cancelledTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ========================== 🔵 Upcoming Tab ==========================
  Widget upcomingTab() {
    if (upcomingList.isEmpty) {
      return noTripsWidget("No Upcoming Trips");
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: upcomingList.length,
      itemBuilder: (context, index) {
        final trip = upcomingList[index];

        return Column(
          children: [
            bookingCard(
              status: "Upcoming",
              fromShort: trip["fromShort"],
              from: trip["from"],
              toShort: trip["toShort"],
              to: trip["to"],
              date: trip["date"],
              time: trip["time"],
              buttonText: "", // remove default button
              buttonColor: Colors.transparent,
            ),

            // ====== Row Buttons: View Ticket & Cancel Trip ======
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // View Ticket action
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const E_TicketPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00D05F),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "View Ticket",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        cancelledList.add(trip);
                        upcomingList.removeAt(index);
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Cancel Trip",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  // ========================== 🟢 Completed Tab ==========================
  Widget completedTab() {
    if (completedList.isEmpty) {
      return noTripsWidget("No Completed Trips");
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: completedList.length,
      itemBuilder: (context, index) {
        final trip = completedList[index];

        return bookingCard(
          status: "Completed",
          fromShort: trip["fromShort"],
          from: trip["from"],
          toShort: trip["toShort"],
          to: trip["to"],
          date: trip["date"],
          time: trip["time"],
          buttonText: trip["buttonText"],
          buttonColor: trip["buttonColor"],
          textColor: trip["textColor"],
        );
      },
    );
  }

  // ========================== 🔴 Cancelled Tab ==========================
  Widget cancelledTab() {
    if (cancelledList.isEmpty) {
      return noTripsWidget("No Cancelled Trips");
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cancelledList.length,
      itemBuilder: (context, index) {
        final trip = cancelledList[index];

        return bookingCard(
          status: "Cancelled",
          fromShort: trip["fromShort"],
          from: trip["from"],
          toShort: trip["toShort"],
          to: trip["to"],
          date: trip["date"],
          time: trip["time"],
          buttonText: "Cancelled",
          buttonColor: Colors.red.shade400,
          textColor: Colors.white,
        );
      },
    );
  }

  // ========================== 🟡 Empty Widget ==========================
  Widget noTripsWidget(String title) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_today_rounded, size: 90, color: Colors.blueGrey),
            const SizedBox(height: 12),
            Text(title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "Ready to plan your next adventure? Book a trip to see your tickets here.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D05F),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text("Book a New Trip", style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ========================== 🎫 Booking Card ==========================
  Widget bookingCard({
    required String status,
    required String fromShort,
    required String from,
    required String toShort,
    required String to,
    required String date,
    required String time,
    required String buttonText,
    required Color buttonColor,
    Color textColor = Colors.white,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)
        ],
      ),
      child: Column(
        children: [
          // Status Row
          Row(
            children: [
              Icon(
                Icons.circle,
                size: 14,
                color: status == "Cancelled"
                    ? Colors.red
                    : status == "Completed"
                        ? Colors.green
                        : Colors.orange,
              ),
              const SizedBox(width: 6),
              Text(
                "Status: $status",
                style: TextStyle(
                  color: status == "Cancelled"
                      ? Colors.red
                      : status == "Completed"
                          ? Colors.green
                          : Colors.orange,
                ),
              ),
              const Spacer(),
              Text("#B12345", style: TextStyle(color: Colors.grey[600])),
            ],
          ),

          const SizedBox(height: 16),

          // City Row
          Row(
            children: [
              cityWidget(fromShort, from),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.brightness_1, size: 8, color: Colors.blueGrey),
                    SizedBox(width: 8),
                    Icon(Icons.directions_bus_filled, color: Colors.blueGrey),
                    SizedBox(width: 8),
                    Icon(Icons.brightness_1, size: 8, color: Colors.blueGrey),
                  ],
                ),
              ),
              cityWidget(toShort, to),
            ],
          ),

          const SizedBox(height: 16),

          // Date & Time Row
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
              const SizedBox(width: 6),
              Text(date),
              const Spacer(),
              const Icon(Icons.access_time, size: 18, color: Colors.grey),
              const SizedBox(width: 6),
              Text(time),
            ],
          ),

          const SizedBox(height: 12),

          // Only show button if buttonText is not empty (Completed/Cancelled)
          if (buttonText.isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: textColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Text(buttonText),
              ),
            ),
        ],
      ),
    );
  }

  Widget cityWidget(String shortName, String city) {
    return Column(
      children: [
        Text(shortName,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
        Text(city, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
