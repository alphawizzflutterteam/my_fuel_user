import 'dart:convert';

import 'package:test_prj/data/model/OrderFuelModel.dart';
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
}
