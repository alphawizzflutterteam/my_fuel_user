import 'package:flutter/material.dart';

extension CustomInputDecoration on InputDecoration {
  static InputDecoration inputDecoration(String hint, {Widget? surffix}) {
    return InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        hintText: hint,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
        ),
        suffix: surffix);
  }
}
