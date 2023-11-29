import 'package:flutter/material.dart';
import 'package:seat_booking/screens/home_screen.dart';
import 'package:seat_booking/screens/signup_page.dart';
import 'package:seat_booking/widgets/k_elevatedbutton.dart';
import 'package:seat_booking/widgets/k_textformfield.dart';
import 'package:seat_booking/utils/constants.dart';
import 'package:seat_booking/widgets/k_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        foregroundColor: Colors.white,
        title: const kText(text: 'Login into uBus', fontSize: 25),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(image: const AssetImage('assets/images/bus1.jpg'), fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 160,),
                    const kText(text: 'Welcome to uBus!', fontSize: 24,),
                    const SizedBox(height: 20,),
                    CustomTextFormField(
                      controller: emailController,
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Enter Your Email',
                      prefixicon: Icons.email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email address';
                        }
                        if (!isValidEmail(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Enter Your Password',
                      labelText: 'Password',
                      obscure: true,
                      prefixicon: Icons.lock,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    kElevatedButton(
                        height: 50,
                        width: 100,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                          },
                        text: 'Login', fontSize: 20),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const kText(text: "Don't have an account?",fontSize: 16,),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                            },
                            child: const kText(text: " Sign Up",fontSize: 16,)),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email);
  }
}
