import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final Widget labelText;
  final TextEditingController? controller;
  final bool isPassword;
  final bool enable;
  final bool isAmount;
  final bool isGst;
  final VoidCallback? onPressed;
  final maxLenth;
  final TextInputType? textInputType;
  final Function(String text)? onChanged;
  final String? Function(String?) validator;

  // FormFieldValidator<String>? validator;
  // final String? Function(String?)?
  MyTextField({
    super.key,
    this.onPressed,
    required this.labelText,
    required this.controller,
    this.textInputType,
    this.isPassword = false,
    this.enable = false,
    this.isGst = false,
    this.isAmount = false,
    this.onChanged,
    this.maxLenth,
    required this.validator,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: widget.enable ?? false,
      onTap: widget.onPressed,
      textCapitalization: widget.isGst
          ? TextCapitalization.characters
          : TextCapitalization.none, // This makes all input uppercase

      obscureText: widget.isPassword ? _obscureText : false,
      onChanged: widget.onChanged,
      validator: widget.validator!,
      maxLength: widget.maxLenth ?? null,
      keyboardType: widget.isAmount
          ? TextInputType.number
          : widget.textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        counter: SizedBox(),
        label: widget.labelText,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: _toggle,
                child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility))
            : const SizedBox.shrink(),
        labelStyle: TextStyle(color: Colors.grey.shade700),
        enabled: true,
        isDense: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade700),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
