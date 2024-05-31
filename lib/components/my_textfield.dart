import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Widget labelText;
  const MyTextField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        decoration: InputDecoration(
          label: labelText,
          labelStyle: TextStyle(color: Colors.grey.shade700),
          enabled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade700),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
