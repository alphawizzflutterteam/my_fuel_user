import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [MyAppbar(title: 'Contact Us')],
      ),
    );
  }
}
