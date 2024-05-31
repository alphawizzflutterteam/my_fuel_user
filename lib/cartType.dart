import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_prj/components/my_button.dart';

class CarType extends StatefulWidget {
  const CarType({super.key});

  @override
  State<CarType> createState() => _CarTypeState();
}

class _CarTypeState extends State<CarType> {
  String? selectedValue;
  final List<String> items = [
    "Tow Wheeler",
    "Hatchback",
    "Sedan",
    "MUV",
    "SUV"
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
                child: Text(
                  "Select Car Type",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 7),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    value: selectedValue,
                    hint: Text('Selecct your vehiccle type'),
                    isExpanded: true,
                    underline: SizedBox(),
                    items: items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 90,
            ),
            MyButton(text: 'Book Now')
          ],
        ),
      ),
    );
  }
}
