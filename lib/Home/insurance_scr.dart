import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_textfield.dart';
import 'package:test_prj/controller/otherservice_controller.dart';
import 'package:test_prj/helper/utils/validator_all.dart';
import 'package:test_prj/home_page.dart';

import '../components/my_button.dart';
import '../helper/colors.dart';
import '../orderfuel/EV/checkout_page.dart';
import '../orderfuel/doorStepDelivery/checkout_page1.dart';
import '../orderfuel/doorStepDelivery/vendors_page.dart';
import '../routes/app_routes.dart';
import 'checkout_car_service.dart';

class Insurance_Scr extends StatefulWidget {
  const Insurance_Scr({super.key});

  @override
  State<Insurance_Scr> createState() => _Insurance_ScrState();
}

class _Insurance_ScrState extends State<Insurance_Scr> {
  TextEditingController vehicleController = TextEditingController();
  TextEditingController fullController = TextEditingController();
  TextEditingController email2Controller = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKeyReset = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtherServiceController>(
        init: OtherServiceController(),
        builder: (controller) {
          return Scaffold(
            appBar: MyAppFinalbar(
              title: "Insurance",
            ),
            // AppBar(
            //   leading: Icon(Icons.arrow_back_ios_new_outlined),
            //   foregroundColor: Colors.white,
            //   flexibleSpace: Container(
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         begin: Alignment.centerLeft,
            //         end: Alignment.centerRight,
            //         colors: [
            //           Color.fromRGBO(252, 130, 59, 1),
            //           Color.fromRGBO(252, 130, 59, 1),
            //           Color.fromRGBO(211, 83, 7, 1),
            //         ],
            //       ),
            //       borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(23),
            //         bottomRight: Radius.circular(23),
            //       ),
            //     ),
            //   ),
            //   title: Text('Insurance'),
            //   centerTitle: true,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(20),
            //       bottomRight: Radius.circular(20),
            //     ),
            //   ),
            // ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKeyReset,
                child: Column(
                  children: [
                    MyTextField(
                      labelText: Text(
                        "Vehicle No.",
                        style: TextStyle(
                            color: colors.greyTemp,
                            fontWeight: FontWeight.bold),
                      ),
                      controller: vehicleController,
                      validator: (value) => Validator.validateName(value),
                    ),
                    // Container(
                    //   padding: EdgeInsetsDirectional.symmetric(
                    //       horizontal: 10, vertical: 10),
                    //   height: 50,
                    //   width: MediaQuery.sizeOf(context).width,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: colors.greyTemp, width: 2)),
                    //   child: Text(
                    //     'Vehicle No.',
                    //     style: TextStyle(
                    //         color: colors.greyTemp, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      labelText: Text(
                        "Full Name",
                        style: TextStyle(
                            color: colors.greyTemp,
                            fontWeight: FontWeight.bold),
                      ),
                      controller: fullController,
                      validator: (value) => Validator.validateName(value),
                    ),
                    // Container(
                    //   padding: EdgeInsetsDirectional.symmetric(
                    //       horizontal: 10, vertical: 10),
                    //   height: 50,
                    //   width: MediaQuery.sizeOf(context).width,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: colors.greyTemp, width: 2)),
                    //   child: Text(
                    //     'Full Name',
                    //     style: TextStyle(
                    //         color: colors.greyTemp, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      labelText: Text(
                        "Email",
                        style: TextStyle(
                            color: colors.greyTemp,
                            fontWeight: FontWeight.bold),
                      ),
                      controller: email2Controller,
                      validator: (value) => Validator.validateEmail(value),
                    ),
                    // Container(
                    //   padding: EdgeInsetsDirectional.symmetric(
                    //       horizontal: 10, vertical: 10),
                    //   height: 50,
                    //   width: MediaQuery.sizeOf(context).width,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: colors.greyTemp, width: 2)),
                    //   child: Text(
                    //     'Email',
                    //     style: TextStyle(
                    //         color: colors.greyTemp, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      isAmount: true,
                      labelText: Text(
                        "Mobile No.",
                        style: TextStyle(
                            color: colors.greyTemp,
                            fontWeight: FontWeight.bold),
                      ),
                      controller: phoneController,
                      validator: (value) => Validator.validatePhone(value),
                    ),
                    // Container(
                    //   padding: EdgeInsetsDirectional.symmetric(
                    //       horizontal: 10, vertical: 10),
                    //   height: 50,
                    //   width: MediaQuery.sizeOf(context).width,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: colors.greyTemp, width: 2)),
                    //   child: Text(
                    //     'Mobile No.',
                    //     style: TextStyle(
                    //         color: colors.greyTemp, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    SizedBox(
                      height: 200,
                    ),
                    Obx(() => controller.isLoading == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : InkWell(
                            onTap: () {
                              if (_formKeyReset.currentState!.validate()) {
                                String value = email2Controller.text.toString();

                                controller
                                    .submitInsurance(
                                        vehicleController.text.toString(),
                                        fullController.text.toString(),
                                        value,
                                        phoneController.text.toString())
                                    .then((value) {
                                  showReviewDialog(context);
                                });
                              }
                            },
                            child: const MyButton(
                              text: "Submit",
                            ),
                          )),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void showReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 280,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: colors.primary.withOpacity(.2),
                    ),
                    child: Icon(
                      Icons.book_online_sharp,
                      color: colors.primary,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'On of our agents will connect',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    'you shortly',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Get.offAllNamed(Routes.HOME);
                    },
                    child: const MyButton(
                      text: "Back to home",
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        //   selectedDate = picked;
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
