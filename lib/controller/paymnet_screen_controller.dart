import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/data/model/response/userinfo_model.dart';

import '../service/provider/lavavel_provider.dart';

class PaymentScreenController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  var userInfoModel = UserInfoModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    Map<String, dynamic> data = await _laravelApiClient.getProfile();
    userInfoModel.value = UserInfoModel.fromJson(data);
    // list.value = response;
  }

  Future<void> addMoney(
      String amount, String transaction_id, String payment_method) async {
    Map<String, dynamic> data = await _laravelApiClient.addMoney(
        amount, transaction_id, payment_method);
    getProfile();
  }
}
