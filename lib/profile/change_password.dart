import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';

import '../controller/forget_controller.dart';
import '../controller/singup_controller.dart';
import '../helper/utils/validator_all.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final _formKeyReset = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        init: SignupController(),
        builder: (controller) {
          return Scaffold(
            body: Form(
              key: _formKeyReset,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      MyAppbar(title: "Change Password"),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MyTextField(
                            isPassword: true,
                            validator: (value) =>
                                Validator.validatePassword(value),
                            controller: currentPassword,
                            labelText: Text("Current Password")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MyTextField(
                            isPassword: true,
                            validator: (value) =>
                                Validator.validatePassword(value),
                            controller: newPassword,
                            labelText: Text("New Password")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MyTextField(
                            isPassword: true,
                            validator: (value) =>
                                Validator.validateConfirmPassword(
                                    value, newPassword.text),
                            controller: confirmPassword,
                            labelText: Text("Confirm Password")),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 40),
                    child: Container(
                        height: 48,
                        child: InkWell(
                            onTap: () {
                              if (_formKeyReset!.currentState!.validate()) {
                                controller
                                    .chnagePassword(currentPassword.text,
                                        confirmPassword.text)
                                    .then((value) {
                                  if (value['success'] == true) {}
                                });
                              }
                              // controller.resetPassword()
                            },
                            child: MyButton(text: "Change Password"))),
                  )
                ],
              ),
            ),
          );
        });
  }
}
