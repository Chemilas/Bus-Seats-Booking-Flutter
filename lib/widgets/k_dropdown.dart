import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:seat_booking/utils/constants.dart';
import 'package:seat_booking/utils/destination_data.dart';

class kDropDownFormField extends StatelessWidget {
  const kDropDownFormField({super.key, this.labelText, this.value, this.validator, this.items, this.onChanged});

  final String? labelText;
  final Destination? value;
  final String? Function(Destination?)? validator;
  final List<DropdownMenuItem<Destination>>? items;
  final void Function(Destination?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Destination>(
      decoration: InputDecoration(
        labelText: labelText,
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
          fontSize: 20
        ),
        hintStyle: GoogleFonts.poppins(
          color: MyColors.primary,
        ),
      ),
      isExpanded: true,
      iconSize: 30,
      style: GoogleFonts.poppins(color: Colors.black, fontSize: 17),
      value: value,
      onChanged: onChanged,
      validator: validator,
      items: items,
    );
  }
}
