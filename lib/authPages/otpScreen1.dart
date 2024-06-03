import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:test_prj/authPages/create_password.dart';
import 'package:test_prj/components/my_background2.dart';

import 'package:test_prj/components/my_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
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

                        child: Icon(Icons.arrow_back,color: Colors.white,),
                        onTap: (){
                          Navigator.pop(context);
                        },

                      ),
                      SizedBox(width: 80,),
                      Text('Verify OTP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
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
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Enter the OTP sent to +91 9566231110",
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
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CreatePasswordPage(),
                                    )),
                                child: MyButton(text: "Verify")),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't received Otp? "),
                                Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                    color: Color.fromRGBO(138, 180, 2, 1),
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
  }
}
