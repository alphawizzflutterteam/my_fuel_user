import 'package:flutter/material.dart';
import 'package:test_prj/orderfuel/EV/cartPage.dart';
import 'package:test_prj/orderfuel/EV/evVehicle.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/orderfuel/fuelToGo/addVehicles.dart';

class FuelToGo extends StatefulWidget {
  const FuelToGo({super.key});

  @override
  State<FuelToGo> createState() => _FuelToGoState();
}

class _FuelToGoState extends State<FuelToGo> {
  int selected = 0;

  Widget customRadio(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EvVehicle(),
              ));
        });
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            color: (selected == index) ? Colors.black : Colors.blueGrey,
          ),
        ),
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(280, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        side: BorderSide(
          color: (selected == index) ? Colors.yellow : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: const BoxDecoration(
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
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 45.0, left: 20),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 45.0, left: 100),
                    child: Text(
                      'Order Fuel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 45,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Door Step Delivery",
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(138, 180, 2, 1),
                          Color.fromRGBO(59, 120, 31, 1),
                        ],
                      ),
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Fuel to Go",
                      style: TextStyle(color: Color.fromARGB(255, 1, 1, 1)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
        
            customRadio("Diesel", 1),
            const SizedBox(
              height: 20,
            ),
            customRadio("EV", 2),
            const SizedBox(
              height: 20,
            ),
            customRadio("Petrol", 3),
            const SizedBox(
              height: 20,
            ),
            customRadio("PNG", 4),
            const SizedBox(
              height: 20,
            ),
            customRadio("Ethanol", 4),
            const SizedBox(
              height: 20,
            ),
            customRadio("CNG", 4),
            const SizedBox(
              height: 20,
            ),
            customRadio("PNG", 4),
            const SizedBox(
              height: 20,
            ),
            customRadio("Other", 4),
            const SizedBox(
              height: 40,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Column(
            //     children: [
            //
            //     ],
            //   ),
            // ),
        
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddVehicles(),
                      )),
                  child: const MyButton(text: 'Next')),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
