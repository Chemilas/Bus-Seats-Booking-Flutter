import 'package:flutter/material.dart';
import 'package:seat_booking/utils/constants.dart';
import 'package:seat_booking/widgets/k_dropdown.dart';
import 'package:seat_booking/widgets/k_elevatedbutton.dart';
import 'package:seat_booking/widgets/k_text.dart';
import 'package:seat_booking/widgets/k_timedropdown.dart';
import 'package:seat_booking/utils/destination_data.dart';
import 'package:seat_booking/utils/generators.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Destination? selectedFromDestination;
  Destination? selectedToDestination;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const kText(
          text: 'Book your Bus',
        ),
        foregroundColor: Colors.white,
        backgroundColor: MyColors.primary,
      ),
      body: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/bus1.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const kText(
                  text: 'Enter the Bus Details',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: kDropDownFormField(
                    labelText: 'From',
                    value: selectedFromDestination,
                    onChanged: (value) {
                      setState(() {
                        selectedFromDestination = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a departure location';
                      }
                      return null;
                    },
                    items: destinations.map<DropdownMenuItem<Destination>>(
                      (Destination value) {
                        return DropdownMenuItem(
                          value: value,
                          child: kText(text: value.name),
                        );
                      },
                    ).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: kDropDownFormField(
                    labelText: 'To',
                    value: selectedToDestination,
                    onChanged: (value) {
                      setState(() {
                        selectedToDestination = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a destination';
                      }
                      return null;
                    },
                    items: destinations.map<DropdownMenuItem<Destination>>(
                      (Destination value) {
                        return DropdownMenuItem<Destination>(
                          value: value,
                          child: kText(text: value.name),
                        );
                      },
                    ).toList(),
                  ),
                ),
                const TimeDropDown(),
                kElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Generators.showBusListPopup(
                            context,
                            selectedFromDestination!.name,
                            selectedToDestination!.name,
                            selectedDepartureTime);
                      }
                    },
                    text: 'Continue', fontSize: 18)
              ],
            ),
          )),
    );
  }
}
