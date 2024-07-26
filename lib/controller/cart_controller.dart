import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../data/model/senset_checkoutmodel.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class CartController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  String address_id = "";
  String category_id = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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

  Future<Map<String, dynamic>> placeOrder(
    String address_id,
  ) async {
    isLoading(true);

    Map<String, dynamic> value = await _laravelApiClient.placeOrder(address_id);

    // checkOutModel(GenSetCheckOutModel.fromJson(value));

    isLoading(false);
    return value;
  }

  // void placeOrder() {}
}
