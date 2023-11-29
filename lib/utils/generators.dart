import 'package:flutter/material.dart';
import 'package:seat_booking/utils/bus_data.dart';
import 'package:seat_booking/screens/seat_screen.dart';
import 'package:seat_booking/widgets/k_text.dart';
import 'package:seat_booking/widgets/k_timedropdown.dart';
import 'package:seat_booking/widgets/k_elevatedbutton.dart';

List<String> generateBusSeats() {
  List<String> seats = [];
  for (int row = 1; row <= 10; row++) {
    for (String column in ['A', 'B', 'C', 'D']) {
      seats.add('$row$column');
    }
  }
  return seats;
}

List<String> getBookedSeats() {
  return ['2B', '3C', '5A','7B','8C','9A','1A','3D','9D','10C'];
}

class Generators{
  Generators._();
  static void showBusListPopup(BuildContext context,String? fromText,String? toText, String? time,) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: kText(text: 'Available Buses',fontSize: 15,),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: availableBuses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: kText(text:availableBuses[index].busNumber),
                      subtitle: kText(text:
                      'Type: ${availableBuses[index].destination}\n'
                            'Departure Time: $selectedDepartureTime',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeatScreen(
                                generateBusSeats().cast<String>(),
                                getBookedSeats(),
                              fromText:fromText,
                              toText:toText,
                              time: time,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: kElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Cancel',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
