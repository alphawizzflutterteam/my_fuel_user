import 'package:flutter/material.dart';

class MyHintTextField extends StatelessWidget {
  final Widget hintText;
  final bool? isActive;
  final bool? isReadOnly;

  final TextEditingController? controller;

  const MyHintTextField(
      {super.key,
      required this.hintText,
      this.isActive,
      this.isReadOnly = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        readOnly: isReadOnly ?? false,
        controller: controller,
        decoration: InputDecoration(
          label: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade700),
          enabled: true,
          isDense: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isActive ?? false
                      ? Colors.transparent
                      : Colors.grey.shade700),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
