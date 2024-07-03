import 'package:flutter/material.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/orderfuel/fuelToGo/my_assets2.dart';

import '../../Home/FuelAddQuantity.dart';
import '../add_fuel_quantity.dart';

class AddVehicles extends StatefulWidget {
  const AddVehicles({super.key});

  @override
  State<AddVehicles> createState() => _AddVehiclesState();
}

class _AddVehiclesState extends State<AddVehicles> {
  final TextEditingController _controller = TextEditingController();
  String? selectedValue;

  final List<String> items = [
    "Four Wheeler",
    "Heavy Vehicle",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  Color.fromRGBO(211, 83, 7, 1),
                  Color.fromRGBO(252, 130, 59, 1),
                  Color.fromRGBO(252, 130, 59, 1),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(23),
                bottomRight: Radius.circular(23),
              ),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 20),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45.0, left: 100),
                  child: Text(
                    'Add Vehicles',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                value: selectedValue,
                hint: Text('Vehicles Type'),
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
          ),
          SizedBox(height: 10,),
          Center(
            child:
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 16),
                hintText: 'Vehicles Registration number',
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  borderSide: new BorderSide(),
                ),
              )
            ),
          ),
          SizedBox(height: 400,),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const FueladdQuantity(),
                  );
                },
                // onTap: () =>showBottomSheet(builder: (context) => AddFuelQuantity,context: context),
                child: MyButton(text: 'Next')),
          ),
        ],
      ),
    );
  }
}
