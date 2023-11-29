import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seat_booking/utils/constants.dart';
import 'package:seat_booking/widgets/k_text.dart';

String? selectedDepartureTime;

class TimeDropDown extends StatefulWidget {
  const TimeDropDown({super.key,});

  @override
  State<TimeDropDown> createState() => _TimeDropDownState();
}

class _TimeDropDownState extends State<TimeDropDown> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Select Timings',
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.primary,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.primary,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
        color: MyColors.primary,
        ),
      ),
          labelStyle: GoogleFonts.poppins(
            color: MyColors.primary,
          ),
          hintStyle: GoogleFonts.poppins(
            color: MyColors.primary,
          ),
        ),
        isExpanded: true,
        iconSize: 30,
        style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
        value: selectedDepartureTime,
        onChanged: (value) {
          setState(() {
            selectedDepartureTime = value;
          });
        },
        validator: (value) {
          if (value == null) {
            return 'Please select a departure time';
          }
          return null;
        },
        items: [
          '08:00 AM',
          '09:00 AM',
          '10:00 AM',
          '11:00 AM',
          '12:00 PM',
          '01:00 PM',
          '02:00 PM',
          '03:00 PM',
        ].map<DropdownMenuItem<String>>(
              (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: kText(text: value),
            );
          },
        ).toList(),
      ),
    );
  }
}
