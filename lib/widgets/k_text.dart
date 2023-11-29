import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class kText extends StatelessWidget {
  const kText({super.key, required this.text, this.fontSize, this.color, this.fontWeight, this.letterSpacing, this.textAlign});

  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
      textAlign: textAlign ?? TextAlign.justify,
    );
  }
}
