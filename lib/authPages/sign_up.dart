import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/authPages/login_page.dart';
import 'package:test_prj/authPages/otpScreen2.dart';
import 'package:test_prj/components/my_background.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';
import 'package:test_prj/controller/singup_controller.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignupController(),
      builder: (controller) {
        return Scaffold(
            body: MyBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  // App Icon
                  Image.asset(
                    "assets/login-logo.png",
                    height: 62,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Please Sign in to your account",
                  ),

                  const SizedBox(height: 25),
                  const MyTextField(
                    labelText: Text("Phone No Or Email"),
                  ),
                  const SizedBox(height: 15),
                  const MyTextField(
                    labelText: Text("Full Name"),
                  ),
                  const SizedBox(height: 15),
                  const MyTextField(
                    labelText: Text("Gst Number (optional)"),
                  ),
                  const SizedBox(height: 15),
                  const MyTextField(
                    labelText: Text("Create Password"),
                  ),
                  const SizedBox(height: 15),
                  const MyTextField(
                    labelText: Text("Confirm Password"),
                  ),

                  const SizedBox(height: 20),
                  GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPScreen2())),
                      child: const MyButton(text: "Sign Up")),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Have an account? "),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage())),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color.fromRGBO(138, 180, 2, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
