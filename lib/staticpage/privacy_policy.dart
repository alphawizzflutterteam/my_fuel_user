import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';

class PrivacyolicyScreen extends StatelessWidget {
  const PrivacyolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [MyAppbar(title: 'Privacy Policy')],
      ),
    );
  }
}
