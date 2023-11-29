import 'package:flutter/material.dart';
import 'package:seat_booking/screens/login_screen.dart';
import 'package:seat_booking/utils/constants.dart';
import 'package:seat_booking/widgets/k_elevatedbutton.dart';
import 'package:seat_booking/widgets/k_text.dart';
import 'package:seat_booking/widgets/k_textformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        foregroundColor: Colors.white,
        title: const kText(text: 'Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(image: const AssetImage('assets/images/bloom.jpg'),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const SizedBox(height: 50,),
                  const kText(text: 'Enter the Details',fontSize: 18,fontWeight:FontWeight.w500,textAlign: TextAlign.center,),
                  const SizedBox(height: 20,),
                  CustomTextFormField(
                    controller: nameController,
                    labelText: 'Name',
                    prefixicon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    labelText: 'Age',
                    prefixicon: Icons.scale_outlined,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your age';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
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
                  const SizedBox(height: 20,),
                  CustomTextFormField(
                    controller: passwordController,
                    labelText: 'Password',
                    keyboardType: TextInputType.number,
                    prefixicon: Icons.lock,
                    validator: (value) {
                      bool passValid = RegExp(
                          "^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*")
                          .hasMatch(value!);
                      if (value.isEmpty || !passValid) {
                        return "Please Enter a valid password";
                      }
                      return null;
                    },
                    ),
                  const SizedBox(height: 20,),
                  CustomTextFormField(
                    controller: cpasswordController,
                    obscure: true,
                    labelText: 'Confirm Password',
                    keyboardType: TextInputType.number,
                    prefixicon: Icons.lock,
                    validator: (value) {
                      if (passwordController.text!=cpasswordController.text) {
                        return 'Enter the correct password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  kElevatedButton(
                    height: 45,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                    },
                    text:'Save',fontSize: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
   bool isValidEmail(String email) {
     return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email);}
}