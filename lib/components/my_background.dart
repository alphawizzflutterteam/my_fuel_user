import 'package:flutter/material.dart';

class MyBackground extends StatelessWidget {
  Widget child;
  MyBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(252, 130, 59, 1),
            Color.fromRGBO(252, 130, 59, 1),
            Color.fromRGBO(211, 83, 7, 1),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
