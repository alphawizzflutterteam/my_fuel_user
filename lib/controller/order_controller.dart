import 'package:get/get.dart';

import '../data/model/order_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class OrderController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  var orderModel = OrderListModel().obs;

  RxList<Orders> ordersList = <Orders>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getOrders();
  }

  Future<void> getOrders() async {
    Map<String, dynamic> data = await _laravelApiClient.getOrders();

    orderModel(OrderListModel.fromJson(data));
    // list.value = response;
    ordersList.value = orderModel.value.orders!;
    print("getBanner ${orderModel.value}");
  }
}
