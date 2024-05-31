import 'package:flutter/material.dart';
import 'package:test_prj/SelectNewAddress.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/helper/colors.dart';

import '../components/my_appbar.dart';

class FuelOnTabScreen extends StatefulWidget {
  final String? title;

  const FuelOnTabScreen({super.key, this.title});

  @override
  State<FuelOnTabScreen> createState() => _FuelOnTabScreenState();
}

class _FuelOnTabScreenState extends State<FuelOnTabScreen> {
  int _selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppbar(
            title: widget.title ?? 'Fuel On Tab',
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '0.5 KL DU 1',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹12000',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: colors.greenTemp,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                _buildRadioOption(0, '0.5 KL DU 1'),
                _buildRadioOption(1, '0.5 KL DU 2'),
                _buildRadioOption(2, '1 KL DU 1'),
                _buildRadioOption(3, '1 KL DU 2'),
                _buildRadioOption(4, '2 KL DU 1'),
                _buildRadioOption(5, '2 KL DU 2'),
                _buildRadioOption(6, 'Other'),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectNewAddress(
                              isFromFuelOnTab: true,
                            ),
                          ));
                    },
                    child: const MyButton(text: 'Next'))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _selectedRadio = value;
    });
  }

  Widget _buildRadioOption(int value, String text) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: colors.greyTemp.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text,
              style: const TextStyle(fontSize: 16.0, color: colors.greyTemp)),
          Radio(
              // Change the active radio button color here
              fillColor: MaterialStateProperty.all(colors.primary),
              value: value,
              groupValue: _selectedRadio,
              onChanged: (int? value) {
                _handleRadioValueChange(value ?? 0);
              }),
        ],
      ),
    );
  }
}
