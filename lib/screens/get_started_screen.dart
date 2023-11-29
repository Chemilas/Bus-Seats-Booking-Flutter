import 'package:flutter/material.dart';
import 'package:seat_booking/screens/login_screen.dart';
import 'package:seat_booking/widgets/k_elevatedbutton.dart';
import 'package:seat_booking/widgets/k_text.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: const AssetImage('assets/images/bloom.jpg'), fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop))
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/get_start.png',scale: 1,height: 250,),
              const SizedBox(height: 20,),
              const kText(text: 'Book your ticket for a long journey in the comfort of your home.Book it instantly in just a few Taps.',textAlign: TextAlign.center,fontSize: 20,fontWeight: FontWeight.w400,),
              const SizedBox(height: 20,),
              kElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                },
                text: 'Get Started',fontSize: 20,shape: const StadiumBorder(),height: 50,width: 190,)
            ],
          ),
        ),
      ),
    );
  }
}
