import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:test_prj/authPages/create_password.dart';
import 'package:test_prj/authPages/register_complete.dart';
import 'package:test_prj/components/my_background2.dart';

import 'package:test_prj/components/my_button.dart';

import '../controller/forget_controller.dart';
import '../main.dart';
import '../routes/app_routes.dart';

class OTPScreen2 extends StatefulWidget {
  OTPScreen2({super.key});

  @override
  State<OTPScreen2> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen2> {
  TextEditingController pinController = TextEditingController();
  var otp;
  var phone;
  var type;
  var token;
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
    // final arguments = Get.arguments ?? {};
    //
    // otp = arguments['otp'];
    // phone = arguments['phone'];
    // type = arguments['type'];
    // token = arguments['token'];

    setState(() {});
    print("initData ${otp}");
    print("initData ${phone}");
    print("initData ${type}");
    return GetBuilder<ForgetPasswordController>(
        init: ForgetPasswordController(),
        builder: (controller) {
          return Scaffold(
            body: MyBackground2(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    // App Icon
                    Image.asset("assets/login-logo.png", height: 62),
                    SizedBox(height: 10),
                    Text(
                      "Enter verification code",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Enter the OTP $token sent to +91 $phone",
                      style: TextStyle(color: Colors.black.withOpacity(0.5)
                          // fontSize: 26,
                          // fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Center(
                        child: Pinput(
                          controller: pinController,
                          length: 4,
                          defaultPinTheme: PinTheme(
                              width: 68,
                              height: 58,
                              textStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(13),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          if (pinController.text.isEmpty) {
                            Fluttertoast.showToast(msg: "Please Enter Otp");
                            return;
                          }

                          if (pinController.text == "$token") {
                            controller
                                .veriFyOtp(phone, pinController.text)
                                .then((value) {
                              Get.toNamed(Routes.CREATEPASSWORD, arguments: {
                                'token': token,
                                'type': token,
                                'phone': '${phone}',
                                'otp': '${token}'
                              });
                            });

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => CreatePasswordPage(),
                            //     ));
                          } else {
                            Fluttertoast.showToast(msg: "Enter Correct Otp".tr);
                          }
                        },
                        child: MyButton(text: "Verify".tr)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't received Otp? "),
                        InkWell(
                          onTap: () {
                            controller.forgetpass(phone).then((value) {
                              if (value['status'] == true) {
                                print("object ${value['token']}");

                                token = value['token'];
                                Fluttertoast.showToast(
                                    msg: "${value['message']}");
                                setState(() {});

                                //PASSWORD_VERIFICATION
                                // Get.toNamed(
                                //     Routes
                                //         .PASSWORD_VERIFICATION,
                                //     arguments: {
                                //       'token': value['token'],
                                //       'type': value['token'],
                                //       'phone':
                                //       '${phoneController.text}',
                                //       'otp':
                                //       '${value['token']}'
                                //     });
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const OTPScreen()));
                              } else {
                                Fluttertoast.showToast(
                                    msg: "${value['message']}");
                              }
                            });
                          },
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                              color: Color.fromRGBO(138, 180, 2, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
