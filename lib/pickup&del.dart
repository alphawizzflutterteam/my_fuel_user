import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_button2.dart';

class Pickup extends StatefulWidget {
  const Pickup({super.key});

  @override
  State<Pickup> createState() => _PickupState();
}

class _PickupState extends State<Pickup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppbar(title: "Pickup & Delivery Address"),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(245, 245, 245, 1),
            ),
            height: 153,
            margin: EdgeInsets.all(20),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Address',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Navin Yadav,452010',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'G-14 1st sobari nagar,sukhliya..',
                          style: TextStyle(
                              color: Color.fromRGBO(118, 118, 128, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Container(
                      height: 24,
                      width: 57,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                          border: Border.all(color: Colors.red)),
                      child: const Center(
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 48,
                    child: DisButton(text: "Change or add new address"))
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
          height: 48,
          margin: EdgeInsets.all(16),
          child: MyButton(text: "Continue")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
