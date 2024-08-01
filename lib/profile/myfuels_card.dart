import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/profile_controller.dart';
import 'package:test_prj/controller/wallet_controller.dart';
import 'package:test_prj/helper/utils/validator_all.dart';
import 'package:test_prj/payment/paymentScreen.dart';

import '../controller/cart_controller.dart';

class MyFuelsCard extends StatefulWidget {
  const MyFuelsCard({super.key});

  @override
  State<MyFuelsCard> createState() => _MyFuelsCardState();
}

class _MyFuelsCardState extends State<MyFuelsCard> {
  Razorpay? razorpay;
  int? pricerazorpayy;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initUI();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ProfileController controller = Get.find();
      controller.getProfile();
    });
  }

  String amountA = "0";

  void _showEnterAmountDialog(BuildContext context) {
    final TextEditingController _amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Amount'),
          content: TextField(
            controller: _amountController,
            decoration: InputDecoration(
              labelText: 'Amount',
              prefixText: '\$',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                String amountText = _amountController.text;
                if (amountText.isNotEmpty) {
                  double? amount = double.tryParse(amountText);
                  amountA = amount.toString();
                  if (amount != null && amount > 0) {
                    Navigator.of(context).pop(); // Close dialog

                    // Get.back();
                    // Navigate to the second screen and wait for a result
                    var result = await Get.to(PaymentScreenTree());

                    if (result != null) {
                      // if (result == "payment") {
                      //   openCheckout(amountA);
                      // }
                      openCheckout(amountA);
                      Fluttertoast.showToast(msg: "$result");
                      Fluttertoast.showToast(msg: "$amountA");
                    }

                    // If valid amount, show a confirmation message
                    // // Close the dialog
                    // _showConfirmationDialog(context, amount);
                  } else {
                    // Show error if amount is invalid
                    // _showErrorDialog(context, 'Please enter a valid amount.');
                  }
                } else {
                  // Show error if amount is empty
                  // _showErrorDialog(context, 'Please enter an amount.');
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void openCheckout(amount) async {
    double res = double.parse(amount.toString().replaceAll(",", ""));
    pricerazorpayy = int.parse(res.toStringAsFixed(0)) * 100;
    // Navigator.of(context).pop();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': "$pricerazorpayy",
      'name': 'My Fuel',
      'image': 'assets/images/Group 165.png',
      'description': 'My Fuel',
    };
    try {
      razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  Future<void> handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(msg: "Payment successfully");

    WalletController controller = Get.find();
    controller
        .addMoney("$amountA", "${response.paymentId}", "razorpay")
        .then((value) {
      Get.back();
      // Get.offAll(
      //   OrderPlaced(
      //     isFromFuelOnTap: true,
      //     amount: "${controller.checkOutModel.value.total}",
      //   ),
      // );

      // Navigator.pushReplacement(
      //   navigatorKey.currentState!.context!,
      //   MaterialPageRoute(
      //     builder: (context) => OrderPlaced(
      //       isFromFuelOnTap: true,
      //       amount: "${controller.checkOutModel.value.total}",
      //     ),
      //   ),
      // );
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const PaymentScreenTree()));
    });

    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment cancelled by user");
  }

  void handleExternalWallet(ExternalWalletResponse response) {}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (profile) {
          return GetBuilder<WalletController>(
              init: WalletController(),
              builder: (controller) {
                return Scaffold(
                  body: GetBuilder<ProfileController>(
                      init: ProfileController(),
                      builder: (profileController) {
                        return Column(
                          children: [
                            const MyAppbar(title: "My fuels Card"),
                            const SizedBox(height: 27),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // fuel card
                                  Container(
                                    margin: const EdgeInsets.symmetric(),
                                    height: 218,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromRGBO(20, 20, 20, 1),
                                          Color.fromRGBO(30, 30, 30, 1),
                                          Color.fromRGBO(82, 82, 82, 1),
                                          Color.fromRGBO(82, 82, 82, 1),
                                          Color.fromRGBO(82, 82, 82, 1),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          20), // Add circular border
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center, // Align text to the left
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                "assets/login-logo.png",
                                                height: 40,
                                              ),
                                              Text(
                                                'Every Drop Matters'.tr,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Obx(() => Text(
                                                    '${profileController.userInfoModel.value.wallet_id!.substring(0, 3)} ${profileController.userInfoModel.value.wallet_id!.substring(4, 7)} ${profileController.userInfoModel.value.wallet_id!.substring(7, 11)} ${profileController.userInfoModel.value.wallet_id!.substring(12, 16)}',
                                                    style: TextStyle(
                                                      fontSize: 27,
                                                      color: Color.fromRGBO(
                                                          253, 225, 64, 1),
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  )),
                                              Obx(() => Text(
                                                    '${profileController.userInfoModel.value.fName}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Member Since'.tr,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Obx(() => Text(
                                                    '${Validator.convertDateString(profileController.userInfoModel.value.createdAt!.substring(0, 10))}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Available Points'.tr,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Obx(() => Text(
                                                    '${profileController.userInfoModel.value.walletBalance} pts',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            253, 225, 64, 1),
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 16),
                                  Text(
                                    "History".tr,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 8),

                                  Obx(() => controller.listView!.value.length ==
                                          0
                                      ? Center(
                                          child: Container(
                                          child: Text("No History Found".tr),
                                        ))
                                      : ListView.builder(
                                          physics:
                                              AlwaysScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              controller.listView!.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              height: 80,
                                              padding: EdgeInsets.all(18),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 12),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "#${controller.listView![index].transactionId}",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      Text(
                                                        // "25 Jan 2024",
                                                        "${controller.listView![index].createdAt!.substring(0, 10)}",
                                                        style: TextStyle(
                                                          color: Colors
                                                              .grey.shade600,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "-₹${controller.listView![index].balance}",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        )),

                                  // history tile
                                  // Container(
                                  //   height: 80,
                                  //   padding: EdgeInsets.all(18),
                                  //   margin: EdgeInsets.symmetric(vertical: 12),
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.grey.shade300,
                                  //     borderRadius: BorderRadius.circular(12),
                                  //   ),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: [
                                  //       Column(
                                  //         children: [
                                  //           Text(
                                  //             "#ID123589",
                                  //             style: TextStyle(
                                  //               fontSize: 16,
                                  //               fontWeight: FontWeight.w700,
                                  //             ),
                                  //           ),
                                  //           Text(
                                  //             "25 Jan 2024",
                                  //             style: TextStyle(
                                  //               color: Colors.grey.shade600,
                                  //               fontWeight: FontWeight.w600,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Text(
                                  //         "-₹3520",
                                  //         style: TextStyle(
                                  //           color: Colors.red,
                                  //           fontSize: 20,
                                  //           fontWeight: FontWeight.w700,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  //
                                  // Container(
                                  //   height: 80,
                                  //   padding: EdgeInsets.all(18),
                                  //   margin: EdgeInsets.only(bottom: 12),
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.grey.shade300,
                                  //     borderRadius: BorderRadius.circular(12),
                                  //   ),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: [
                                  //       Column(
                                  //         children: [
                                  //           Text(
                                  //             "#ID123589",
                                  //             style: TextStyle(
                                  //               fontSize: 16,
                                  //               fontWeight: FontWeight.w700,
                                  //             ),
                                  //           ),
                                  //           Text(
                                  //             "25 Jan 2024",
                                  //             style: TextStyle(
                                  //               color: Colors.grey.shade600,
                                  //               fontWeight: FontWeight.w600,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Text(
                                  //         "₹3520",
                                  //         style: TextStyle(
                                  //           color: Colors.green,
                                  //           fontSize: 20,
                                  //           fontWeight: FontWeight.w700,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                        onTap: () async {
                          _showEnterAmountDialog(context);
                        },
                        child: MyButton(text: "Add Money".tr)),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                );
              });
        });
  }

  void initUI() {
    razorpay = Razorpay();
    razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }
}
