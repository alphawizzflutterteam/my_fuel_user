import 'dart:convert';
import 'dart:developer';

import 'package:test_prj/data/model/OrderFuelModel.dart';
import 'package:test_prj/data/model/TimeSlotModel.dart';
import 'package:test_prj/data/model/VehicleType.dart';
import 'package:test_prj/data/model/order_fuel_check_out_model.dart';
import 'package:test_prj/data/model/vendors_model.dart';
import 'package:test_prj/helper/utils/app_constants.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/order_fuel_checkout.dart';
import 'package:test_prj/service/provider/api_provider.dart';
import 'package:get/get.dart';

class OrderFuelRepo extends GetxService with ApiClient {
  OrderFuelRepo() {
    baseUrl = AppConstants.baseUrl;
  }

  @override
  Future<OrderFuelRepo> init() async {
    super.init();
    return this;
  }

  Future<OrderFuelModel> getOrderFuelServices() async {
    var response = await httpClient.get(
      '/api/v1/customer/order/service-list',
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      return OrderFuelModel.fromJson(json.decode(response.toString()));
    } else {
      throw Exception(response.orderTypeList['message']);
    }
  }

  Future<VehicleType> getVehicleType() async {
    var response = await httpClient.get(
      '/api/v1/customer/order/vehicle-type',
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      return VehicleType.fromJson(json.decode(response.toString()));
    } else {
      throw Exception(response.orderTypeList['message']);
    }
  }

  Future<TimeSlotModel> getTimeSlotApi() async {
    var response = await httpClient.get(
      '/api/v1/customer/order/time-slots',
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      return TimeSlotModel.fromJson(json.decode(response.toString()));
    } else {
      throw Exception(response.orderTypeList['message']);
    }
  }

  Future<VendorsModel> getVendor(
      {required String id,
      required String serviceType,
      required String slotId,
      required String date,
      required String quantity,
      required String shipping,
      required String billing,
      required String assetId,
      required String vehicleType}) async {
    var response = await httpClient.post(
      '/api/v1/customer/order/service-vendor',
      data: jsonEncode({
        "service_id": id,
        'service_type': serviceType,
        'slot_id': slotId,
        'date': date,
        'asset_id': assetId,
        'vehicle_type': vehicleType,
        'quantity': quantity,
        'shipping_address_id': shipping,
        'billing_address_id': billing
      }),
      options: optionsNetwork,
    );
    log('${response.data}');
    if (response.statusCode == 200) {
      return VendorsModel.fromJson(json.decode(response.toString()));
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<OrderFuelCheckOutModel> orderFuelCheckOutDetailApi({
    required String categoryId,
    required String serviceType,
    required String slotId,
    required String date,
    required String note,
    required String shipping,
    required String billing,
    required String isBillingSameAsShipping,
    required String vehicleType,
    required String vehicleModel,
    required String tyreSize,
    required String productId,
  }) async {
    var response = await httpClient.post(
      '/api/v1/customer/order/vendor-checkout',
      data: jsonEncode({
        "category_id": categoryId,
        'vehicle_type': vehicleType,
        'vehicle_model': vehicleModel,
        'tyre_size': tyreSize,
        'time_slot_id': slotId,
        'date': date,
        'service': serviceType,
        'notes': note,
        'product_id': productId,
        'shipping_address_id': shipping,
        'billing_address_id': billing,
        'billing_same_as_shipping': isBillingSameAsShipping
      }),
      options: optionsNetwork,
    );

    if (response.statusCode == 200) {
      return OrderFuelCheckOutModel.fromJson(json.decode(response.toString()));
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map> placeOrderFuelCheckOutApi({
    required String categoryId,
    required String serviceType,
    required String slotId,
    required String date,
    required String note,
    required String shipping,
    required String billing,
    required String isBillingSameAsShipping,
    required String vehicleType,
    required String vehicleModel,
    required String tyreSize,
    required String productId,
    required String paymentMethod,
    required String transactionId,
    required String quantity,
    required String walletUsed,
  }) async {
    var response = await httpClient.post(
      '/api/v1/customer/order/confirm-vendor-service',
      data: jsonEncode({
        "category_id": categoryId,
        'vehicle_type': vehicleType,
        'vehicle_model': vehicleModel,
        'tyre_size': tyreSize,
        'time_slot_id': slotId,
        'date': date,
        'service': serviceType,
        'notes': note,
        'product_id': productId,
        'shipping_address_id': shipping,
        'billing_address_id': billing,
        'billing_same_as_shipping': isBillingSameAsShipping,
        'payment_method': paymentMethod,
        'wallet_used': walletUsed,
        'transaction_id': transactionId,
        'quantity': quantity
      }),
      options: optionsNetwork,
    );

    if (response.statusCode == 200) {
      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }
}
