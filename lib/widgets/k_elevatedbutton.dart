import 'package:flutter/material.dart';
import 'package:seat_booking/utils/constants.dart';
import 'package:seat_booking/widgets/k_text.dart';

class kElevatedButton extends StatelessWidget {
  const kElevatedButton(
      {super.key, required this.onPressed, required this.text, this.fontSize, this.shape, this.height, this.width});

  final VoidCallback onPressed;
  final String text;
  final double? fontSize;
  final double? height;
  final double? width;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: MyColors.primary,
          padding: const EdgeInsets.all(5),
          elevation: 3,
          shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
        ),
        child: kText(
          text: text,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
