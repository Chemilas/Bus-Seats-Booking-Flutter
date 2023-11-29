import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seat_booking/screens/get_started_screen.dart';
import 'package:seat_booking/utils/constants.dart';
import 'package:seat_booking/widgets/k_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStarted()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            scale: 4.5,
          ),
          const SizedBox(
            height: 10,
          ),
          const kText(
            text: 'uBus',
            fontSize: 30,
            fontWeight: FontWeight.w500,
            letterSpacing: 15,
            color: MyColors.primary,
          )
        ],
      ),
    ));
  }
}
