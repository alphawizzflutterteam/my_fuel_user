import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_prj/authPages/otpScreen1.dart';
import 'package:test_prj/components/my_background2.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';

import '../controller/forget_controller.dart';
import '../helper/utils/validator_all.dart';
import '../routes/app_routes.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
        init: ForgetPasswordController(),
        builder: (controller) {
          return Scaffold(
              body: Container(
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
            child: Stack(
              children: [
                Padding(
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 66),
                                  // App Icon
                                  Image.asset(
                                    "assets/login-logo.png",
                                    height: 62,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Enter your Phone No".tr,
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Or Email".tr,
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  // Text(
                                  //   "We Have sent the 4 digit Verification code"
                                  //       .tr,
                                  //   style: TextStyle(
                                  //     fontSize: 16,
                                  //   ),
                                  // ),
                                  SizedBox(height: 32),

                                  SizedBox(
                                      height: 56,
                                      child: MyTextField(
                                        controller: phoneController,
                                        validator: (value) =>
                                            Validator.validateWithhint(
                                                value, "Phone No. Or Email".tr),
                                        labelText: Text("Phone No Or Email"),
                                      )
                                      // TextFormField(
                                      //   controller: phoneController,
                                      //   validator: (value) {
                                      //     if (value == null || value.isEmpty) {
                                      //       return 'Please enter "Phone No Or Email';
                                      //     }
                                      //     return null;
                                      //   },
                                      //   decoration: InputDecoration(
                                      //     label: Text('Phone No Or Email'.tr),
                                      //     labelStyle: TextStyle(
                                      //         color: Colors.grey.shade700),
                                      //     enabled: true,
                                      //     isDense: true,
                                      //     border: OutlineInputBorder(
                                      //         borderSide: BorderSide(
                                      //             color: Colors.grey.shade200),
                                      //         borderRadius:
                                      //             BorderRadius.circular(8)),
                                      //     errorBorder: OutlineInputBorder(
                                      //         borderSide: BorderSide(
                                      //             color: Colors.grey.shade200),
                                      //         borderRadius:
                                      //             BorderRadius.circular(8)),
                                      //     enabledBorder: OutlineInputBorder(
                                      //         borderSide: BorderSide(
                                      //             color: Colors.grey.shade200),
                                      //         borderRadius:
                                      //             BorderRadius.circular(8)),
                                      //     focusedBorder: OutlineInputBorder(
                                      //         borderSide: BorderSide(
                                      //             color: Colors.grey.shade700),
                                      //         borderRadius:
                                      //             BorderRadius.circular(8)),
                                      //   ),
                                      // ),
                                      ),
                                  // MyTextField(
                                  //   labelText: Text("Phone No Or Email"),
                                  // ),
                                  SizedBox(height: 32),
                                  Obx(() => controller.isLoading == true
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : GestureDetector(
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              controller
                                                  .forgetpass(
                                                      phoneController.text)
                                                  .then((value) {
                                                if (value['status'] == true) {
                                                  print(
                                                      "object ${value['token']}");
                                                  //PASSWORD_VERIFICATION
                                                  Get.toNamed(
                                                      Routes
                                                          .PASSWORD_VERIFICATION,
                                                      arguments: {
                                                        'token': value['token'],
                                                        'type': value['token'],
                                                        'phone':
                                                            '${phoneController.text}',
                                                        'otp':
                                                            '${value['token']}'
                                                      });
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             const OTPScreen()));
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Please enter Correct user data");
                                                }
                                              });
                                            }
                                          },
                                          child: MyButton(text: "Verify"))),
                                  SizedBox(height: 24),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     Text("Didn't recieved Otp? "),
                                  //     Text(
                                  //       "Resend OTP",
                                  //       style: TextStyle(
                                  //         color: Color.fromRGBO(138, 180, 2, 1),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 50,
                    left: 20,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ))
              ],
            ),
          ));
        });
  }
}
