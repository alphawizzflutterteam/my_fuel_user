import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/authPages/login_page.dart';
import 'package:test_prj/authPages/otpScreen2.dart';
import 'package:test_prj/components/my_background.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';
import 'package:test_prj/controller/singup_controller.dart';
import 'package:test_prj/helper/utils/app_constants.dart';
import 'package:test_prj/helper/utils/validator_all.dart';

import '../repository/model/user_model.dart';
import '../routes/app_routes.dart';
import '../staticpage/privacy_policy.dart';
import '../staticpage/terms_condition.dart';

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

  bool isPCheck = false;
  @override
  Widget build(BuildContext context) {
    // data = Get.arguments ?? '';
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
                    const SizedBox(height: 60),
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

                    data == "1" ? showBusiness() : showUser(),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: Colors.deepOrange,
                          value: isPCheck,
                          onChanged: (value) {
                            isPCheck = value!;
                            setState(() {});
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TermsConditionScreen(),
                                    ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Terms and Conditions".tr,
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor)),
                                ],
                              )),
                        ),
                        Text(" and "),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PrivacyolicyScreen(),
                                    ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Privacy Policy".tr,
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor)),
                                ],
                              )),
                        ),
                      ],
                    ),
                    GetBuilder<SignupController>(
                        init: SignupController(),
                        builder: (controller) {
                          return Obx(() {
                            return controller.isLoading.value == true
                                ? Center(
                                    child: const CircularProgressIndicator())
                                : GestureDetector(
                                    onTap: () {
                                      if (isPCheck == false) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Please select privacy and terms & condition");
                                        return;
                                      }

                                      if (gstController.text.isNotEmpty &&
                                          gstController.text.length < 15) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Please enter gst number of 15");
                                        return;
                                      }
                                      if (phoneController.text.isNotEmpty &&
                                          phoneController.text.length < 10) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Please enter phone number of 10");
                                        return;
                                      }
                                      if (data == "1") {
                                        if (panController.text.isNotEmpty &&
                                            panController.text.length < 10) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Please enter pan number of 10");
                                          return;
                                        }
                                        if (msmeController.text.isNotEmpty &&
                                            msmeController.text.length < 12) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Please enter msme number of 12");
                                          return;
                                        }
                                      }

                                      if (_formKeyReset!.currentState!
                                          .validate()) {
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
                                        user.profile = data == "0"
                                            ? "normal"
                                            : "bussiness";

                                        controller.Register(user).then((value) {
                                          if (value!.containsKey('errors')) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "${value['errors'][0]['message']}");
                                          } else if (value['temporary_token'] !=
                                              "") {
                                            String token =
                                                value['temporary_token']
                                                    .toString();
                                            controller
                                                .checkOtp(
                                                    token, phoneController.text)
                                                .then((value) {
                                              Get.toNamed(
                                                  Routes.PHONE_VERIFICATION,
                                                  arguments: {
                                                    'token': token,
                                                    'type': '${data}',
                                                    'phone':
                                                        '${phoneController.text}',
                                                    'otp':
                                                        '${controller.checkOtpval.value.otp}'
                                                  });
                                            });
                                          }

                                          // return null;
                                        });
                                      }
                                    },
                                    child: MyButton(text: "Sign Up".tr));
                          });
                        }),
                    const SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already Have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                            // if (_formKeyReset!.currentState!.validate()) {
                            //   User user = new User();
                            //   user.fName = nameController.text;
                            //   // user.lName = nameController.text;
                            //   user.email = emailController.text;
                            //   user.phone = phoneController.text;
                            //   user.gst = gstController.text;
                            //   user.address = addressController.text;
                            //   user.pan = panController.text;
                            //   user.msme = msmeController.text;
                            //   user.password = passwordController.text;
                            //
                            //
                            // }
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              color: Color.fromRGBO(138, 180, 2, 1),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 35,
                    )
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
    setState(() {});
  }

  final _formKeyReset = GlobalKey<FormState>();

  Widget showBusiness() {
    return Column(
      children: [
        const SizedBox(height: 25),
        MyTextField(
          isAmount: true,
          controller: phoneController,
          validator: (value) => Validator.validatePhone(value),
          maxLenth: AppConstants.phoneValidation,
          labelText: const Text("Phone No "),
        ),
        const SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateEmail(value),
          controller: emailController,
          labelText: const Text("Email"),
        ),
        const SizedBox(height: 15),
        MyTextField(
          validator: (value) =>
              Validator.validateWithhint(value, "Company Name"),
          controller: nameController,
          labelText: const Text("Company Name"),
        ),
        const SizedBox(height: 15),
        MyTextField(
          maxLenth: 16,
          validator: (value) => null,
          controller: gstController,
          labelText: const Text("Gst Number (optional)"),
        ),
        const SizedBox(height: 15),
        MyTextField(
          validator: (value) =>
              Validator.validateWithhint(value, "Company Address"),
          controller: addressController,
          labelText: const Text("Company Address"),
        ),
        const SizedBox(height: 15),
        MyTextField(
          maxLenth: 10,
          // validator: (value) => Validator.validateWithhint(value, "Pan No."),
          validator: (value) => null,
          controller: panController,
          labelText: const Text("Pan No.(Optional)"),
        ),
        const SizedBox(height: 15),
        MyTextField(
          maxLenth: 12,
          validator: (value) => null,
          controller: msmeController,
          labelText: const Text("MSME No.(optional)"),
        ),
        const SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validatePassword(value),
          isPassword: true,
          controller: passwordController,
          labelText: Text("Password".tr),
        ),
        const SizedBox(height: 15),
        MyTextField(
          validator: (value) =>
              Validator.validateConfirmPassword(value, passwordController.text),
          isPassword: true,
          controller: confirmpasswordController,
          labelText: Text("Confirm Password".tr),
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
          maxLenth: AppConstants.phoneValidation,
          isAmount: true,
          labelText: const Text("Phone No "),
        ),
        const SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateEmail(value),
          controller: emailController,
          labelText: const Text("Email"),
        ),
        const SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validateName(value),
          controller: nameController,
          labelText: const Text("Full Name"),
        ),
        const SizedBox(height: 15),
        MyTextField(
          maxLenth: 16,
          validator: (value) => null,
          controller: gstController,
          labelText: const Text("Gst Number (optional)"),
        ),
        const SizedBox(height: 15),
        MyTextField(
          validator: (value) => Validator.validatePassword(value),
          isPassword: true,
          controller: passwordController,
          labelText: const Text("Password"),
        ),
        const SizedBox(height: 15),
        MyTextField(
          validator: (value) =>
              Validator.validateConfirmPassword(value, passwordController.text),
          isPassword: true,
          controller: confirmpasswordController,
          labelText: const Text("Confirm Password"),
        ),
      ],
    );
  }
}
