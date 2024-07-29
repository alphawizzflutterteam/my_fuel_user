import 'package:flutter/material.dart';

class MyHintTextField extends StatelessWidget {
  final Widget hintText;

  const MyHintTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        decoration: InputDecoration(
          label: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade700),
          enabled: true,
          isDense: true,
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
