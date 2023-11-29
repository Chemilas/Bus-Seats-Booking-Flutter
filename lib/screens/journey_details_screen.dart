import 'package:flutter/material.dart';
import 'package:seat_booking/utils/constants.dart';
import 'package:seat_booking/widgets/k_text.dart';

class JourneyDetailsScreen extends StatelessWidget {
  final List<String> selectedSeats;
  final String startingPoint;
  final String destination;
  final String departureTime;

  const JourneyDetailsScreen({super.key,
    required this.selectedSeats,
    required this.startingPoint,
    required this.destination, required this.departureTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyColors.primary,
        title: const kText(text: 'Journey Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 6.0,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: const AssetImage('assets/images/bus-stop.png',),colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop))
                ),
                constraints: const BoxConstraints(maxHeight: 500.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          const kText(
                            text: 'Ticket Details',
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 16.0),
                          ListTile(
                            title: const kText(
                              text:'Selected Seats:',
                              fontWeight: FontWeight.bold,
                            ),
                            subtitle: Column(
                              children: selectedSeats.map((seat) {
                                return kText(text: seat);
                              }).toList(),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            title: const kText(
                              text: 'Starting Point:',
                              fontWeight: FontWeight.bold,
                            ),
                            subtitle: kText(text: startingPoint),
                          ),
                          const Divider(),
                          ListTile(
                            title: const kText(
                              text: 'Destination:',
                              fontWeight: FontWeight.bold,
                            ),
                            subtitle: kText(text: destination),
                          ),
                          const Divider(),
                          ListTile(
                            title: const kText(
                              text: 'Departure Time:',
                              fontWeight: FontWeight.bold,
                            ),
                            subtitle: kText(text: departureTime),
                          ),
                        ],
                      ),
                      Positioned(
                          height: 800,
                          width: 470,
                          child: Image.asset('assets/images/stamp.png',colorBlendMode: BlendMode.dstATop,scale: 20,width: 100,height: 90,))
                    ]
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}