import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/carservice_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/home_page.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_form.dart';

import '../data/model/CheckRequestModel.dart';
import '../helper/utils/validator_all.dart';
import '../payment/pay_success_page.dart';

class Checkout_Car_Service extends StatefulWidget {
  const Checkout_Car_Service({super.key});

  @override
  State<Checkout_Car_Service> createState() => _Checkout_Car_ServiceState();
}

class _Checkout_Car_ServiceState extends State<Checkout_Car_Service> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUI();
  }

  Razorpay? razorpay;
  int? pricerazorpayy;

  void initUI() {
    razorpay = Razorpay();
    razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    CarServiceController controller = Get.find();
    controller.getVendorCheckOut(otherCategory);
  }

  Future<void> handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(msg: "Payment successfully");
    // String? categoryId;
    // String? vehicleType;
    // String? vehicleModel;
    // String? tyreSize;
    // String? timeSlotId;
    // String? date;
    // String? notes;
    // String? service;
    // String? productId;
    // String? shippingAddressId;
    // String? billingSameAsShipping;
    // String? billingAddressId;
    // String? payment_method;
    // String? wallet_used;
    // String? transaction_id;
    CarServiceController carController = Get.find();
    CheckOutRequest checkOutRequest = CheckOutRequest();
    checkOutRequest.categoryId = otherCategory.categoryId;
    checkOutRequest.vehicleType = otherCategory.vehicleType;
    checkOutRequest.vehicleModel = otherCategory.vehicleModel;
    checkOutRequest.tyreSize = otherCategory.tyreSize;
    checkOutRequest.timeSlotId = otherCategory.timeSlotId;
    checkOutRequest.date = otherCategory.date;
    checkOutRequest.notes = otherCategory.notes;
    checkOutRequest.service = otherCategory.service;
    checkOutRequest.productId = otherCategory.productId;
    checkOutRequest.shippingAddressId = otherCategory.shippingAddressId;
    checkOutRequest.billingSameAsShipping = otherCategory.billingSameAsShipping;
    checkOutRequest.billingAddressId = otherCategory.billingAddressId;
    checkOutRequest.payment_method = "razorpay";
    checkOutRequest.wallet_used = "";
    checkOutRequest.wallet_used = "";
    checkOutRequest.transaction_id = "${response.paymentId}";
    checkOutRequest.quantity = otherCategory.quantity ?? "1";
    checkOutRequest.fuel_type = otherCategory.fuel_type;
    checkOutRequest.service_type = otherCategory.service_type;
    carController.PlaceOtherCatOrder(checkOutRequest).then((value) {
      if (value['status'] == true) {
        Fluttertoast.showToast(msg: "${value['message']}");
        Get.offAll(
          OrderPlaced(
            isFromFuelOnTap: true,
            amount:
                "${carController.batterTyreCheckOut.value.data!.total.toString()}",
          ),
        );
      } else {
        Fluttertoast.showToast(msg: "${value['message']}");
      }
    });

    // Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment cancelled by user");
  }

  void handleExternalWallet(ExternalWalletResponse response) {}

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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarServiceController>(builder: (carController) {
      return Scaffold(
        appBar: MyAppbar(
          title: "Checkout".tr,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child:
        //   carController.isLoading == true
        //       ? Center(
        //           child: CircularProgressIndicator(),
        //         )
        //       : Padding(
        //           padding: const EdgeInsets.all(10.0),
        //           child: Align(
        //             alignment: Alignment.centerRight,
        //             child: GestureDetector(
        //               child: MyButton(text: 'Checkout'.tr),
        //               onTap: () async {
        //                 var data = await Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) =>
        //                             const PaymentScreenTree()));
        //
        //                 if (data != null) {
        //                   if (data == "payment") {
        //                     openCheckout(carController
        //                         .batterTyreCheckOut.value.data!.total
        //                         .toString());
        //                   } else {
        //                     carController.PlaceOtherCatOrder(otherCategory)
        //                         .then((value) {});
        //                   }
        //                 }
        //
        //                 // Navigator.push(
        //                 //     context,
        //                 //     MaterialPageRoute(
        //                 //         builder: (context) =>
        //                 //             const PaymentScreenTree()));
        //               },
        //             ),
        //           ),
        //         ),
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Obx(() => carController.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: otherCategory.shippingAddressId == null ||
                              otherCategory.shippingAddressId == ""
                          ? Container()
                          : Container(
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
                                            '${carController.batterTyreCheckOut.value.data!.shippingAddressData!.contactPersonName},${carController.batterTyreCheckOut.value.data!.shippingAddressData!.zip}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            child: Text(
                                              '${carController.batterTyreCheckOut.value.data!.shippingAddressData!.building} ${carController.batterTyreCheckOut.value.data!.shippingAddressData!.landmark},${carController.batterTyreCheckOut.value.data!.shippingAddressData!.city}..',
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      118, 118, 128, 1),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 24,
                                        width: 57,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color:
                                                colors.primary.withOpacity(.1),
                                            border: Border.all(
                                                color: colors.primary)),
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: colors.blackTemp)),
                                      child: Center(
                                          child: Text(
                                        'Change or add new address',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ),
                    if (otherCategory.categoryId == "11") ...[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              elevation: 0, // Remove the shadow effect
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: EdgeInsets.only(right: 10),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              10), // Ensure the image corners are rounded
                                          child: Image.asset(
                                              'assets/carwash.png')),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${carController.batterTyreCheckOut.value.data!.product![0].name}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on),
                                                SizedBox(width: 5),
                                                Text(
                                                  "${carController.batterTyreCheckOut.value.data!.product![0].name}",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Text(
                                                    "Rs ${carController.batterTyreCheckOut.value.data!.product![0].unitPrice}",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
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
                                                            .withOpacity(0.5),
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
                                                      Icon(
                                                        CupertinoIcons
                                                            .star_fill,
                                                        size: 18,
                                                        color: Colors.orange,
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '2.2',
                                                        style: TextStyle(
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Booking Date",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                  Text(
                                    // "Mon,Aug 17",
                                    "${Validator.convertDateString(carController.batterTyreCheckOut.value.data!.date.toString().substring(0, 10))}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${carController.batterTyreCheckOut.value.data!.product![0].name}",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                  Text(
                                    "${carController.batterTyreCheckOut.value.data!.vehicleModelName}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Service Type",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                  Text(
                                    "${carController.batterTyreCheckOut.value.data!.service}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, right: 250),
                              child: Text(
                                "Price Detail",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Car Wash",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                  Text(
                                    "Rs ${carController.batterTyreCheckOut.value.data!.product![0].unitPrice.toString()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Service",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                  Text(
                                    "Rs ${carController.batterTyreCheckOut.value.data!.serviceCharges.toString()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Divider(
                              color: Colors.black54,
                              thickness: 0.2,
                              //indent: 5,
                              // endIndent: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 10, top: 7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Rs ${carController.batterTyreCheckOut.value.data!.total.toString()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.lightGreen,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black54,
                              thickness: 0.2,
                              //indent: 5,
                              // endIndent: 10,
                            ),
                          ],
                        ),
                      ),
                    ] else if (otherCategory.categoryId == "9" ||
                        otherCategory.categoryId == "10") ...[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                color: colors.lightgray,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 12, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        otherCategory.categoryId == "10"
                                            ? "Car & Battery detail"
                                            : 'Car & tyres detail',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Vehicle Manufacture',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '${carController.batterTyreCheckOut.value.data!.vehicleType}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                otherCategory.categoryId == "10"
                                                    ? "Battery"
                                                    : 'Tyres',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '${carController.batterTyreCheckOut.value.data!.productName}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Model',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '${carController.batterTyreCheckOut.value.data!.vehicleModel}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Booking Date',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '${Validator.convertDateString(carController.batterTyreCheckOut.value.data!.date.toString().substring(0, 10))}',
                                                // 'Mon, Aug 17',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, right: 225),
                              child: Text(
                                "Price Detail",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    otherCategory.categoryId == "10"
                                        ? "Battery Price"
                                        : "Tyres Price",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  Text(
                                    "₹ ${carController.batterTyreCheckOut.value.data!.total}",
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
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Service",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  Text(
                                    "₹ ${carController.batterTyreCheckOut.value.data!.serviceCharges}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Divider(
                              // thickness: 2,
                              color: Colors.black26,
                              indent: 15,
                              endIndent: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Rs.${carController.batterTyreCheckOut.value.data!.total}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              // thickness: 2,
                              color: Colors.black26,
                              indent: 15,
                              endIndent: 10,
                            ),
                          ],
                        ),
                      ),
                    ] else if (otherCategory.categoryId == "16") ...[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                color: colors.lightgray,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 12, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Services',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Container(
                                                width: 140,
                                                child: Text(
                                                  '${carController.batterTyreCheckOut.value.data!.service}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Fuel Type',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '${carController.batterTyreCheckOut.value.data!.notes}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 90,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Vehicle',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '${carController.batterTyreCheckOut.value.data!.vehicleTypeName}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Fuel Quantity',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '${carController.batterTyreCheckOut.value.data!.tyreSize.toString()}',
                                                // 'Mon, Aug 17',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, right: 225),
                              child: Text(
                                "Price Detail",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    otherCategory.categoryId == "10"
                                        ? "Battery Price"
                                        : "Tyres Price",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  Text(
                                    "₹ ${carController.batterTyreCheckOut.value.data!.total}",
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
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Service",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  Text(
                                    "₹ ${carController.batterTyreCheckOut.value.data!.serviceCharges}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Divider(
                              // thickness: 2,
                              color: Colors.black26,
                              indent: 15,
                              endIndent: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Rs.${carController.batterTyreCheckOut.value.data!.total}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              // thickness: 2,
                              color: Colors.black26,
                              indent: 15,
                              endIndent: 10,
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      Column(
                        children: [
                          ListView.builder(
                            itemCount: carController
                                .batterTyreCheckOut.value.data!.product!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  "Service Type",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                    "${carController.batterTyreCheckOut.value.data!.product![index].name}"),
                              );
                            },
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            color: colors.lightgray,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, top: 8, bottom: 8),
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
                                    '${carController.batterTyreCheckOut.value.data!.timeSlot!.fromTime} to ${carController.batterTyreCheckOut.value.data!.timeSlot!.toTime}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '${Validator.convertDateString(carController.batterTyreCheckOut.value.data!.date.toString().substring(0, 10))}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10, right: 225),
                              child: Text(
                                "Price Detail",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "MRP (1 item)",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  Text(
                                    "Rs ${carController.batterTyreCheckOut.value.data!.subtotal}",
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
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery free",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  Text(
                                    "Rs ${carController.batterTyreCheckOut.value.data!.serviceCharges}",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Discount",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
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
                            const SizedBox(height: 5),
                            const Divider(
                              // thickness: 2,
                              color: Colors.black26,
                              indent: 15,
                              endIndent: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Rs.${carController.batterTyreCheckOut.value.data!.total}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              // thickness: 2,
                              color: Colors.black26,
                              indent: 15,
                              endIndent: 10,
                            ),
                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 60,
                    ),
                    carController.isLoading == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                child: MyButton(text: 'Checkout'.tr),
                                onTap: () async {
                                  var data = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PaymentScreenTree()));

                                  if (data != null) {
                                    if (data == "payment") {
                                      openCheckout(carController
                                          .batterTyreCheckOut.value.data!.total
                                          .toString());
                                    } else {
                                      CarServiceController carController =
                                          Get.find();
                                      CheckOutRequest checkOutRequest =
                                          CheckOutRequest();
                                      checkOutRequest.categoryId =
                                          otherCategory.categoryId;
                                      checkOutRequest.vehicleType =
                                          otherCategory.vehicleType;
                                      checkOutRequest.vehicleModel =
                                          otherCategory.vehicleModel;
                                      checkOutRequest.tyreSize =
                                          otherCategory.tyreSize;
                                      checkOutRequest.timeSlotId =
                                          otherCategory.timeSlotId;
                                      checkOutRequest.date = otherCategory.date;
                                      checkOutRequest.notes =
                                          otherCategory.notes;
                                      checkOutRequest.service =
                                          otherCategory.service;
                                      checkOutRequest.productId =
                                          otherCategory.productId;
                                      checkOutRequest.shippingAddressId =
                                          otherCategory.shippingAddressId;
                                      checkOutRequest.billingSameAsShipping =
                                          otherCategory.billingSameAsShipping;
                                      checkOutRequest.billingAddressId =
                                          otherCategory.billingAddressId;
                                      checkOutRequest.payment_method = "cod";
                                      checkOutRequest.wallet_used = "";
                                      checkOutRequest.wallet_used = "";
                                      checkOutRequest.transaction_id = "";
                                      checkOutRequest.quantity =
                                          otherCategory.quantity ?? "1";
                                      checkOutRequest.fuel_type =
                                          otherCategory.fuel_type;
                                      checkOutRequest.service_type =
                                          otherCategory.service_type;
                                      carController.PlaceOtherCatOrder(
                                              checkOutRequest)
                                          .then((value) {
                                        if (value['status'] == true) {
                                          Fluttertoast.showToast(
                                              msg: "${value['message']}");
                                          Get.offAll(
                                            OrderPlaced(
                                              isFromFuelOnTap: true,
                                              amount:
                                                  "${carController.batterTyreCheckOut.value.data!.total.toString()}",
                                            ),
                                          );
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "${value['message']}");
                                        }
                                      });
                                    }
                                  }

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const PaymentScreenTree()));
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              )),
      );
    });
  }
}
