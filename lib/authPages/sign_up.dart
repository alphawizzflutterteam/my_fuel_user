import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/authPages/login_page.dart';
import 'package:test_prj/authPages/otpScreen2.dart';
import 'package:test_prj/components/my_background.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';
import 'package:test_prj/controller/singup_controller.dart';
import 'package:test_prj/helper/utils/validator_all.dart';

import '../repository/model/user_model.dart';
import '../routes/app_routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String data = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController comapnyNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController gstController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController msmeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController guestIdController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUI();
  }

  @override
  Widget build(BuildContext context) {
    data = Get.arguments ?? '';
    print(" data Index  $data");
    return GetBuilder(
      init: SignupController(),
      builder: (controller) {
        return Scaffold(
            body: MyBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKeyReset,
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
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Please Sign in to your account",
                    ),

                    data == "1" ? showBussiness() : showUser(),

                    const SizedBox(height: 20),
                    GetBuilder<SignupController>(builder: (controller) {
                      return controller.isLoading.value == true
                          ? CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                if (_formKeyReset!.currentState!.validate()) {
                                  User user = User();
                                  user.fName = nameController.text;
                                  user.lName = nameController.text;
                                  user.email = emailController.text;
                                  user.phone = phoneController.text;
                                  user.gst = gstController.text;
                                  user.guest_id = "123";
                                  user.address = addressController.text;
                                  user.pan = panController.text;
                                  user.msme = msmeController.text;
                                  user.password = passwordController.text;
                                  user.profile =
                                      data == "0" ? "normal" : "bussiness";

                                  controller.Register(user).then((value) {
                                    if (value.containsKey("errors")) {
                                      Fluttertoast.showToast(msg: "$value");
                                    } else if (value['temporary_token'] != "") {
                                      String token =
                                          value['temporary_token'].toString();
                                      controller
                                          .checkOtp(token, phoneController.text)
                                          .then((value) {
                                        Get.toNamed(Routes.PHONE_VERIFICATION,
                                            arguments: {
                                              'token': token,
                                              'type': '${data}',
                                              'phone':
                                                  '${phoneController.text}',
                                              'otp':
                                                  '${controller.checkOtpval.value.otp}'
                                            });
                                      });

                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             OTPScreen2(a )));
                                    }

                                    // return null;
                                  });
                                }
                              },
                              child: const MyButton(text: "Sign Up"));
                    }),
                    const SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already Have an account? "),
                        GestureDetector(
                          onTap: () {
                            if (_formKeyReset!.currentState!.validate()) {
                              User user = new User();
                              user.fName = nameController.text;
                              // user.lName = nameController.text;
                              user.email = emailController.text;
                              user.phone = phoneController.text;
                              user.gst = gstController.text;
                              user.address = addressController.text;
                              user.pan = panController.text;
                              user.msme = msmeController.text;
                              user.password = passwordController.text;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            }
                          },
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
          ),
        ));
      },
    );
  }

  void initUI() {
    data = Get.arguments ?? '';
  }

  final _formKeyReset = GlobalKey<FormState>();

  Widget showBussiness() {
    return Column(
      children: [
        const SizedBox(height: 25),
        MyTextField(
          validator: (value) => Validator.validatePhone(value),
          isAmount: true,
          controller: phoneController,
          labelText: Text("Phone No "),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateEmail(value),
          controller: emailController,
          labelText: Text("Email"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateEmail(value),
          controller: nameController,
          labelText: Text("Company Name"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateName(value),
          controller: gstController,
          labelText: Text("Gst Number (optional)"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateAddress(value),
          controller: addressController,
          labelText: Text("Company Address"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateAddress(value),
          controller: panController,
          labelText: Text("Pan No."),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateAddress(value),
          controller: msmeController,
          labelText: Text("MSME No.(optional)"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validatePassword(value),
          isPassword: true,
          controller: passwordController,
          labelText: Text("Password"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validatePassword(value),
          isPassword: true,
          controller: confirmpasswordController,
          labelText: Text("Confirm Password"),
        ),
      ],
    );
  }

  Widget showUser() {
    return Column(
      children: [
        const SizedBox(height: 25),
        MyTextField(
          validator: (value) => Validator.validatePhone(value),
          controller: phoneController,
          isAmount: true,
          labelText: Text("Phone No "),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateEmail(value),
          controller: emailController,
          labelText: Text("Email"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateName(value),
          controller: nameController,
          labelText: Text("Full Name"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateName(value),
          controller: gstController,
          labelText: Text("Gst Number (optional)"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validatePassword(value),
          isPassword: true,
          controller: passwordController,
          labelText: Text("Password"),
        ),
        SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validatePassword(value),
          isPassword: true,
          controller: confirmpasswordController,
          labelText: Text("Confirm Password"),
        ),
      ],
    );
  }
}
