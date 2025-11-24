import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_bus/views/auth/bus_details_page1.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:hello_bus/core/theme/colors.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/search_input_with_label.dart';
import 'widgets/recent_search_card.dart';
import 'widgets/popular_route_card.dart';
import 'widgets/bottom_nav.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  String fromValue = "Colombo";
  String toValue = "Kandy";
  late String dateValue;

  final List<String> districts = [
    "Ampara",
    "Anuradhapura",
    "Badulla",
    "Batticaloa",
    "Colombo",
    "Galle",
    "Gampaha",
    "Hambantota",
    "Jaffna",
    "Kalutara",
    "Kandy",
    "Kegalle",
    "Kilinochchi",
    "Kurunegala",
    "Mannar",
    "Matale",
    "Matara",
    "Monaragala",
    "Mullaitivu",
    "Nuwara Eliya",
    "Polonnaruwa",
    "Puttalam",
    "Ratnapura",
    "Trincomalee",
    "Vavuniya",
  ];

  List<Map<String, String>> recentSearches = [];

  @override
  void initState() {
    super.initState();
    dateValue = getTodayFormatted();
  }

  String getTodayFormatted() {
    final now = DateTime.now();
    return "Today, ${now.day} ${_getMonth(now.month)} ${now.year}";
  }

  String _getMonth(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: HomeAppBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),

            // ------------------- Main Search Card -------------------
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: AppColors.lgShadow,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // From Field
                      SearchInputWithLabel(
                        label: 'From',
                        value: fromValue,
                        options: districts,
                        onOptionSelected: (val) {
                          setState(() {
                            fromValue = val;
                          });
                        },
                      ),
                      const SizedBox(height: 16),

                      // To Field
                      SearchInputWithLabel(
                        label: 'To',
                        value: toValue,
                        options: districts,
                        onOptionSelected: (val) {
                          setState(() {
                            toValue = val;
                          });
                        },
                      ),
                      const SizedBox(height: 24),

                      // Date Field
                      SearchInputWithLabel(
                        label: 'Date',
                        value: dateValue,
                        isDate: true,
                        onOptionSelected: (val) {
                          setState(() {
                            dateValue = val;
                          });
                        },
                      ),
                      const SizedBox(height: 24),

                      // Search Button
                      SizedBox(
                        height: 56.0,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              recentSearches.insert(0, {
                                "from": fromValue,
                                "to": toValue,
                                "date": dateValue,
                              });
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Search Buses',
                                style: GoogleFonts.inter(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              const Icon(Symbols.arrow_forward, size: 20.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Swap Icon
                  Positioned(
                    top: 108.0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.borderGrey.withValues(alpha: 0.5),
                          ),
                          boxShadow: AppColors.cardShadow,
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              final temp = fromValue;
                              fromValue = toValue;
                              toValue = temp;
                            });
                          },
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Symbols.swap_horiz,
                            color: AppColors.primary,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // ------------------- Available Buses -------------------
            Text(
              "Available Buses",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),

            // 1st card clickable
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BusDetailsPage(),
                  ),
                );
              },
              child: const PopularRouteCard(
                from: "Badulla",
                to: "Kandy",
                price: "Rs 850",
                assetImagePath: "assets/images/bus2.jpg",
              ),
            ),

            // Other cards
            const PopularRouteCard(
              from: "Colombo",
              to: "Galle",
              price: "Rs 650",
              assetImagePath: "assets/images/bus1.jpg",
            ),
            const PopularRouteCard(
              from: "Kalmunai",
              to: "Colombo",
              price: "Rs 1650",
              assetImagePath: "assets/images/bus3.jpg",
            ),

            const SizedBox(height: 32),

            // ------------------- Recent Searches -------------------
            Text(
              "Your Recent Searches",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 85,
              child: recentSearches.isEmpty
                  ? const Center(child: Text("No recent searches"))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recentSearches.length,
                      itemBuilder: (_, index) {
                        final search = recentSearches[index];
                        return RecentSearchCard(
                          from: search["from"]!,
                          to: search["to"]!,
                          date: search["date"]!,
                        );
                      },
                    ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
