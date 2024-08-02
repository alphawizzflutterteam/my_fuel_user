import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/paymnet_screen_controller.dart';
import 'package:test_prj/helper/utils/app_constants.dart';
import 'package:test_prj/payment/payment_form.dart';
import 'package:test_prj/payment/payment_page.dart';
import 'package:test_prj/service/paymnet_service/razor_pay.dart';

class PaymentScreenTree extends StatefulWidget {
  final bool? isFromFuelOnTap;
  final String? totalAmount;

  const PaymentScreenTree({super.key, this.isFromFuelOnTap, this.totalAmount});

  @override
  State<PaymentScreenTree> createState() => _PaymentScreenTreeState();
}

class _PaymentScreenTreeState extends State<PaymentScreenTree> {
  int _type = -1;

  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  late bool? isAddoMoney;

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return GetBuilder<PaymentScreenController>(
      init: PaymentScreenController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: GestureDetector(
            onTap: () {
              if (_type == 2) {
                Get.back(result: "cod");
              } else if (_type == 3) {
                Get.back(result: "payment");
              } else {
                double wallet = double.parse(
                    controller.userInfoModel.value.walletBalance ?? '0.0');
                double total = double.parse(widget.totalAmount ?? '0.0');
                if (wallet >= total) {
                  Get.back(result: "wallet");
                } else {
                  Fluttertoast.showToast(msg: 'Insufficient wallet balance');
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                width: double.maxFinite,
                height: 50,
                child: MyButton(
                  text: 'Continue'.tr,
                ),
              ),
            ),
          ),
          appBar: const MyAppbar(title: 'Payment type'),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   height: 100,
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       begin: Alignment.topCenter,
                  //       end: Alignment.center,
                  //       colors: [
                  //         Color.fromRGBO(211, 83, 7, 1),
                  //         Color.fromRGBO(252, 130, 59, 1),
                  //         Color.fromRGBO(252, 130, 59, 1),
                  //       ],
                  //     ),
                  //     borderRadius: BorderRadius.only(
                  //       bottomLeft: Radius.circular(23),
                  //       bottomRight: Radius.circular(23),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 45.0, left: 20),
                  //         child: Icon(
                  //           Icons.arrow_back,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 45.0, left: 80),
                  //         child: Text(
                  //           'Payment Type',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 20),
                    child: Text(
                      'Select payment method'.tr,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Obx(() {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: () => _handleRadio(2),
                        child: Container(
                            width: 325,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            //height: 85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: _type == 1
                                    ? Border.all(width: 1, color: Colors.grey)
                                    : Border.all(
                                        width: 0.3, color: Colors.grey)),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Pay by My fuels card',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Text(
                                            'Available balance',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '₹ ${controller.userInfoModel.value.walletBalance}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text("",
                                      style: _type == 1
                                          ? const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)
                                          : const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            )),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: Radio(
                                        value: 1,
                                        groupValue: _type,
                                        onChanged: _handleRadio,
                                        activeColor: Colors.orange,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _showEnterAmountDialog(
                                            context, controller);
                                        /*_type == 1
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PaymentScreen(
                                                            isAddoMoney: true)),
                                              )
                                            : Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PaymentScreen()),
                                              );*/
                                      },
                                      child: const Text(
                                        'Add Money',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ))),
                      ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: Container(
                      //     width: 325,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: _type == 2
                              ? Border.all(width: 1, color: Colors.black)
                              : Border.all(width: 0.3, color: Colors.grey)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/cod.png",
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(
                                width: 100,
                                child: Text("Pay at Station/Home",
                                    textAlign: TextAlign.start,
                                    style: _type == 2
                                        ? const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)
                                        : const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          )),
                              ),
                              Radio(
                                value: 2,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///
                  Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: Container(
                        // width: 325,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: _type == 3
                                ? Border.all(width: 1, color: Colors.black)
                                : Border.all(width: 0.3, color: Colors.grey)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/razorpay.png",
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(
                                width: 100,
                                child: Text("Razorpay",
                                    textAlign: TextAlign.start,
                                    style: _type == 3
                                        ? const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)
                                        : const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          )),
                              ),
                              Radio(
                                value: 3,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Colors.orange,
                              ),
                            ],
                          ),
                        ))),
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.only(top: 9),
                  //     child: Container(
                  //       // width: 325,
                  //       height: 55,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5),
                  //           border: _type == 4
                  //               ? Border.all(width: 1, color: Colors.black)
                  //               : Border.all(width: 0.3, color: Colors.grey)),
                  //       child: Center(
                  //           child: Padding(
                  //         padding: const EdgeInsets.only(left: 5, right: 5),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Image.asset(
                  //               "assets/upi.png",
                  //               height: 50,
                  //               width: 50,
                  //             ),
                  //             SizedBox(
                  //               width: 100,
                  //               child: Text("UPI Payment",
                  //                   textAlign: TextAlign.start,
                  //                   style: _type == 4
                  //                       ? const TextStyle(
                  //                           fontSize: 17,
                  //                           fontWeight: FontWeight.w500,
                  //                           color: Colors.black)
                  //                       : const TextStyle(
                  //                           fontSize: 15,
                  //                           fontWeight: FontWeight.w500,
                  //                           color: Colors.grey,
                  //                         )),
                  //             ),
                  //             Radio(
                  //               value: 4,
                  //               groupValue: _type,
                  //               onChanged: _handleRadio,
                  //               activeColor: Colors.orange,
                  //             ),
                  //           ],
                  //         ),
                  //       )),
                  //     )),
                  // Padding(
                  //     padding: const EdgeInsets.only(top: 9),
                  //     child: Container(
                  //       //   width: 325,
                  //       height: 55,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5),
                  //           border: _type == 5
                  //               ? Border.all(width: 1, color: Colors.black)
                  //               : Border.all(width: 0.3, color: Colors.grey)),
                  //       child: Center(
                  //           child: Padding(
                  //         padding: const EdgeInsets.only(left: 5, right: 5),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Image.asset(
                  //               "assets/googlepy.png",
                  //               height: 50,
                  //               width: 50,
                  //             ),
                  //             SizedBox(
                  //               width: 100,
                  //               child: Text("Google Pay",
                  //                   textAlign: TextAlign.start,
                  //                   style: _type == 5
                  //                       ? const TextStyle(
                  //                           fontSize: 17,
                  //                           fontWeight: FontWeight.w500,
                  //                           color: Colors.black)
                  //                       : const TextStyle(
                  //                           fontSize: 15,
                  //                           fontWeight: FontWeight.w500,
                  //                           color: Colors.grey,
                  //                         )),
                  //             ),
                  //             Radio(
                  //               value: 5,
                  //               groupValue: _type,
                  //               onChanged: _handleRadio,
                  //               activeColor: Colors.orange,
                  //             ),
                  //           ],
                  //         ),
                  //       )),
                  //     )),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 9),
                  //   child: GestureDetector(
                  //     onTap: () => _handleRadio,
                  //     child: Container(
                  //       //   width: 325,
                  //       height: 55,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5),
                  //           border: _type == 6
                  //               ? Border.all(width: 1, color: Colors.black)
                  //               : Border.all(width: 0.3, color: Colors.grey)),
                  //       child: Center(
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(left: 5, right: 5),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Image.asset(
                  //                 "assets/paystation.png",
                  //                 height: 50,
                  //                 width: 50,
                  //               ),
                  //               SizedBox(
                  //                 width: 100,
                  //                 child: Text("Pay at Station",
                  //                     textAlign: TextAlign.start,
                  //                     style: _type == 6
                  //                         ? const TextStyle(
                  //                             fontSize: 17,
                  //                             fontWeight: FontWeight.w500,
                  //                             color: Colors.black)
                  //                         : const TextStyle(
                  //                             fontSize: 15,
                  //                             fontWeight: FontWeight.w500,
                  //                             color: Colors.grey,
                  //                           )),
                  //               ),
                  //               Radio(
                  //                 value: 6,
                  //                 groupValue: _type,
                  //                 onChanged: _handleRadio,
                  //                 activeColor: Colors.orange,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 9),
                  //   child: GestureDetector(
                  //     onTap: () => _handleRadio,
                  //     child: Container(
                  //       //       width: 325,
                  //       height: 55,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5),
                  //           border: _type == 7
                  //               ? Border.all(width: 1, color: Colors.black)
                  //               : Border.all(width: 0.3, color: Colors.grey)),
                  //       child: Center(
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(left: 5, right: 5),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Image.asset(
                  //                 "assets/paystation.png",
                  //                 height: 50,
                  //                 width: 50,
                  //               ),
                  //               SizedBox(
                  //                 width: 100,
                  //                 child: Text("Buy now pay later",
                  //                     textAlign: TextAlign.start,
                  //                     style: _type == 7
                  //                         ? const TextStyle(
                  //                             fontSize: 17,
                  //                             fontWeight: FontWeight.w500,
                  //                             color: Colors.black)
                  //                         : const TextStyle(
                  //                             fontSize: 15,
                  //                             fontWeight: FontWeight.w500,
                  //                             color: Colors.grey,
                  //                           )),
                  //               ),
                  //               Radio(
                  //                 value: 7,
                  //                 groupValue: _type,
                  //                 onChanged: _handleRadio,
                  //                 activeColor: Colors.orange,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 56,
                  ),
                  const SizedBox(width: 80),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showEnterAmountDialog(
      BuildContext context, PaymentScreenController controller) {
    final TextEditingController _amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Amount'),
          content: TextField(
            controller: _amountController,
            decoration: const InputDecoration(
              labelText: 'Amount',
              prefixText: '${AppConstants.currencySymbol}',
              border: OutlineInputBorder(),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                String amountText = _amountController.text;
                if (amountText.isNotEmpty) {
                  int? amount = int.tryParse(amountText);
                  if (amount != null && amount > 0) {
                    Navigator.of(context).pop();
                    // Close dialog
                    RazorPayHelper razor =
                        RazorPayHelper(amount.toString(), context, (value) {
                      if (value != 'error') {
                        controller.addMoney(amount.toString(), value, 'online');
                      }
                    });

                    razor.init();
                  } else {}
                } else {}
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
