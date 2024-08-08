import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/carservice_controller.dart';
import 'package:test_prj/controller/profile_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/home_page.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_form.dart';

import '../components/my_hinttext_field.dart';
import '../controller/cart_controller.dart';
import '../data/model/CheckRequestModel.dart';
import '../helper/utils/app_constants.dart';
import '../helper/utils/validator_all.dart';
import '../payment/pay_success_page.dart';
import '../service/paymnet_service/cashFree_pay.dart';

class Checkout_Car_Service extends StatefulWidget {
  Checkout_Car_Service({super.key});

  @override
  State<Checkout_Car_Service> createState() => _Checkout_Car_ServiceState();
}

class _Checkout_Car_ServiceState extends State<Checkout_Car_Service> {
  final couponController = TextEditingController();
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
    CarServiceController controller = Get.put(CarServiceController());

    controller.getVendorCheckOut(otherCategory);
  }

  Future<void> handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(msg: "Payment successfully".tr);
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
    checkOutRequest.payment_method = "cashfree";
    checkOutRequest.wallet_used = "";
    checkOutRequest.wallet_used = "";
    checkOutRequest.transaction_id = "${response.paymentId}";
    checkOutRequest.quantity = otherCategory.quantity ?? "1";
    checkOutRequest.fuel_type = otherCategory.fuel_type;
    checkOutRequest.service_type = otherCategory.service_type;
    checkOutRequest.coupan_discount_amount =
        carController.discountAmount.toString();
    carController.PlaceOtherCatOrder(checkOutRequest).then((value) {
      if (value['status'] == true) {
        String messgae = "${value['message'].toString()}";
        print("object sdsdsdsd${value['message'].toString()}");
        Fluttertoast.showToast(msg: "${value['message'].toString()}");
        Get.offAll(
          OrderPlaced(
            isFromFuelOnTap: true,
            amount: "$messgae",
            order_id: "${value['order_id']}",
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
    Fluttertoast.showToast(msg: "Payment cancelled by user".tr);
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
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (profileController) {
          return GetBuilder<CarServiceController>(
              init: CarServiceController(),
              builder: (carController) {
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
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  body: Obx(() => carController.isLoading.value == true
                      ? Center(
                          child: Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Colors.white,
                            child: Text(
                              '     ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          child: carController
                                      .batterTyreCheckOut.value.status ==
                                  false
                              ? Container(
                                  child: Center(
                                      child: Text("No Vendors Available".tr)),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: otherCategory.shippingAddressId ==
                                                  null ||
                                              otherCategory.shippingAddressId ==
                                                  ""
                                          ? Container()
                                          : Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color.fromRGBO(
                                                    245, 245, 245, 1),
                                              ),
                                              // height: 105,
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              padding: const EdgeInsets.all(12),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Delivery Address'.tr,
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
                                                            '${carController.batterTyreCheckOut.value.data!.shippingAddressData!.contactPersonName},${carController.batterTyreCheckOut.value.data!.shippingAddressData!.zip}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.7,
                                                            child: Text(
                                                              '${carController.batterTyreCheckOut.value.data!.shippingAddressData!.building} ${carController.batterTyreCheckOut.value.data!.shippingAddressData!.landmark},${carController.batterTyreCheckOut.value.data!.shippingAddressData!.city}..',
                                                              style: const TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          118,
                                                                          118,
                                                                          128,
                                                                          1),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 24,
                                                        width: 57,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            color: colors
                                                                .primary
                                                                .withOpacity(
                                                                    .1),
                                                            border: Border.all(
                                                                color: colors
                                                                    .primary)),
                                                        child: Center(
                                                          child: Text(
                                                            '${carController.batterTyreCheckOut.value.data!.shippingAddressData!.addressType}',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: colors
                                                                  .primary,
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
                                                      width: MediaQuery.sizeOf(
                                                              context)
                                                          .width,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              color: colors
                                                                  .blackTemp)),
                                                      child: Center(
                                                          child: Text(
                                                        'Change or add new address'
                                                            .tr,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                              elevation:
                                                  0, // Remove the shadow effect
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(4),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10), // Ensure the image corners are rounded
                                                          child: Image.asset(
                                                              'assets/carwash.png')),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 2),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "${carController.batterTyreCheckOut.value.data!.product![0].name}",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(Icons
                                                                    .location_on),
                                                                SizedBox(
                                                                    width: 5),
                                                                Text(
                                                                  "${carController.batterTyreCheckOut.value.data!.product![0].name}",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black54,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              15),
                                                                  child: Text(
                                                                    "${AppConstants.currencySymbol} ${carController.batterTyreCheckOut.value.data!.product![0].unitPrice}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                                Container(
                                                                  height: 30,
                                                                  width: 70,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .grey
                                                                            .withOpacity(0.5),
                                                                        spreadRadius:
                                                                            1,
                                                                        blurRadius:
                                                                            10,
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
                                                                        size:
                                                                            18,
                                                                        color: Colors
                                                                            .orange,
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              5),
                                                                      Text(
                                                                        '2.2',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
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
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Booking Date",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    // "Mon,Aug 17",
                                                    "${Validator.convertDateString(carController.batterTyreCheckOut.value.data!.date.toString().substring(0, 10))}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${carController.batterTyreCheckOut.value.data!.product![0].name}",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${carController.batterTyreCheckOut.value.data!.vehicleModelName}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Service Type",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${carController.batterTyreCheckOut.value.data!.service}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Obx(() {
                                              return Container(
                                                  width: double.maxFinite,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: colors
                                                              .myCardColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 2,
                                                          child:
                                                              MyHintTextField(
                                                            isReadOnly:
                                                                carController
                                                                    .isApply
                                                                    .value,
                                                            hintText:
                                                                const Text(
                                                                    'Coupon'),
                                                            isActive: true,
                                                            controller:
                                                                couponController,
                                                          )),
                                                      Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: () {
                                                            if (carController
                                                                    .isApply
                                                                    .value ==
                                                                true) {
                                                              carController
                                                                      .isApply
                                                                      .value =
                                                                  false;
                                                              couponController
                                                                  .text = "";
                                                              carController
                                                                  .discountAmount
                                                                  .value = 0.0;
                                                            } else {
                                                              carController.applyCoupon(
                                                                  carController
                                                                      .batterTyreCheckOut!
                                                                      .value
                                                                      .data!
                                                                      .total
                                                                      .toString(),
                                                                  couponController
                                                                      .text);
                                                            }
                                                          },
                                                          child: Container(
                                                            height: 55,
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10)),
                                                                gradient: colors
                                                                    .buttonGradient),
                                                            child: Center(
                                                              child: carController
                                                                      .isLoadingcoupon
                                                                      .value
                                                                  ? const CircularProgressIndicator(
                                                                      color: colors
                                                                          .whiteTemp,
                                                                    )
                                                                  : Text(
                                                                      carController.isApply.value ==
                                                                              false
                                                                          ? 'Apply'
                                                                          : 'Remove',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              16,
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
                                              padding: const EdgeInsets.only(
                                                  top: 20, right: 250),
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
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Car Wash",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${AppConstants.currencySymbol} ${carController.batterTyreCheckOut.value.data!.product![0].unitPrice.toString()}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Service",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${AppConstants.currencySymbol} ${carController.batterTyreCheckOut.value.data!.serviceCharges.toString()}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Discount".tr,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${AppConstants.currencySymbol}${carController.discountAmount}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            Obx(() => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15,
                                                          right: 10,
                                                          top: 7),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Total Amount",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${AppConstants.currencySymbol} ${calculate(carController)}",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.lightGreen,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Divider(
                                              color: Colors.black54,
                                              thickness: 0.2,
                                              //indent: 5,
                                              // endIndent: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ] else if (otherCategory.categoryId ==
                                            "9" ||
                                        otherCategory.categoryId == "10") ...[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                        .width,
                                                color: colors.lightgray,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          top: 12,
                                                          bottom: 8),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        otherCategory
                                                                    .categoryId ==
                                                                "10"
                                                            ? "Car & Battery detail"
                                                                .tr
                                                            : 'Car & tyres detail'
                                                                .tr,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Vehicle Manufacture'
                                                                    .tr,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Text(
                                                                '${carController.batterTyreCheckOut.value.data!.vehicleTypeName}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                otherCategory
                                                                            .categoryId ==
                                                                        "10"
                                                                    ? "Battery"
                                                                        .tr
                                                                    : 'Tyres'
                                                                        .tr,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Text(
                                                                '${carController.batterTyreCheckOut.value.data!.productName}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 30,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Model'.tr,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Text(
                                                                '${carController.batterTyreCheckOut.value.data!.vehicleModelName}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                'Booking Date'
                                                                    .tr,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Text(
                                                                '${Validator.convertDateString(carController.batterTyreCheckOut.value.data!.date.toString().substring(0, 10))}',
                                                                // 'Mon, Aug 17',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
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
                                            Obx(() {
                                              return Container(
                                                  width: double.maxFinite,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: colors
                                                              .myCardColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 2,
                                                          child:
                                                              MyHintTextField(
                                                            isReadOnly:
                                                                carController
                                                                    .isApply
                                                                    .value,
                                                            hintText:
                                                                const Text(
                                                                    'Coupon'),
                                                            isActive: true,
                                                            controller:
                                                                couponController,
                                                          )),
                                                      Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: () {
                                                            if (carController
                                                                    .isApply
                                                                    .value ==
                                                                true) {
                                                              carController
                                                                      .isApply
                                                                      .value =
                                                                  false;
                                                              couponController
                                                                  .text = "";
                                                              carController
                                                                  .discountAmount
                                                                  .value = 0.0;
                                                            } else {
                                                              carController.applyCoupon(
                                                                  carController
                                                                      .batterTyreCheckOut!
                                                                      .value
                                                                      .data!
                                                                      .total
                                                                      .toString(),
                                                                  couponController
                                                                      .text);
                                                            }
                                                          },
                                                          child: Container(
                                                            height: 55,
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10)),
                                                                gradient: colors
                                                                    .buttonGradient),
                                                            child: Center(
                                                              child: carController
                                                                      .isLoadingcoupon
                                                                      .value
                                                                  ? const CircularProgressIndicator(
                                                                      color: colors
                                                                          .whiteTemp,
                                                                    )
                                                                  : Text(
                                                                      carController.isApply.value ==
                                                                              false
                                                                          ? 'Apply'
                                                                          : 'Remove',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              16,
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
                                              padding: EdgeInsets.only(
                                                  top: 10, right: 225),
                                              child: Text(
                                                "Price Detail".tr,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    otherCategory.categoryId ==
                                                            "10"
                                                        ? "Battery Price".tr
                                                        : "Tyres Price".tr,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "₹ ${carController.batterTyreCheckOut.value.data!.total}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Service".tr,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "₹ ${carController.batterTyreCheckOut.value.data!.serviceCharges}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Discount".tr,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${AppConstants.currencySymbol}${carController.discountAmount}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            Obx(() => Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15, right: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Total Amount".tr,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${AppConstants.currencySymbol}${calculate(carController)}",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            const Divider(
                                              // thickness: 2,
                                              color: Colors.black26,
                                              indent: 15,
                                              endIndent: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ] else if (otherCategory.categoryId ==
                                        "16") ...[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                        .width,
                                                color: colors.lightgray,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          top: 12,
                                                          bottom: 8),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Service'.tr,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Container(
                                                                width: 140,
                                                                child: Text(
                                                                  '${carController.batterTyreCheckOut.value.data!.service}',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                otherCategory
                                                                            .service_type ==
                                                                        "Tyres"
                                                                    ? "Tyres Type"
                                                                    : otherCategory.service_type ==
                                                                            "Jump Start"
                                                                        ? "Jump Start"
                                                                        : otherCategory.service_type ==
                                                                                "Towing(break down)"
                                                                            ? "Towing(break down)"
                                                                            : 'Fuel Type'.tr,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Text(
                                                                otherCategory
                                                                                .service_type ==
                                                                            "Tyres" ||
                                                                        otherCategory.service_type ==
                                                                            "Jump Start" ||
                                                                        otherCategory.service_type ==
                                                                            "Towing(break down)"
                                                                    ? "${carController.batterTyreCheckOut.value.data!.productName}"
                                                                    : '${carController.batterTyreCheckOut.value.data!.fuel_type}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 90,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Vehicle'.tr,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Text(
                                                                '${carController.batterTyreCheckOut.value.data!.vehicleTypeName}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                'Fuel Quantity'
                                                                    .tr,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Text(
                                                                '${carController.batterTyreCheckOut.value.data!.quantity.toString()}',
                                                                // 'Mon, Aug 17',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
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
                                            Obx(() {
                                              return Container(
                                                  width: double.maxFinite,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: colors
                                                              .myCardColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 2,
                                                          child:
                                                              MyHintTextField(
                                                            isReadOnly:
                                                                carController
                                                                    .isApply
                                                                    .value,
                                                            hintText:
                                                                const Text(
                                                                    'Coupon'),
                                                            isActive: true,
                                                            controller:
                                                                couponController,
                                                          )),
                                                      Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: () {
                                                            if (carController
                                                                    .isApply
                                                                    .value ==
                                                                true) {
                                                              carController
                                                                      .isApply
                                                                      .value =
                                                                  false;
                                                              couponController
                                                                  .text = "";
                                                              carController
                                                                  .discountAmount
                                                                  .value = 0.0;
                                                            } else {
                                                              carController.applyCoupon(
                                                                  carController
                                                                      .batterTyreCheckOut!
                                                                      .value
                                                                      .data!
                                                                      .total
                                                                      .toString(),
                                                                  couponController
                                                                      .text);
                                                            }
                                                          },
                                                          child: Container(
                                                            height: 55,
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10)),
                                                                gradient: colors
                                                                    .buttonGradient),
                                                            child: Center(
                                                              child: carController
                                                                      .isLoadingcoupon
                                                                      .value
                                                                  ? const CircularProgressIndicator(
                                                                      color: colors
                                                                          .whiteTemp,
                                                                    )
                                                                  : Text(
                                                                      carController.isApply.value ==
                                                                              false
                                                                          ? 'Apply'
                                                                          : 'Remove',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              16,
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
                                              padding: EdgeInsets.only(
                                                  top: 10, right: 225),
                                              child: Text(
                                                "Price Detail".tr,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    otherCategory.categoryId ==
                                                            "10"
                                                        ? "Battery Price".tr
                                                        : "Tyres Price".tr,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "₹ ${carController.batterTyreCheckOut.value.data!.total}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Service".tr,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "₹ ${carController.batterTyreCheckOut.value.data!.serviceCharges}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Discount".tr,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${AppConstants.currencySymbol}${carController.discountAmount}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            Obx(() => Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15, right: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Total Amount".tr,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${AppConstants.currencySymbol}${calculate(carController)}",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
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
                                                .batterTyreCheckOut
                                                .value
                                                .data!
                                                .product!
                                                .length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(
                                                  "Service Type".tr,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black),
                                                ),
                                                subtitle: Text(
                                                    "${carController.batterTyreCheckOut.value.data!.product![index].name}"),
                                              );
                                            },
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            color: colors.lightgray,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12, top: 8, bottom: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Scheduled Date and Time'
                                                        .tr,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    '${carController.batterTyreCheckOut.value.data!.timeSlot!.fromTime} to ${carController.batterTyreCheckOut.value.data!.timeSlot!.toTime}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    '${Validator.convertDateString(carController.batterTyreCheckOut.value.data!.date.toString().substring(0, 10))}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                            Obx(() {
                                              return Container(
                                                  width: double.maxFinite,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: colors
                                                              .myCardColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 2,
                                                          child:
                                                              MyHintTextField(
                                                            isReadOnly:
                                                                carController
                                                                    .isApply
                                                                    .value,
                                                            hintText:
                                                                const Text(
                                                                    'Coupon'),
                                                            isActive: true,
                                                            controller:
                                                                couponController,
                                                          )),
                                                      Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: () {
                                                            if (carController
                                                                    .isApply
                                                                    .value ==
                                                                true) {
                                                              carController
                                                                      .isApply
                                                                      .value =
                                                                  false;
                                                              couponController
                                                                  .text = "";
                                                              carController
                                                                  .discountAmount
                                                                  .value = 0.0;
                                                            } else {
                                                              carController.applyCoupon(
                                                                  carController
                                                                      .batterTyreCheckOut!
                                                                      .value
                                                                      .data!
                                                                      .total
                                                                      .toString(),
                                                                  couponController
                                                                      .text);
                                                            }
                                                          },
                                                          child: Container(
                                                            height: 55,
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10)),
                                                                gradient: colors
                                                                    .buttonGradient),
                                                            child: Center(
                                                              child: carController
                                                                      .isLoadingcoupon
                                                                      .value
                                                                  ? const CircularProgressIndicator(
                                                                      color: colors
                                                                          .whiteTemp,
                                                                    )
                                                                  : Text(
                                                                      carController.isApply.value ==
                                                                              false
                                                                          ? 'Apply'
                                                                          : 'Remove',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              16,
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
                                              padding: EdgeInsets.only(
                                                  top: 10, right: 225),
                                              child: Text(
                                                "Price Detail".tr,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "MRP (1 item)",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${AppConstants.currencySymbol} ${carController.batterTyreCheckOut.value.data!.subtotal}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Delivery free".tr,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${AppConstants.currencySymbol} ${carController.batterTyreCheckOut.value.data!.serviceCharges}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Discount".tr,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${AppConstants.currencySymbol}${carController.discountAmount}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            Obx(() => Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15, right: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Total Amount".tr,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${AppConstants.currencySymbol}${calculate(carController)}",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
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
                                    // carController.isLoading == true
                                    //     ? Center(
                                    //         child: CircularProgressIndicator(),
                                    //       )
                                    //     : Padding(
                                    //         padding: const EdgeInsets.all(10.0),
                                    //         child: Align(
                                    //           alignment: Alignment.centerRight,
                                    //           child: GestureDetector(
                                    //             child: MyButton(text: 'Checkout'.tr),
                                    //             onTap: () async {
                                    //               var data = await Navigator.push(
                                    //                   context,
                                    //                   MaterialPageRoute(
                                    //                       builder: (context) =>
                                    //                           PaymentScreenTree(
                                    //                             totalAmount: carController
                                    //                                 .batterTyreCheckOut
                                    //                                 .value
                                    //                                 .data!
                                    //                                 .total,
                                    //                           )));
                                    //
                                    //               if (data != null) {
                                    //                 if (data == "payment") {
                                    //                   openCheckout(carController
                                    //                       .batterTyreCheckOut
                                    //                       .value
                                    //                       .data!
                                    //                       .total
                                    //                       .toString());
                                    //                 } else if (data == "wallet") {
                                    //                   CarServiceController carController =
                                    //                       Get.find();
                                    //                   CheckOutRequest checkOutRequest =
                                    //                       CheckOutRequest();
                                    //                   checkOutRequest.categoryId =
                                    //                       otherCategory.categoryId;
                                    //                   checkOutRequest.vehicleType =
                                    //                       otherCategory.vehicleType;
                                    //                   checkOutRequest.vehicleModel =
                                    //                       otherCategory.vehicleModel;
                                    //                   checkOutRequest.tyreSize =
                                    //                       otherCategory.tyreSize;
                                    //                   checkOutRequest.timeSlotId =
                                    //                       otherCategory.timeSlotId;
                                    //                   checkOutRequest.date =
                                    //                       otherCategory.date;
                                    //                   checkOutRequest.notes =
                                    //                       otherCategory.notes;
                                    //                   checkOutRequest.service =
                                    //                       otherCategory.service;
                                    //                   checkOutRequest.productId =
                                    //                       otherCategory.productId;
                                    //                   checkOutRequest.shippingAddressId =
                                    //                       otherCategory.shippingAddressId;
                                    //                   checkOutRequest
                                    //                           .billingSameAsShipping =
                                    //                       otherCategory
                                    //                           .billingSameAsShipping;
                                    //                   checkOutRequest.billingAddressId =
                                    //                       otherCategory.billingAddressId;
                                    //                   checkOutRequest.payment_method =
                                    //                       "wallet";
                                    //                   checkOutRequest.wallet_used =
                                    //                       "${carController.batterTyreCheckOut.value.data!.total}";
                                    //                   // checkOutRequest.wallet_used = "";
                                    //                   checkOutRequest.transaction_id = "";
                                    //                   checkOutRequest.quantity =
                                    //                       otherCategory.quantity ?? "1";
                                    //                   checkOutRequest.fuel_type =
                                    //                       otherCategory.fuel_type;
                                    //                   checkOutRequest.service_type =
                                    //                       otherCategory.service_type;
                                    //                   carController.PlaceOtherCatOrder(
                                    //                           checkOutRequest)
                                    //                       .then((value) {
                                    //                     if (value['status'] == true) {
                                    //                       Fluttertoast.showToast(
                                    //                           msg:
                                    //                               "${value['message'].toString()}");
                                    //                       Get.offAll(
                                    //                         OrderPlaced(
                                    //                           isFromFuelOnTap: true,
                                    //                           amount:
                                    //                               "${value['message'].toString()}",
                                    //                           order_id:
                                    //                               "${value['order_id']}",
                                    //                         ),
                                    //                       );
                                    //                     } else {
                                    //                       Fluttertoast.showToast(
                                    //                           msg: "${value['message']}");
                                    //                     }
                                    //                   });
                                    //                 } else {
                                    //                   CarServiceController carController =
                                    //                       Get.find();
                                    //                   CheckOutRequest checkOutRequest =
                                    //                       CheckOutRequest();
                                    //                   checkOutRequest.categoryId =
                                    //                       otherCategory.categoryId;
                                    //                   checkOutRequest.vehicleType =
                                    //                       otherCategory.vehicleType;
                                    //                   checkOutRequest.vehicleModel =
                                    //                       otherCategory.vehicleModel;
                                    //                   checkOutRequest.tyreSize =
                                    //                       otherCategory.tyreSize;
                                    //                   checkOutRequest.timeSlotId =
                                    //                       otherCategory.timeSlotId;
                                    //                   checkOutRequest.date =
                                    //                       otherCategory.date;
                                    //                   checkOutRequest.notes =
                                    //                       otherCategory.notes;
                                    //                   checkOutRequest.service =
                                    //                       otherCategory.service;
                                    //                   checkOutRequest.productId =
                                    //                       otherCategory.productId;
                                    //                   checkOutRequest.shippingAddressId =
                                    //                       otherCategory.shippingAddressId;
                                    //                   checkOutRequest
                                    //                           .billingSameAsShipping =
                                    //                       otherCategory
                                    //                           .billingSameAsShipping;
                                    //                   checkOutRequest.billingAddressId =
                                    //                       otherCategory.billingAddressId;
                                    //                   checkOutRequest.payment_method =
                                    //                       "cod";
                                    //                   checkOutRequest.wallet_used = "";
                                    //                   checkOutRequest.wallet_used = "";
                                    //                   checkOutRequest.transaction_id = "";
                                    //                   checkOutRequest.quantity =
                                    //                       otherCategory.quantity ?? "1";
                                    //                   checkOutRequest.fuel_type =
                                    //                       otherCategory.fuel_type;
                                    //                   checkOutRequest.service_type =
                                    //                       otherCategory.service_type;
                                    //                   carController.PlaceOtherCatOrder(
                                    //                           checkOutRequest)
                                    //                       .then((value) {
                                    //                     if (value['status'] == true) {
                                    //                       Fluttertoast.showToast(
                                    //                           msg:
                                    //                               "${value['message'].toString()}");
                                    //                       Get.offAll(
                                    //                         OrderPlaced(
                                    //                           isFromFuelOnTap: true,
                                    //                           amount:
                                    //                               "${value['message'].toString()}",
                                    //                           order_id:
                                    //                               "${value['order_id']}",
                                    //                         ),
                                    //                       );
                                    //                     } else {
                                    //                       Fluttertoast.showToast(
                                    //                           msg: "${value['message']}");
                                    //                     }
                                    //                   });
                                    //                 }
                                    //               }
                                    //
                                    //               // Navigator.push(
                                    //               //     context,
                                    //               //     MaterialPageRoute(
                                    //               //         builder: (context) =>
                                    //               //             const PaymentScreenTree()));
                                    //             },
                                    //           ),
                                    //         ),
                                    //       ),
                                  ],
                                ),
                        )),
                  floatingActionButton:
                      GetBuilder<CartController>(builder: (controller) {
                    return GetBuilder<CarServiceController>(
                        init: CarServiceController(),
                        builder: (carController) {
                          return Obx(() => carController.isLoading == true
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: GestureDetector(
                                    child: MyButton(text: 'Checkout'.tr),
                                    onTap: () async {
                                      var data = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentScreenTree(
                                                      totalAmount: calculate(
                                                              carController)
                                                          .toString())));
                                      // carController
                                      //     .batterTyreCheckOut
                                      //     .value
                                      //     .data!
                                      //     .total,
                                      if (data != null) {
                                        if (data == "payment") {
                                          controller
                                              .cashFree(
                                                  profileController
                                                      .userInfoModel.value.fName
                                                      .toString(),
                                                  profileController
                                                      .userInfoModel.value.email
                                                      .toString(),
                                                  profileController
                                                      .userInfoModel.value.phone
                                                      .toString(),
                                                  controller.checkOutModel.value
                                                          .total
                                                          .toString()
                                                          .replaceAll(
                                                              ",", "") ??
                                                      '100',
                                                  profileController
                                                      .userInfoModel.value.id
                                                      .toString())
                                              .then((value) {
                                            if (value['status'] == true) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Please wait for payment");
                                              CashFreeHelper cashFreeHelper =
                                                  CashFreeHelper(
                                                value['data']['response']
                                                    ['order_id'],
                                                context,
                                                value['data']['response']
                                                    ['payment_session_id'],
                                                (value) {
                                                  if (value != "error") {
                                                    CarServiceController
                                                        carController =
                                                        Get.find();
                                                    CheckOutRequest
                                                        checkOutRequest =
                                                        CheckOutRequest();
                                                    checkOutRequest.categoryId =
                                                        otherCategory
                                                            .categoryId;
                                                    checkOutRequest
                                                            .vehicleType =
                                                        otherCategory
                                                            .vehicleType;
                                                    checkOutRequest
                                                            .vehicleModel =
                                                        otherCategory
                                                            .vehicleModel;
                                                    checkOutRequest.tyreSize =
                                                        otherCategory.tyreSize;
                                                    checkOutRequest.timeSlotId =
                                                        otherCategory
                                                            .timeSlotId;
                                                    checkOutRequest.date =
                                                        otherCategory.date;
                                                    checkOutRequest.notes =
                                                        otherCategory.notes;
                                                    checkOutRequest.service =
                                                        otherCategory.service;
                                                    checkOutRequest.productId =
                                                        otherCategory.productId;
                                                    checkOutRequest
                                                            .shippingAddressId =
                                                        otherCategory
                                                            .shippingAddressId;
                                                    checkOutRequest
                                                            .billingSameAsShipping =
                                                        otherCategory
                                                            .billingSameAsShipping;
                                                    checkOutRequest
                                                            .billingAddressId =
                                                        otherCategory
                                                            .billingAddressId;
                                                    checkOutRequest
                                                            .payment_method =
                                                        "cashfree";
                                                    checkOutRequest
                                                        .wallet_used = "";
                                                    checkOutRequest
                                                        .wallet_used = "";
                                                    checkOutRequest
                                                            .transaction_id =
                                                        "${value['data']['response']['order_id']}";
                                                    checkOutRequest.quantity =
                                                        otherCategory
                                                                .quantity ??
                                                            "1";
                                                    checkOutRequest.fuel_type =
                                                        otherCategory.fuel_type;
                                                    checkOutRequest
                                                            .service_type =
                                                        otherCategory
                                                            .service_type;
                                                    checkOutRequest
                                                            .coupan_discount_amount =
                                                        carController
                                                            .discountAmount
                                                            .toString();
                                                    carController
                                                            .PlaceOtherCatOrder(
                                                                checkOutRequest)
                                                        .then((value) {
                                                      if (value['status'] ==
                                                          true) {
                                                        String messgae =
                                                            "${value['message'].toString()}";
                                                        print(
                                                            "object sdsdsdsd${value['message'].toString()}");
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "${value['message'].toString()}");
                                                        Get.offAll(
                                                          OrderPlaced(
                                                            isFromFuelOnTap:
                                                                true,
                                                            amount: "$messgae",
                                                            order_id:
                                                                "${value['order_id']}",
                                                          ),
                                                        );
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "${value['message']}");
                                                      }
                                                    });
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'Something went wrong');
                                                  }
                                                },
                                              );

                                              cashFreeHelper.init();
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: value['message']);
                                            }
                                          });
                                          // openCheckout(carController
                                          //     .batterTyreCheckOut.value.data!.total
                                          //     .toString());
                                        } else if (data == "wallet") {
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
                                          checkOutRequest.date =
                                              otherCategory.date;
                                          checkOutRequest.notes =
                                              otherCategory.notes;
                                          checkOutRequest.service =
                                              otherCategory.service;
                                          checkOutRequest.productId =
                                              otherCategory.productId;
                                          checkOutRequest.shippingAddressId =
                                              otherCategory.shippingAddressId;
                                          checkOutRequest
                                                  .billingSameAsShipping =
                                              otherCategory
                                                  .billingSameAsShipping;
                                          checkOutRequest.billingAddressId =
                                              otherCategory.billingAddressId;
                                          checkOutRequest.payment_method =
                                              "wallet";
                                          checkOutRequest.wallet_used =
                                              "${carController.batterTyreCheckOut.value.data!.total}";
                                          // checkOutRequest.wallet_used = "";
                                          checkOutRequest.transaction_id = "";
                                          checkOutRequest.quantity =
                                              otherCategory.quantity ?? "1";
                                          checkOutRequest.fuel_type =
                                              otherCategory.fuel_type;
                                          checkOutRequest.service_type =
                                              otherCategory.service_type;
                                          checkOutRequest
                                                  .coupan_discount_amount =
                                              carController.discountAmount
                                                  .toString();
                                          carController.PlaceOtherCatOrder(
                                                  checkOutRequest)
                                              .then((value) {
                                            if (value['status'] == true) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "${value['message'].toString()}");
                                              Get.offAll(
                                                OrderPlaced(
                                                  isFromFuelOnTap: true,
                                                  amount:
                                                      "${value['message'].toString()}",
                                                  order_id:
                                                      "${value['order_id']}",
                                                ),
                                              );
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "${value['message']}");
                                            }
                                          });
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
                                          checkOutRequest.date =
                                              otherCategory.date;
                                          checkOutRequest.notes =
                                              otherCategory.notes;
                                          checkOutRequest.service =
                                              otherCategory.service;
                                          checkOutRequest.productId =
                                              otherCategory.productId;
                                          checkOutRequest.shippingAddressId =
                                              otherCategory.shippingAddressId;
                                          checkOutRequest
                                                  .billingSameAsShipping =
                                              otherCategory
                                                  .billingSameAsShipping;
                                          checkOutRequest.billingAddressId =
                                              otherCategory.billingAddressId;
                                          checkOutRequest.payment_method =
                                              "cod";
                                          checkOutRequest.wallet_used = "";
                                          checkOutRequest.wallet_used = "";
                                          checkOutRequest.transaction_id = "";
                                          checkOutRequest.quantity =
                                              otherCategory.quantity ?? "1";
                                          checkOutRequest.fuel_type =
                                              otherCategory.fuel_type;
                                          checkOutRequest.service_type =
                                              otherCategory.service_type;
                                          checkOutRequest
                                                  .coupan_discount_amount =
                                              carController.discountAmount
                                                  .toString();
                                          carController.PlaceOtherCatOrder(
                                                  checkOutRequest)
                                              .then((value) {
                                            if (value['status'] == true) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "${value['message'].toString()}");
                                              Get.offAll(
                                                OrderPlaced(
                                                  isFromFuelOnTap: true,
                                                  amount:
                                                      "${value['message'].toString()}",
                                                  order_id:
                                                      "${value['order_id']}",
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
                                ));
                        });
                  }),
                );
              });
        });
  }

  double calculate(CarServiceController carController) {
    double? one = double.tryParse(carController
            .batterTyreCheckOut.value.data!.total
            ?.replaceAll(",", "") ??
        "0.0");
    double? two =
        double.tryParse(carController.discountAmount.value.toString() ?? "0.0");
    return one! - two!;
  }
}
