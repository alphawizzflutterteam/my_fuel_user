import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_hinttext_field.dart';
import 'package:test_prj/components/widgets/globle_widgets.dart';
import 'package:test_prj/controller/profile_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_form.dart';
import 'package:test_prj/service/paymnet_service/cashFree_pay.dart';
import 'package:test_prj/service/paymnet_service/razor_pay.dart';

import 'controller/orde_fuel_checkout_controller.dart';

class OrderFuelCheckOut extends StatefulWidget {
  const OrderFuelCheckOut({super.key});

  @override
  State<OrderFuelCheckOut> createState() => _OrderFuelCheckOutState();
}

class _OrderFuelCheckOutState extends State<OrderFuelCheckOut> {
  final couponController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderFuelCheckoutController>(
      init: OrderFuelCheckoutController(),
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            appBar: const MyAppbar(title: "Checkout"),
            body: controller.isLoading.value
                ? controller.loader()
                : GetBuilder<ProfileController>(
                    init: ProfileController(),
                    builder: (profileController) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (controller.vendorController.argument['from'] !=
                                        null &&
                                    (controller.vendorController
                                                .argument['from'] ==
                                            'asset' ||
                                        controller.vendorController
                                                .argument['from'] ==
                                            'ev'))
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: colors.myCardColor,
                                          ),
                                          height: 105,
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Delivery Address',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${controller.orderFuelCheckData?.shippingAddressData?.contactPersonName}, ${controller.orderFuelCheckData?.shippingAddressData?.zip}',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        '${controller.orderFuelCheckData?.shippingAddressData?.address}',
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    118,
                                                                    118,
                                                                    128,
                                                                    1),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 24,
                                                    width: 57,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.red)),
                                                    child: Center(
                                                      child: Text(
                                                        '${controller.orderFuelCheckData?.shippingAddressData?.addressType}',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            Card(
                              color: colors.myCardColor,
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: const EdgeInsets.only(right: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          controller.orderFuelCheckData
                                                  ?.vendorImage ??
                                              '',
                                          height: 130,
                                          width: 100,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  errorImage(130, 100),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.orderFuelCheckData
                                                      ?.vendorName ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                const Icon(Icons.location_on),
                                                const SizedBox(width: 5),
                                                Text(
                                                  controller.orderFuelCheckData
                                                          ?.vendorAddress ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 7),
                                            Row(
                                              children: [
                                                Text(
                                                  controller.orderFuelCheckData
                                                          ?.vendorDistance ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  height: 30,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                        spreadRadius: 1,
                                                        blurRadius: 10,
                                                      )
                                                    ],
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        CupertinoIcons
                                                            .star_fill,
                                                        size: 18,
                                                        color: Colors.orange,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        controller
                                                                .orderFuelCheckData
                                                                ?.vendorRating ??
                                                            '',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.all(15.0),
                              decoration: const BoxDecoration(
                                  color: colors.myCardColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Scheduled Date and Time',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    controller.orderFuelCheckData?.timeSlot
                                            ?.title ??
                                        '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    controller.formatDate(
                                        DateTime.parse(
                                            '${controller.orderFuelCheckData?.date}T12:19:12.000000Z'),
                                        'd MMM yyyy, E'),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Obx(() {
                              return Container(
                                  width: double.maxFinite,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  decoration: const BoxDecoration(
                                      color: colors.myCardColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: MyHintTextField(
                                            isReadOnly:
                                                controller.isApply.value,
                                            hintText: const Text('Coupon'),
                                            isActive: true,
                                            controller: couponController,
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.isApply.value ==
                                                true) {
                                              controller.isApply.value = false;
                                              couponController.text = "";
                                              controller.discountAmount.value =
                                                  0.0;
                                            } else {
                                              controller.applyCoupon(
                                                  controller
                                                      .orderFuelCheckData!.total
                                                      .toString(),
                                                  couponController.text);
                                            }
                                          },
                                          child: Container(
                                            height: 55,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                gradient:
                                                    colors.buttonGradient),
                                            child: Center(
                                              child: controller
                                                      .isLoadingcoupon.value
                                                  ? const CircularProgressIndicator(
                                                      color: colors.whiteTemp,
                                                    )
                                                  : Text(
                                                      controller.isApply
                                                                  .value ==
                                                              false
                                                          ? 'Apply'
                                                          : 'Remove',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                          color:
                                                              colors.whiteTemp),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ));
                            }),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Price Detail".tr,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "RSP",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        '₹ ${controller.orderFuelCheckData?.subtotal}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Diesel Quantity",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        ' ${controller.orderFuelCheckData?.quantity}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Delivery free".tr,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        '₹ ${controller.orderFuelCheckData?.serviceCharges}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "GST on delivery Fee".tr,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                      const Text(
                                        '₹ ${0}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Other Charges".tr,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                      const Text(
                                        '₹ ${0}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Obx(() {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Discount".tr,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54),
                                        ),
                                        Text(
                                          '₹ ${controller.discountAmount}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                  const SizedBox(height: 5),
                                  const Divider(
                                    thickness: 2,
                                    color: Colors.black26,
                                    // indent: 15,
                                    //endIndent: 10,
                                  ),
                                  Obx(() {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Amount".tr,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '₹ ${(controller.orderFuelCheckData!.total! - controller.discountAmount.value)}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: colors.green1,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                  const Divider(
                                    thickness: 2,
                                    color: Colors.black26,
                                    //indent: 15,
                                    // endIndent: 10,
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      );
                    }),
            floatingActionButton: GetBuilder<ProfileController>(
                init: ProfileController(),
                builder: (profileController) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: GestureDetector(
                      child: MyButton(text: 'Checkout'.tr),
                      onTap: () {
                        Get.to(PaymentScreenTree(
                          totalAmount:
                              controller.orderFuelCheckData?.total.toString(),
                        ))?.then((value) {
                          if (value == 'payment') {
                            controller
                                .cashFree(
                                    profileController.userInfoModel.value.fName
                                        .toString(),
                                    profileController.userInfoModel.value.email
                                        .toString(),
                                    profileController.userInfoModel.value.phone
                                        .toString(),
                                    controller.orderFuelCheckData?.total
                                            .toString()
                                            .replaceAll(",", "") ??
                                        '100',
                                    profileController.userInfoModel.value.id
                                        .toString())
                                .then((value) {
                              if (value['status'] == true) {
                                Fluttertoast.showToast(
                                    msg: "Please wait for payment");
                                CashFreeHelper cashFreeHelper = CashFreeHelper(
                                  value['data']['response']['order_id'],
                                  context,
                                  value['data']['response']
                                      ['payment_session_id'],
                                  (value) {
                                    if (value != "error") {
                                      controller.placeBooking(
                                          value,
                                          'online',
                                          '0',
                                          controller.discountAmount.value
                                              .toString());
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: 'Something went wrong');
                                    }
                                  },
                                );

                                cashFreeHelper.init();
                              } else {
                                Fluttertoast.showToast(msg: value['message']);
                              }
                            });
                            // RazorPayHelper razorPay =
                            //     RazorPayHelper(
                            //         controller.orderFuelCheckData
                            //                 ?.total
                            //                 .toString() ??
                            //             '100',
                            //         context, (result) async {
                            //   if (result != "error") {
                            //     controller.placeBooking(
                            //         result, 'online', '0');
                            //   } else {
                            //     Fluttertoast.showToast(
                            //         msg: 'Something went wrong');
                            //   }
                            // });

                            // razorPay.init();
                          } else if (value == 'wallet') {
                            controller.placeBooking(
                                '',
                                'wallet',
                                controller.orderFuelCheckData!.total.toString(),
                                controller.discountAmount.value.toString());
                          } else if (value == 'cod') {
                            controller.placeBooking('', 'cod', '0',
                                controller.discountAmount.value.toString());
                          } else {}
                        });
                      },
                    ),
                  );
                }),
          );
        });
      },
    );
  }
}
