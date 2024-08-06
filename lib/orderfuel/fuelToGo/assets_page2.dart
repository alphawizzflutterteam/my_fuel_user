import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_button2.dart';
import 'package:test_prj/orderfuel/add_fuel_quantity.dart';
import 'package:test_prj/orderfuel/fuelToGo/vendors_page2.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/vendors_page.dart';

class AssetsPage2 extends StatefulWidget {
  const AssetsPage2({super.key});

  @override
  State<AssetsPage2> createState() => _AssetsPage2State();
}

class _AssetsPage2State extends State<AssetsPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const MyAppbar(
            title: "Assets",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Four Wheeler",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vehicles Registration Number",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const Text(
                            "ACD123456",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      Row()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 480),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 48,
                          width: 160,
                          child: DisButton(text: "Add Asset".tr)),
                      SizedBox(
                          height: 48,
                          width: 160,
                          child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VendorsPage2(),
                                  )),
                              child: const MyButton(text: "Fuel to Go"))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
