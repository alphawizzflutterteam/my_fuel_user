import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../SelectNewAddress.dart';
import '../components/my_button.dart';
import '../helper/colors.dart';
import '../selectAddress.dart';
class RescueMe extends StatefulWidget {
  const RescueMe({super.key});

  @override
  State<RescueMe> createState() => _RescueMeState();
}

class _RescueMeState extends State<RescueMe> {
  List<String> services=['Fuel','Tyres', 'Changes','Jump Start' ,'Towing(break down)'];
  List<String> vehicles=['2 wheeler', '4 wheeler'];
  List<String> fuelTypes=['Diesel', 'Petrol'];
  String? selectedService;
  String? selectedVehicle;
  String? selectedfuelType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
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
                Padding(
                  padding: const EdgeInsets.only(top: 45.0, left: 20),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45.0, left: 70),
                  child: Text(
                    'Rescue Me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.black12, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    hint: Text('Select Vehicle'),
                    value: selectedVehicle,
                    underline: Container(),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedVehicle = newValue;
                        });
                      }
                    },
                    items: vehicles.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.black12, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    hint: Text('Select Services'),
                    value: selectedService,
                    underline: Container(),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedService = newValue;
                        });
                      }
                    },
                    items: services.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                selectedService==null ?  Container() :    SizedBox(height: 20,),
                selectedService==null ?  Container() :  Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.black12, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    hint: Text('Fuel Type'),
                    value: selectedfuelType,
                    underline: Container(),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedfuelType = newValue;
                        });
                      }
                    },
                    items: fuelTypes.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                selectedfuelType==null ? Container() :   SizedBox(height: 20,),
                selectedfuelType==null ? Container() :     Container(
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                border: Border.all(color: colors.black12, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 5),
                hintText: 'Fuel Quantity(Min 5 ltrs - Max 20 ltrs',
                border: InputBorder.none
              ),
            )
            ),
                SizedBox(height: 100,),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => SelectNewAddress())));
                    },
                    child: MyButton(text: 'Done'),
                  ),
                ),

              ],

            ),
          )

        ],
      ),
    );
  }
}
