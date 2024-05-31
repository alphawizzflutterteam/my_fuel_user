import 'package:flutter/material.dart';
import 'package:test_prj/Home/Evcheckout.dart';
import 'package:test_prj/Home/fuel_ontab_checkout.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/vendors_page.dart';

import '../../charging_stations.dart';
import 'Evdoor.dart';
import 'charginStationDetails.dart';



class Fuelbottom extends StatefulWidget {
  const Fuelbottom({super.key});

  @override
  State<Fuelbottom> createState() => _FuelbottomState();
}

class _FuelbottomState extends State<Fuelbottom> {
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
              child: Text(
                "Schedule data and timing",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
                controller: dateController,
                decoration: InputDecoration(
                  // labelText: 'Schedule date and timing',
                  hintText: 'Schedule date and timing',
                  //filled: true,
                  suffixIcon: const Icon(Icons.calendar_today),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                }),
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.only(right: 290),
            child: Text(
              "Slots",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  height: 35,
                  width: 160,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7, left: 15),
                    child: Text(
                      '1:00 PM - 1:30 PM',
                      style: TextStyle(fontSize: 15, color: Colors.orange),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  height: 35,
                  width: 160,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7, left: 15),
                    child: Text(
                      '2:00 PM - 2:30 PM',
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.grey.withOpacity(0.0),
                  ),
                  height: 35,
                  width: 160,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7, left: 15),
                    child: Text(
                      '2:30 PM - 3:00 PM',
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  height: 35,
                  width: 160,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7, left: 15),
                    child: Text(
                      '3:00 PM - 3:30 PM',
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Container(
            alignment: Alignment.bottomCenter,
            width: 330,
            child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChargingStations())),
                child: MyButton(text: 'Book Now')),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        //   selectedDate = picked;
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
