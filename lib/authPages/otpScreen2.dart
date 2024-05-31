import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:test_prj/authPages/create_password.dart';
import 'package:test_prj/authPages/register_complete.dart';
import 'package:test_prj/components/my_background2.dart';

import 'package:test_prj/components/my_button.dart';

class OTPScreen2 extends StatefulWidget {
   OTPScreen2({super.key});

  @override
  State<OTPScreen2> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen2> {
  @override
  Widget build(BuildContext context) {
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
                        builder: (context) => RegisterComplete(),
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
    );
  }
}
