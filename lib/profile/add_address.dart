import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppbar(title: 'Add Address'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildTextField(label: 'Name', hintText: 'Navin Pawa'),
                  _buildTextField(label: 'Mobile Number'),
                  _buildTextField(label: 'Alternate Mobile Number'),
                  _buildTextField(label: 'House no., Building Name'),
                  _buildTextField(label: 'Road name, Area Colony'),
                  _buildTextField(label: 'Country'),
                  _buildTextField(label: 'State'),
                  _buildTextField(label: 'City'),
                  _buildTextField(label: 'PinCode'),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const MyButton(text: 'Save Address'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, String? hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.red)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
    );
  }
}
