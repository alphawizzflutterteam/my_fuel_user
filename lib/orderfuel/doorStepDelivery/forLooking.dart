import 'package:flutter/material.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/orderfuel/fuelToGo/fuelToGo.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/my_assets.dart';

class LookingForCompany extends StatefulWidget {
  const LookingForCompany({super.key});

  @override
  State<LookingForCompany> createState() => _LookingForCompanyState();
}

class _LookingForCompanyState extends State<LookingForCompany> {
  int selected = 0;

  Widget customRadio(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            color: (selected == index) ? Colors.blueGrey : Colors.black,
          ),
        ),
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(280, 50), // Set a fixed width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        side: BorderSide(
          color: (selected == index) ? Colors.black : Colors.yellow,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
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
                    Icons.arrow_back_ios_new_rounded,
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
                    "Door Step Delivery",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FuelToGo())),
                  child: Container(
                    height: 45,
                    width: 160,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 235, 233, 233),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Fuel to Go",
                      style: TextStyle(color: Color.fromARGB(255, 1, 1, 1)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                customRadio("DIESEL", 1),
                const SizedBox(
                  height: 20,
                ),
                customRadio("EV", 2),
                const SizedBox(
                  height: 20,
                ),
                customRadio("CNG", 3),
              ],
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyAssets())),
                child: const MyButton(text: 'Next')),
          ),
        ],
      ),
    );
  }
}
