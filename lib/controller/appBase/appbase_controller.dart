import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_prj/data/model/response/setting_model.dart';
import 'package:test_prj/service/provider/lavavel_provider.dart';

import '../../orderfuel/doorStepDelivery/repository/order_fuel_repository.dart';

class AppBaseController extends GetxController {
  LaravelApiClient laravelApiClient = Get.find<LaravelApiClient>();
  OrderFuelRepo orderFuelRepo = Get.find<OrderFuelRepo>();
  final GetStorage box = GetStorage();

// Observable variable to store API response
}
