import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:hello_bus/core/theme/colors.dart';

class SearchInputWithLabel extends StatelessWidget {
  final String label;
  final String value;
  final bool isDate;
  final bool showLabel;
  final List<String>? options; // List of selectable options
  final void Function(String)? onOptionSelected; // Callback when selected

  const SearchInputWithLabel({
    super.key,
    required this.label,
    required this.value,
    this.isDate = false,
    this.showLabel = true,
    this.options,
    this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    const double fieldHeight = 56.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark,
              ),
            ),
          ),
        GestureDetector(
          onTap: () async {
            if (isDate) {
              // Date Picker logic
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null && onOptionSelected != null) {
                String formattedDate =
                    "${_getWeekDay(pickedDate.weekday)}, ${pickedDate.day} ${_getMonth(pickedDate.month)} ${pickedDate.year}";
                onOptionSelected!(formattedDate);
              }
            } else if (options != null && options!.isNotEmpty) {
              // District selection modal
              String? selected = await showModalBottomSheet<String>(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  final TextEditingController searchController = TextEditingController();
                  List<String> filteredOptions = options!;

                  return Padding(
                    padding: MediaQuery.of(context).viewInsets, // handle keyboard
                    child: StatefulBuilder(
                      builder: (context, setStateModal) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: TextField(
                                  controller: searchController,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    hintText: "Search district...",
                                    prefixIcon: Icon(Symbols.search, color: AppColors.textLight),
                                    filled: true,
                                    fillColor: AppColors.inputFillColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setStateModal(() {
                                      filteredOptions = options!
                                          .where((element) => element
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                          .toList();
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: filteredOptions.length,
                                  itemBuilder: (_, index) {
                                    return ListTile(
                                      title: Text(filteredOptions[index]),
                                      onTap: () => Navigator.pop(
                                          context, filteredOptions[index]),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );

              if (selected != null && onOptionSelected != null) {
                onOptionSelected!(selected);
              }
            }
          },
          child: Container(
            height: fieldHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColors.inputFillColor,
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
                if (isDate)
                  Icon(
                    Symbols.calendar_today,
                    color: AppColors.textLight,
                    size: 22,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getWeekDay(int weekday) {
    const days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    return days[weekday - 1];
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
}
