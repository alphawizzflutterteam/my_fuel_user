import 'package:flutter/material.dart';

import '../helper/colors.dart';

class DisButton extends StatelessWidget {
  final String text;
  const DisButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: colors.lightgray,
        // border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
      ),
    );
  }
}
