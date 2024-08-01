import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:test_prj/orderfuel/repository/order_fuel_repository.dart';
import 'package:test_prj/service/provider/lavavel_provider.dart';

class AppBaseController extends GetxController {
  LaravelApiClient laravelApiClient = Get.find<LaravelApiClient>();
  OrderFuelRepo orderFuelRepo = Get.find<OrderFuelRepo>();
  final GetStorage box = GetStorage();

  Widget loader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  String formatDate(DateTime dateTime, String dateFormat) {
    final DateFormat formatter = DateFormat(dateFormat);
    // Format the DateTime object
    return formatter.format(dateTime);
  }

// Observable variable to store API response
}
