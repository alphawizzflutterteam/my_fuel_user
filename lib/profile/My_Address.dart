import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/helper/colors.dart';

import 'add_address.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MyAppbar(title: 'Address'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AddressCard(
                  name: "Navin Yadav, 452010",
                  address: "G-14 1st sabari nagar, sukhliya...",
                  label: "Home",
                ),
                const SizedBox(height: 10.0),
                AddressCard(
                  name: "Navin Yadav, 452010",
                  address: "G-14 1st sabari nagar, sukhliya...",
                  label: "Office",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.9,
                ),
                Stack(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddAddressScreen(),
                              ));
                        },
                        child: const MyButton(text: 'New Address')),
                    Positioned(
                        top: 14,
                        left: 85,
                        child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: colors.whiteTemp)),
                            child: Center(
                                child: Icon(
                              Icons.add,
                              size: 18,
                              color: colors.whiteTemp,
                            ))))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final String name;
  final String address;
  final String label;

  AddressCard({
    required this.name,
    required this.address,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                address,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
