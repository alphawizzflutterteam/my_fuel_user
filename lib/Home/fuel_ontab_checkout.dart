import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/cart_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_form.dart';

class FuelOnTabCheckoutScreen extends StatefulWidget {
  final bool? isFromFuelOnTap;

  FuelOnTabCheckoutScreen({super.key, this.isFromFuelOnTap});

  @override
  State<FuelOnTabCheckoutScreen> createState() =>
      _FuelOnTabCheckoutScreenState();
}

class _FuelOnTabCheckoutScreenState extends State<FuelOnTabCheckoutScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUI();
  }

  String address_id = "";
  String category_id = "";
  void initUI() {
    final arguments = Get.arguments ?? {};

    print("arguments ${arguments} ");
    address_id = arguments['address_id'].toString();
    category_id = arguments['category_id'].toString();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      CartController controller = Get.find();
      controller.manageCart(address_id, category_id);
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return Scaffold(
            appBar: MyAppFinalbar(
              title: "Checkout",
            ),
            // AppBar(
            //   leading: Icon(
            //     Icons.arrow_back_ios_new_outlined,
            //     size: 20,
            //   ),
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
            //   title: Text('Checkout'),
            //   centerTitle: true,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(20),
            //       bottomRight: Radius.circular(20),
            //     ),
            //   ),
            // ),
            bottomNavigationBar: SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Obx(() => controller.isLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GestureDetector(
                          child: MyButton(text: 'Checkout'),
                          onTap: () {
                            controller.placeOrder(address_id).then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentScreenTree(
                                            isFromFuelOnTap:
                                                widget.isFromFuelOnTap,
                                          )));
                            });
                          },
                        )),
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => controller.isLoading.value == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(245, 245, 245, 1),
                          ),
                          // height: 105,
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Delivery Address',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     const Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //         Text(
                              //           'Navin Yadav,452010',
                              //           style: TextStyle(fontWeight: FontWeight.bold),
                              //         ),
                              //         Text(
                              //           'G-14 1st sobari nagar,sukhliya..',
                              //           style: TextStyle(
                              //               color: Color.fromRGBO(118, 118, 128, 1),
                              //               fontSize: 12,
                              //               fontWeight: FontWeight.w700),
                              //         ),
                              //       ],
                              //     ),
                              //     Container(
                              //       height: 24,
                              //       width: 57,
                              //       decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(4),
                              //           color: colors.primary.withOpacity(.1),
                              //           border: Border.all(color: colors.primary)),
                              //       child: const Center(
                              //         child: Text(
                              //           'Home',
                              //           style: TextStyle(
                              //             fontSize: 12,
                              //             color: colors.primary,
                              //           ),
                              //         ),
                              //       ),
                              //     )
                              //   ],
                              // ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.checkOutModel.value.address!.contactPersonName},${controller.checkOutModel.value.address!.zip}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${controller.checkOutModel.value.address!.building} ${controller.checkOutModel.value.address!.landmark},${controller.checkOutModel.value.address!.city}..',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                118, 118, 128, 1),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 24,
                                    width: 57,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: colors.primary.withOpacity(.1),
                                        border:
                                            Border.all(color: colors.primary)),
                                    child: const Center(
                                      child: Text(
                                        'Home',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: colors.primary,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              /*SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colors.blackTemp)),
                        child: Center(
                            child: Text(
                          'Change or add new address',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      )*/
                            ],
                          ),
                        ),
                      )),
                /*Container(
                width: MediaQuery.sizeOf(context).width,
                color: colors.lightgray,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
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
                        '11:00 to 12:00',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '13 jan 2024,Man',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),*/
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(
                            "${controller.checkOutModel.value.data![0].product!.name.toString()}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Obx(() => Text(
                            "${controller.checkOutModel.value.data![0].product!.slug.toString()}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: colors.greyTemp),
                          ))
                      // Text(
                      //   "0.5 KL DU 1",
                      //   style: TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //       color: colors.greyTemp),
                      // )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          Text(
                            "MRP",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Obx(() => Text(
                                "₹${controller.checkOutModel.value.subtotal}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                      /*const SizedBox(height: 2),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery free",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Text(
                            "80",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),*/
                      const Divider(
                        // thickness: 2,
                        color: Colors.black26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(() => Text(
                                "₹${controller.checkOutModel.value.total}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: colors.greenTemp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                      const Divider(
                        // thickness: 2,
                        color: Colors.black26,
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
