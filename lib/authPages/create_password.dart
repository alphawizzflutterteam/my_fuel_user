import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_prj/authPages/login_page.dart';
import 'package:test_prj/components/my_background2.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';

import '../controller/forget_controller.dart';

class CreatePasswordPage extends StatefulWidget {
  CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  var otp;
  var phone;
  var type;
  var token;
  // TextEditingController password = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() {
    final arguments = Get.arguments ?? {};

    otp = arguments['otp'];
    phone = arguments['phone'];
    type = arguments['type'];
    token = arguments['token'];

    setState(() {});
    print("initData ${arguments}");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
        init: ForgetPasswordController(),
        builder: (controller) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Container(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50),
                                  // App Icon
                                  Image.asset(
                                    "assets/login-logo.png",
                                    height: 62,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Create New Password ",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Enter the OTP sent to +91 $phone",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    height: 56,
                                    child: TextFormField(
                                      controller: password,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter New Password';
                                        } else if (value.length < 6) {
                                          return 'Please enter New Password of 6 character';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.person_2_outlined),
                                        label: Text('Create New Password'),
                                        labelStyle: TextStyle(
                                            color: Colors.grey.shade700),
                                        enabled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade700),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                    ),
                                  ),
                                  // MyTextField(
                                  //   labelText: Text("Create New Password"),
                                  // ),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    height: 56,
                                    child: TextFormField(
                                      controller: confirmpassword,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Confirm Password';
                                        } else if (value.length < 6) {
                                          return 'Please enter New Password of 6 character';
                                        } else if (value !=
                                            password.text.toString()) {
                                          return 'Please enter New Password and conform password same';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_open_sharp),
                                        label: Text('Confirm Password'),
                                        labelStyle: TextStyle(
                                            color: Colors.grey.shade700),
                                        enabled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade700),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                    ),
                                  ),
                                  //
                                  // MyTextField(
                                  //   labelText: Text("Confirm Password"),
                                  // ),
                                  SizedBox(height: 40),
                                  GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          controller
                                              .resetPassword(phone, otp,
                                                  password.text.toString())
                                              .then((value) {
                                            Fluttertoast.showToast(
                                                msg: "${value['message']}");
                                            if (value['message'] ==
                                                "Password changed successfully") {
                                              Get.offAll(const LoginPage());
                                              // Navigator.pushAndRemoveUntil(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             const LoginPage()));
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "${value['message']}");
                                            }
                                          });
                                        }
                                      },
                                      // onTap: () => Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => LoginPage(),
                                      //     )),
                                      child: MyButton(text: "Create Password")),
                                  SizedBox(height: 30),
                                ],
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
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            'Create Password',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )

              // MyBackground2(
              //   child:
              //
              //
              //   Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         SizedBox(height: 50),
              //         // App Icon
              //         Image.asset(
              //           "assets/login-logo.png",
              //           height: 62,
              //         ),
              //         SizedBox(height: 10),
              //         Text(
              //           "Create New Password",
              //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              //         ),
              //         SizedBox(height: 8),
              //         Text(
              //           "Enter the OTP sent to +91 9556654328",
              //           style: TextStyle(
              //             fontSize: 16,
              //           ),
              //         ),
              //         SizedBox(height: 20),
              //         MyTextField(
              //           labelText: Text("Create New Password"),
              //         ),
              //         SizedBox(height: 20),
              //         MyTextField(
              //           labelText: Text("Confirm Password"),
              //         ),
              //         SizedBox(height: 40),
              //         GestureDetector(
              //             onTap: () => Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => LoginPage(),
              //                 )),
              //             child: MyButton(text: "Create Password")),
              //         SizedBox(height: 30),
              //       ],
              //     ),
              //   ),
              // ),
              );
        });
  }
}
