import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pinput/pinput.dart';
import 'package:test_prj/authPages/create_password.dart';
import 'package:test_prj/authPages/register_complete.dart';
import 'package:test_prj/components/my_background2.dart';

import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/otp_controller.dart';
import 'package:test_prj/helper/utils/app_constants.dart';
import 'package:test_prj/orderfuel/repository/order_fuel_repository.dart';

import '../controller/home_controller.dart';
import '../helper/utils/shared_preference.dart';
import '../main.dart';
import '../routes/app_routes.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var otp;
  var phone;
  var type;
  var token;
  TextEditingController pinController = TextEditingController();
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
    // final arguments = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;

    return GetBuilder<OtpController>(
        init: OtpController(),
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
                Positioned(
                    top: 50,
                    left: 20,
                    child: Row(
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Text(
                          'Verify OTP',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    )),
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
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Enter the OTP $otp sent to +91 $phone",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)
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
                                          border:
                                              Border.all(color: Colors.black12),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    if (otp == pinController.text.toString()) {
                                      controller
                                          .verifyOtp(token, phone, otp)
                                          .then((value) async {
                                        SharedPreferencesService? instance =
                                            await SharedPreferencesService
                                                .getInstance();

                                        instance.saveData(
                                            SharedPreferencesService.kTokenKey,
                                            controller.verifyModel.value.token
                                                .toString());
                                        await controller.box.write(
                                            AppConstants.token,
                                            controller.verifyModel.value.token);

                                        ///Reintialize the DioClient
                                        Get.find<OrderFuelRepo>().updateHeaders(
                                            controller
                                                .verifyModel.value.token!);

                                        Get.toNamed(Routes.MEMBERCARD,
                                            arguments: controller
                                                .verifyModel.value.data);
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           RegisterComplete(),
                                        //     ));
                                        //
                                      });
                                    }

                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           CreatePasswordPage(),
                                    //     ));
                                  },
                                  child: MyButton(text: "Verify")),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't received Otp? "),
                                  InkWell(
                                    onTap: () {},
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
                    ),
                  ),
                ),
              ],
            ),
          )

              // MyBackground2(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         SizedBox(height: 50),
              //         // App Icon
              //         Image.asset("assets/login-logo.png", height: 62),
              //         SizedBox(height: 10),
              //         Text(
              //           "Enter verification code",
              //           style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              //         ),
              //         SizedBox(height: 8),
              //         Text(
              //           "Enter the OTP sent to +91 9566231110",
              //           style: TextStyle(color: Colors.black.withOpacity(0.5)
              //               // fontSize: 26,
              //               // fontWeight: FontWeight.bold,
              //               ),
              //         ),
              //         SizedBox(
              //           height: 30,
              //         ),
              //         Container(
              //           child: Center(
              //             child: Pinput(
              //               length: 4,
              //               defaultPinTheme: PinTheme(
              //                   width: 68,
              //                   height: 58,
              //                   textStyle: TextStyle(
              //                     fontSize: 22,
              //                     color: Colors.black,
              //                   ),
              //                   decoration: BoxDecoration(
              //                  border: Border.all(color: Colors.black12),
              //                     borderRadius: BorderRadius.circular(13),
              //                   )),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 30,
              //         ),
              //         GestureDetector(
              //             onTap: () => Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => CreatePasswordPage(),
              //                 )),
              //             child: MyButton(text: "Verify")),
              //         SizedBox(height: 20),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text("Don't received Otp? "),
              //             Text(
              //               "Resend OTP",
              //               style: TextStyle(
              //                 color: Color.fromRGBO(138, 180, 2, 1),
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              );
        });
  }
}
