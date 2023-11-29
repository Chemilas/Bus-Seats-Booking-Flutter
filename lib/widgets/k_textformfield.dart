import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seat_booking/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.labelText,
      this.validator,
      this.keyboardType,
      this.hintText,
      this.prefixicon, this.obscure});

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData? prefixicon;
  final bool? obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.poppins(
          color: MyColors.primary,
        ),
        prefixIcon: Icon(prefixicon),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.primary,
          ),
        ),
        hintText: hintText,
        prefixIconColor: MyColors.primary,
      ),
      cursorColor: MyColors.primary,
      validator: validator,
    );
  }
}
