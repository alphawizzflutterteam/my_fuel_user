import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/data/model/order_fuel_check_out_model.dart';
import 'package:test_prj/data/model/vendors_model.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/order_fuel_controller.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/vendor_controller.dart';
import 'package:test_prj/payment/pay_success_page.dart';

class OrderFuelCheckoutController extends AppBaseController {
  RxBool isLoading = false.obs;

  final vendorController = Get.find<VendorController>();
  final orderFuelController = Get.find<OrderFuelController>();
  OrderFuelCheckData? orderFuelCheckData;
  String? productId;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    productId = Get.arguments;
    getOrderFuelCheckoutData();
  }

  Future<void> getOrderFuelCheckoutData() async {
    isLoading.value = true;
    OrderFuelCheckOutModel response =
        await orderFuelRepo.orderFuelCheckOutDetailApi(
            date: vendorController.argument['date'].toString(),
            billing: '',
            shipping: '',
            slotId: vendorController.argument['selectedSlot'].toString(),
            serviceType: orderFuelController.selectedIndex.value == 0
                ? 'Door Step'
                : 'At Your Station',
            categoryId: vendorController.orderFuelController.selectedData!.id
                .toString(),
            vehicleType: vendorController.argument['vehicleType'].toString(),
            note: '',
            isBillingSameAsShipping: '1',
            vehicleModel: '',
            tyreSize: '',
            productId: productId ?? '');

    orderFuelCheckData = response.data;
    isLoading.value = false;
  }

  Future<void> placeBooking(
      String transactionId, String paymentType, String wallet) async {
    Map response = await orderFuelRepo.placeOrderFuelCheckOutApi(
        date: vendorController.argument['date'].toString(),
        billing: '',
        shipping: '',
        slotId: vendorController.argument['selectedSlot'].toString(),
        serviceType: orderFuelController.selectedIndex.value == 0
            ? 'Door Step'
            : 'At your station',
        categoryId:
            vendorController.orderFuelController.selectedData!.id.toString(),
        vehicleType: vendorController.argument['vehicleType'].toString(),
        note: '',
        isBillingSameAsShipping: '1',
        vehicleModel: '',
        tyreSize: '',
        productId: productId ?? '',
        quantity: vendorController.argument['quantity'],
        transactionId: transactionId,
        paymentMethod: paymentType,
        walletUsed: wallet);

    if (response['status']) {
      Get.to(OrderPlaced(
        amount: response['order_id'],
      ));
    }

    isLoading.value = false;
  }
}
