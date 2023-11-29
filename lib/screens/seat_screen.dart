import 'package:flutter/material.dart';
import 'package:seat_booking/screens/journey_details_screen.dart';
import 'package:seat_booking/utils/constants.dart';
import 'package:seat_booking/widgets/k_elevatedbutton.dart';
import 'package:seat_booking/widgets/k_text.dart';

class SeatScreen extends StatefulWidget {
  final List<String> busSeats;
  final List<String> bookedSeats;
  final String? fromText;
  final String? toText;
  final String? time;

  const SeatScreen(this.busSeats, this.bookedSeats, {super.key, this.fromText, this.toText, this.time});

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        foregroundColor: Colors.white,
        title: const kText(text: 'Book Seats'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: const AssetImage('assets/images/bus1.jpg',),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.6), BlendMode.dstATop))
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: widget.busSeats.length,
          itemBuilder: (context, index) {
            final seat = widget.busSeats[index];
            final isSeatSelected = selectedSeats.contains(seat);
            final isSeatBooked = widget.bookedSeats.contains(seat);
            return InkWell(
              onTap: () {
                setState(() {
                  if (!isSeatBooked) {
                    if (isSeatSelected) {
                      selectedSeats.remove(seat);
                    } else {
                      selectedSeats.add(seat);
                    }
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25),offset: Offset(0, 1),blurRadius: 1),
                    BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25),offset: Offset(0, 2),blurRadius: 8),
                    BoxShadow(color: Color.fromRGBO(255, 255, 255, 0.1),offset: Offset(0, 0),blurRadius: 0,spreadRadius: 1),
                  ],
                  color: isSeatBooked ? const Color(0xffcccccc) : isSeatSelected ? MyColors.primary : Colors.white,
                ),
                margin: const EdgeInsets.all(8),
                child: Center(
                  child: kText(
                    text: seat,
                    color: isSeatBooked ? Colors.black : isSeatSelected ? Colors.white : Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: kElevatedButton(
        text: 'Book Selected Seats',
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JourneyDetailsScreen(
                selectedSeats: selectedSeats,
                startingPoint: widget.fromText.toString(),
                destination: widget.toText.toString(),
                departureTime: widget.time.toString()
              ),
            ),
          );
        },
      ),
    );
  }
}
