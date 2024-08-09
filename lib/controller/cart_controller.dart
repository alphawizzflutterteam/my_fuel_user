import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../data/model/senset_checkoutmodel.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class CartController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  String address_id = "";
  String category_id = "";
  RxBool isApply = false.obs;
  RxBool isLoadingcoupon = false.obs;
  RxDouble discountAmount = 0.0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isApply.value = false;
    isLoadingcoupon.value = false;
    initUI();
  }

  void initUI() {
    final arguments = Get.arguments ?? {};

    print("arguments ${arguments} ");
    address_id = arguments['address_id'].toString();
    category_id = arguments['category_id'].toString();

    manageCart(address_id, category_id);
    update();
  }

  RxBool isLoading = false.obs;
  var checkOutModel = GenSetCheckOutModel().obs;
  Future<Map<String, dynamic>> AddTocart(String ids) async {
    isLoading(true);

    Map<String, dynamic> value = await _laravelApiClient.AddToCart(ids);
    if (value.containsKey("errors")) {
      Fluttertoast.showToast(msg: "$value");
    } else if (value['token'] != "") {}
    isLoading(false);
    return value;
  }

  Future<Map<String, dynamic>> manageCart(
      String address_id, String category_id) async {
    isLoading(true);

    Map<String, dynamic> value =
        await _laravelApiClient.ManageCart(address_id, category_id);

    checkOutModel(GenSetCheckOutModel.fromJson(value));

    isLoading(false);
    return value;
  }

  Future<void> applyCoupon(String amount, String coupon) async {
    isApply.value = true;
    isLoadingcoupon.value = true;
    Map response = await orderFuelRepo.applyCoupon(amount, coupon);

    if (response['status']) {
      discountAmount.value =
          double.parse(response['coupon_discount'].toString());

      Fluttertoast.showToast(msg: response['message']);
      isLoadingcoupon.value = false;
      isApply.value = true;
    } else {
      Fluttertoast.showToast(msg: response['message']);
      isLoadingcoupon.value = false;
      isApply.value = false;
    }
  }

  Future<Map> cashFree(String name, String email, String mobile, String amount,
      String id) async {
    isLoading(true);
    Map response =
        await orderFuelRepo.getPaymentId(name, email, mobile, amount, id);
    isLoading(false);
    if (response['status']) {
      // Get.to(OrderPlaced(
      //   amount: response['message'],
      //   order_id: "${response['order_id']}",
      // ));
    }

    isLoading.value = false;
    return response;
  }

  Future<Map<String, dynamic>> placeOrder(
      String address_id, String paymentType, String wallet) async {
    isLoading(true);

    Map<String, dynamic> value =
        await _laravelApiClient.placeOrder(address_id, paymentType, wallet);

    // checkOutModel(GenSetCheckOutModel.fromJson(value));

    isLoading(false);
    return value;
  }

  // void placeOrder() {}
}
