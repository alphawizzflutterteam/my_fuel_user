import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/all_orders_model.dart';
import '../data/model/order_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class OrderController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  var orderModel = OrderListModel().obs;

  RxList<Orders> ordersList = <Orders>[].obs;


  var searchOrderText = ''.obs;
  var index=0.obs;
  var allOrderModel = AllOrdersModel().obs;
  RxList<OrderTypeList> allOrdersList = <OrderTypeList>[].obs;
  RxList<OrderTypeList> tempAllOrdersList = <OrderTypeList>[].obs;
  TextEditingController search=TextEditingController();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getOrders();
    debounce(
      searchOrderText,
          (_) => searchOrder(searchOrderText.value),
      time: Duration(seconds: 1),
    );
  }



  searchOrder(String value) {

    print('llll');
    final suggestions = tempAllOrdersList[index.value].bookings?.where((element) {
      final username = element.id.toString().toLowerCase();
      final input = value.toLowerCase();
      return username!.contains(input)/* || mobile.contains(input) ||  firmName.contains(input)*/;
    }).toList();
    allOrdersList[index.value].bookings= suggestions!;

    update();
  }
  Future<void> getOrders() async {
    Map<String, dynamic> data = await _laravelApiClient.getOrders();

    allOrderModel(AllOrdersModel.fromJson(data));
    // list.value = response;
    allOrdersList.value = allOrderModel.value.orderTypeList!;
    tempAllOrdersList=allOrdersList;
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
  Future<void> submitReview(String type, String comment, String orderID,double rating) async {
    Map<String, dynamic> data = await _laravelApiClient.submitReview( type,  comment,  orderID,rating);

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
