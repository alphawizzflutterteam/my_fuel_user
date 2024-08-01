import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/widgets/globle_widgets.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_form.dart';
import 'package:test_prj/service/paymnet_service/razor_pay.dart';

import 'controller/orde_fuel_checkout_controller.dart';

class OrderFuelCheckOut extends StatefulWidget {
  const OrderFuelCheckOut({super.key});

  @override
  State<OrderFuelCheckOut> createState() => _OrderFuelCheckOutState();
}

class _OrderFuelCheckOutState extends State<OrderFuelCheckOut> {
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
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (controller.vendorController.argument['from'] != null &&
                              (controller.vendorController.argument['from'] ==
                                      'asset' ||
                                  controller
                                          .vendorController.argument['from'] ==
                                      'ev'))
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${controller.orderFuelCheckData?.shippingAddressData?.contactPersonName}, ${controller.orderFuelCheckData?.shippingAddressData?.zip}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${controller.orderFuelCheckData?.shippingAddressData?.address}',
                                                  style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          118, 118, 128, 1),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 24,
                                              width: 57,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
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
                                    controller
                                            .orderFuelCheckData?.vendorImage ??
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
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
                                                  BorderRadius.circular(5),
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
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  CupertinoIcons.star_fill,
                                                  size: 18,
                                                  color: Colors.orange,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  controller.orderFuelCheckData
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
                              controller.orderFuelCheckData?.timeSlot?.title ??
                                  '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              controller.formatDate(
                                  DateTime.parse(
                                      '${controller.orderFuelCheckData?.date}T12:19:12.000000Z'),
                                  'd MMM yyyy, E'),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Price Detail",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "MRP (1 item)",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Delivery free",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Discount",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                                Text(
                                  '₹ ${controller.orderFuelCheckData?.coupanDiscount}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Divider(
                              thickness: 2,
                              color: Colors.black26,
                              // indent: 15,
                              //endIndent: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total Amount",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '₹ ${controller.orderFuelCheckData?.total}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: colors.green1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 2,
                              color: Colors.black26,
                              //indent: 15,
                              // endIndent: 10,
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  child: const MyButton(text: 'Checkout'),
                                  onTap: () {
                                    Get.to(const PaymentScreenTree())
                                        ?.then((value) {
                                      if (value == 'payment') {
                                        RazorPayHelper razorPay =
                                            RazorPayHelper(
                                                controller.orderFuelCheckData
                                                        ?.total
                                                        .toString() ??
                                                    '100',
                                                context, (result) async {
                                          if (result != "error") {
                                            controller.placeBooking(
                                                result, 'online', '0');
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: 'Something went wrong');
                                          }
                                        });

                                        razorPay.init();
                                      } else if (value == 'wallet') {
                                        controller.placeBooking(
                                            '',
                                            'wallet',
                                            controller.orderFuelCheckData!.total
                                                .toString());
                                      } else {
                                        controller.placeBooking('', 'cod', '0');
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        });
      },
    );
  }
}
