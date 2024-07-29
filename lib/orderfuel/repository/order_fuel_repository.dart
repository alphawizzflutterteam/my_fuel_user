import 'dart:convert';

import 'package:test_prj/data/model/OrderFuelModel.dart';
import 'package:test_prj/data/model/TimeSlotModel.dart';
import 'package:test_prj/data/model/VehicleType.dart';
import 'package:test_prj/data/model/vendors_model.dart';
import 'package:test_prj/helper/utils/app_constants.dart';
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
      throw Exception(response.data['message']);
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
      throw Exception(response.data['message']);
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
      throw Exception(response.data['message']);
    }
  }

  Future<VendorsModel> getVendor(
      {required String id,
      required String serviceType,
      required String slotId,
      required String date,
      required String quantity,
      required String shipping,
      required String billing}) async {
    var response = await httpClient.post(
      '/api/v1/customer/order/service-vendor',
      data: jsonEncode({
        "service_id": "",
        'service_type': '',
        'slot_id': '',
        'date': '',
        'asset_id': '',
        "quantity": '',
        'shipping_address_id': '',
        'billing_address_id': ''
      }),
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      return VendorsModel.fromJson(json.decode(response.toString()));
    } else {
      throw Exception(response.data['message']);
    }
  }
}
