import 'package:flutter/material.dart';
import 'package:seat_booking/screens/splash_screen.dart';
import 'package:seat_booking/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyColors.primary,
      ),
      home: const SplashScreen(),
    );
  }
}
