import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/authPages/forgot_password.dart';
import 'package:test_prj/authPages/login_page_2.dart';
import 'package:test_prj/components/my_background.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/login_controller.dart';
import 'package:test_prj/controller/singup_controller.dart';
import 'package:test_prj/helper/app_images.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/helper/utils/app_constants.dart';
import 'package:test_prj/home.dart';
import 'package:test_prj/authPages/sign_up.dart';
import 'package:test_prj/orderfuel/repository/order_fuel_repository.dart';
import 'package:test_prj/routes/app_pages.dart';
import 'package:test_prj/routes/app_routes.dart';
import 'package:test_prj/service/provider/lavavel_provider.dart';

import '../helper/utils/shared_preference.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController memberShipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: MyBackground(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        Image.asset(
                          AppImages.appLogo,
                          height: 62,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Login".tr,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Please Sign in to your account".tr,
                          style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.changeIndexMethod(0);
                                },
                                child: Container(
                                  height: 45,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    gradient: controller.changeIndex.value == 0
                                        ? colors.buttonGradient
                                        : colors.unselectGradient,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Personal".tr,
                                    style: TextStyle(
                                      color: controller.changeIndex.value == 0
                                          ? colors.whiteTemp
                                          : colors.blackTemp,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.changeIndexMethod(1);
                                },
                                child: Container(
                                  height: 45,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    gradient: controller.changeIndex.value == 1
                                        ? colors.buttonGradient
                                        : colors.unselectGradient,
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade100),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("Business".tr,
                                      style: TextStyle(
                                        color: controller.changeIndex.value == 1
                                            ? colors.whiteTemp
                                            : colors.blackTemp,
                                      )),
                                ),
                              ),
                            ],
                          );
                        }),
                        const SizedBox(height: 15),
                        Obx(() {
                          return controller.changeIndex.value == 0
                              ? showPersonal()
                              : showBusiness();
                        }),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              "Forgot Password? ".tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgetPassword(),
                                  )),
                              child: Text(
                                "Reset It".tr,
                                style: TextStyle(
                                  color: Color.fromRGBO(138, 180, 2, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => controller.isLoading.value == true
                              ? const Center(child: CircularProgressIndicator())
                              : GetBuilder<SignupController>(
                                  init: SignupController(),
                                  builder: (signUpController) {
                                    return GestureDetector(
                                      onTap: () async {
                                        device_token = await FirebaseMessaging
                                            .instance
                                            .getToken();
                                        if (_formKey.currentState!.validate()) {
                                          controller
                                              .login(
                                                  memberShipController.text
                                                      .toString(),
                                                  phoneEmailController.text
                                                      .toString(),
                                                  passwordController.text
                                                      .toString())
                                              .then((value) async {
                                            if (value.containsKey("token")) {
                                              SharedPreferencesService?
                                                  instance =
                                                  await SharedPreferencesService
                                                      .getInstance();
                                              instance.saveData(
                                                  SharedPreferencesService
                                                      .kTokenKey,
                                                  value['token'].toString());
                                              await controller.box.write(
                                                  AppConstants.token,
                                                  value['token']);

                                              ///Reintialize the DioClient
                                              Get.find<OrderFuelRepo>()
                                                  .updateHeaders(
                                                      value['token']);

                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Home()));
                                            } else if (value.containsKey(
                                                'temporary_token')) {
                                              String token =
                                                  value['temporary_token']
                                                      .toString();
                                              signUpController
                                                  .checkOtp(
                                                      token,
                                                      phoneEmailController.text
                                                          .toString())
                                                  .then((value) {
                                                Get.toNamed(
                                                    Routes.PHONE_VERIFICATION,
                                                    arguments: {
                                                      'token': token,
                                                      'type':
                                                          '${controller.changeIndex.value.toString()}',
                                                      'phone':
                                                          '${phoneEmailController.text.toString()}',
                                                      'otp':
                                                          '${signUpController.checkOtpval.value.otp}'
                                                    });
                                              });

                                              // SharedPreferencesService? instance =
                                              //     await SharedPreferencesService
                                              //         .getInstance();
                                              // instance.saveData(
                                              //     SharedPreferencesService
                                              //         .kTokenKey,
                                              //     value['token'].toString());
                                              //
                                              // Navigator.pushReplacement(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             Home()));
                                            } else if (value['token'] != "") {
                                              SharedPreferencesService?
                                                  instance =
                                                  await SharedPreferencesService
                                                      .getInstance();
                                              instance.saveData(
                                                  SharedPreferencesService
                                                      .kTokenKey,
                                                  value['token'].toString());
                                              await controller.box.write(
                                                  AppConstants.token,
                                                  value['token']);

                                              ///Reintialize the DioClient
                                              Get.find<OrderFuelRepo>()
                                                  .updateHeaders(
                                                      value['token']);

                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Home()));
                                            }
                                            // return null;
                                          });
                                        }
                                      },
                                      child: MyButton(text: "Login".tr),
                                    );
                                  }),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't Have an account? ".tr),
                            GestureDetector(
                              onTap: () {
                                String argumentData =
                                    controller.changeIndex.value.toString();
                                Get.toNamed(Routes.REGISTER,
                                    arguments: argumentData);
                                // Get.toNamed(Routes.REGISTER);
                              },
                              child: Text(
                                "Sign Up".tr,
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
            ),
          );
        });
  }

  final bool isPassword = true;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget showPersonal() {
    return Column(
      children: [
        TextFormField(
          controller: phoneEmailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Phone No. Or Email'.tr;
            }
            return null;
          },
          decoration: InputDecoration(
            label: Text('Phone No. Or Email'.tr),
            labelStyle: TextStyle(color: Colors.grey.shade700),
            enabled: true,
            isDense: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: passwordController,
          obscureText: isPassword ? _obscureText : false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter password'.tr;
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: isPassword
                ? GestureDetector(
                    onTap: _toggle,
                    child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility))
                : const SizedBox.shrink(),
            label: Text('Password'.tr),
            labelStyle: TextStyle(color: Colors.grey.shade700),
            enabled: true,
            isDense: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  Widget showBusiness() {
    return Column(
      children: [
        TextFormField(
          controller: memberShipController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Membership No.';
            }
            return null;
          },
          decoration: InputDecoration(
            label: Text('Membership No.'.tr),
            labelStyle: TextStyle(color: Colors.grey.shade700),
            enabled: true,
            isDense: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 56,
          child: TextFormField(
            controller: phoneEmailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Phone No. Or Email'.tr;
              }
              return null;
            },
            decoration: InputDecoration(
              label: Text('Phone No. Or Email'.tr),
              labelStyle: TextStyle(color: Colors.grey.shade700),
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade700),
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 56,
          child: TextFormField(
            obscureText: isPassword ? _obscureText : false,
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Password'.tr;
              }
              return null;
            },
            decoration: InputDecoration(
              label: Text('Password'.tr),
              suffixIcon: isPassword
                  ? GestureDetector(
                      onTap: _toggle,
                      child: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility))
                  : const SizedBox.shrink(),
              labelStyle: TextStyle(color: Colors.grey.shade700),
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade700),
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}
