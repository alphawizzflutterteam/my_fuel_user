import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [MyAppbar(title: 'Privacy Policy')],
      ),
    );
  }
}
