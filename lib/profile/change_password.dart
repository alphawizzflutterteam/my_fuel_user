import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              MyAppbar(title: "Change Password"),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MyTextField(labelText: Text("Current Password")),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MyTextField(labelText: Text("New Password")),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MyTextField(labelText: Text("Confirm Password")),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
            child:
                Container(height: 48, child: MyButton(text: "Chage Password")),
          )
        ],
      ),
    );
  }
}
