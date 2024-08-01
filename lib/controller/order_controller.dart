import 'package:get/get.dart';

import '../data/model/all_orders_model.dart';
import '../data/model/order_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class OrderController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  var orderModel = OrderListModel().obs;

  RxList<Orders> ordersList = <Orders>[].obs;



  var allOrderModel = AllOrdersModel().obs;
  RxList<OrderTypeList> allOrdersList = <OrderTypeList>[].obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getOrders();
  }

  Future<void> getOrders() async {
    Map<String, dynamic> data = await _laravelApiClient.getOrders();

    allOrderModel(AllOrdersModel.fromJson(data));
    // list.value = response;
    allOrdersList.value = allOrderModel.value.orderTypeList!;
    print("getBanner ${orderModel.value}");

    update();
  }


  Future<void> updateOrder(String status, String remark, String orderID) async {
    Map<String, dynamic> data = await _laravelApiClient.updateOrder( status,  remark,  orderID);

    allOrderModel(AllOrdersModel.fromJson(data));
    // list.value = response;
    allOrdersList.value = allOrderModel.value.orderTypeList!;
    print("getBanner ${orderModel.value}");

    update();
  }
  // Future<void> getOrders() async {
  //   Map<String, dynamic> data = await _laravelApiClient.getOrders();
  //
  //   orderModel(OrderListModel.fromJson(data));
  //   // list.value = response;
  //   ordersList.value = orderModel.value.orders!;
  //   print("getBanner ${orderModel.value}");
  // }
}
