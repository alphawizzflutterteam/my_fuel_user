import 'dart:developer';

import 'package:get/get.dart';
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
            categoryId: vendorController.orderFuelController.selectedData!.id
                .toString(),
            vehicleType: vendorController.argument['vehicleType'].toString(),
            note: '',
            isBillingSameAsShipping: otherCategory.billingSameAsShipping ?? '1',
            vehicleModel: '',
            tyreSize: '',
            productId: productId ?? '',
            vendorId: vendorId ?? '',
            quantity: vendorController.argument['quantity'].toString());

    orderFuelCheckData = response.data;
    isLoading.value = false;
  }

  Future<void> placeBooking(
      String transactionId, String paymentType, String wallet) async {
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
        assetId: vendorController.argument['assetId'] ?? '');

    if (response['status']) {
      Get.to(OrderPlaced(
        amount: response['message'],
        order_id: "${response['order_id']}",
      ));
    }

    isLoading.value = false;
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
}
