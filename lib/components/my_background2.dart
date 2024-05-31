import 'package:flutter/material.dart';

class MyBackground2 extends StatefulWidget {
  Widget child;
  MyBackground2({super.key, required this.child});

  @override
  State<MyBackground2> createState() => _MyBackground2State();
}

class _MyBackground2State extends State<MyBackground2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
            Color.fromRGBO(252, 130, 59, 1),
            Color.fromRGBO(211, 83, 7, 1),
          ])),
      child: Padding(
        padding: const EdgeInsets.only(top: 120.0),
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
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
