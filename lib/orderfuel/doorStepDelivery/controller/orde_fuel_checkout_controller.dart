import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/data/model/order_fuel_check_out_model.dart';
import 'package:test_prj/home_page.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/order_fuel_controller.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/vendor_controller.dart';
import 'package:test_prj/payment/pay_success_page.dart';

class OrderFuelCheckoutController extends AppBaseController {
  RxBool isLoading = false.obs;

  final orderFuelController = Get.find<OrderFuelController>();
  var vendorController;

  OrderFuelCheckData? orderFuelCheckData;
  String? productId;
  String? vendorId;
  Map? data;
  RxBool isApply = false.obs;
  RxBool isLoadingcoupon = false.obs;

  /// Check
  /// Payment id and Order id
  String paymentId = "";
  String orderId = "";
  RxDouble discountAmount = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isApply.value = false;
    isLoadingcoupon.value = false;
    if (Get.isRegistered<VendorController>()) {
      vendorController = Get.find<VendorController>();
    } else {
      vendorController = Get.put(VendorController());
    }

    productId = Get.arguments[0];
    vendorId = Get.arguments[1];
    getOrderFuelCheckoutData();
  }

  Future<void> getOrderFuelCheckoutData() async {
    isLoading.value = true;
    OrderFuelCheckOutModel response =
        await orderFuelRepo.orderFuelCheckOutDetailApi(
      date: vendorController.argument['date'].toString(),
      billing: otherCategory.billingAddressId ?? '',
      shipping: otherCategory.shippingAddressId ?? '',
      slotId: vendorController.argument['selectedSlot'].toString(),
      serviceType: orderFuelController.selectedIndex.value == 0
          ? 'Door Step'
          : 'At your station',
      categoryId:
          vendorController.orderFuelController.selectedData!.id.toString(),
      vehicleType: vendorController.argument['vehicleType'].toString(),
      note: '',
      isBillingSameAsShipping: otherCategory.billingSameAsShipping ?? '1',
      vehicleModel: '',
      tyreSize: '',
      productId: productId ?? '',
      vendorId: vendorId ?? '',
      quantity: vendorController.argument['quantity'].toString(),
    );

    orderFuelCheckData = response.data;
    isLoading.value = false;
  }

  Future<void> placeBooking(String transactionId, String paymentType,
      String wallet, String discountAmount) async {
    Map response = await orderFuelRepo.placeOrderFuelCheckOutApi(
        date: vendorController.argument['date'].toString(),
        billing: otherCategory.billingAddressId ?? '',
        shipping: otherCategory.shippingAddressId ?? '',
        slotId: vendorController.argument['selectedSlot'].toString(),
        serviceType: orderFuelController.selectedIndex.value == 0
            ? 'Door Step'
            : 'At your station',
        categoryId:
            vendorController.orderFuelController.selectedData!.id.toString(),
        vehicleType: vendorController.argument['vehicleType'].toString(),
        note: '',
        isBillingSameAsShipping: otherCategory.billingSameAsShipping ?? '1',
        vehicleModel: '',
        tyreSize: '',
        productId: productId ?? '',
        quantity: vendorController.argument['quantity'],
        transactionId: transactionId,
        paymentMethod: paymentType,
        walletUsed: wallet,
        vendorId: vendorId ?? '',
        assetId: vendorController.argument['assetId'] ?? '',
        discount: discountAmount ?? '');

    if (response['status']) {
      Get.to(OrderPlaced(
        amount: response['message'],
        order_id: "${response['order_id']}",
      ));
    }

    isLoading.value = false;
  }

  Future<Map> cashFree(String name, String email, String mobile, String amount,
      String id) async {
    isLoading(true);
    Map response =
        await orderFuelRepo.getPaymentId(name, email, mobile, amount, id);
    isLoading(false);
    if (response['status']) {
      // Get.to(OrderPlaced(
      //   amount: response['message'],
      //   order_id: "${response['order_id']}",
      // ));
    }

    isLoading.value = false;
    return response;
  }

  Future<void> getOrderFuelCheckoutForEvData() async {
    isLoading.value = true;
    OrderFuelCheckOutModel response =
        await orderFuelRepo.orderFuelCheckOutDetailApi(
            date: data?['date'].toString() ?? '',
            billing: otherCategory.billingAddressId ?? '',
            shipping: otherCategory.shippingAddressId ?? '',
            slotId: data?['date']['selectedSlot'].toString() ?? '',
            serviceType: orderFuelController.selectedIndex.value == 0
                ? 'Door Step'
                : 'At your station',
            categoryId: vendorController.orderFuelController.selectedData!.id
                .toString(),
            vehicleType: '',
            note: '',
            isBillingSameAsShipping: otherCategory.billingSameAsShipping ?? '1',
            vehicleModel: '',
            tyreSize: '',
            productId: productId ?? '',
            vendorId: vendorId ?? '',
            quantity: data?['date']['quantity'].toString() ?? '1');

    orderFuelCheckData = response.data;
    isLoading.value = false;
  }

  Future<void> applyCoupon(String amount, String coupon) async {
    isApply.value = true;
    isLoadingcoupon.value = true;
    Map response = await orderFuelRepo.applyCoupon(amount, coupon);

    if (response['status']) {
      discountAmount.value =
          double.parse(response['coupon_discount'].toString());

      Fluttertoast.showToast(msg: response['message']);
      isLoadingcoupon.value = false;
      isApply.value = true;
    } else {
      Fluttertoast.showToast(msg: response['message']);
      isLoadingcoupon.value = false;
      isApply.value = false;
    }
  }
}
