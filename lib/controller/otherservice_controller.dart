import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../data/model/assetlist_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class OtherServiceController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();
  RxBool isLoading = false.obs;

  Future<Map<String, dynamic>> submitInsurance(String vehicle_number,
      String name, String emaiasasl, String mobile) async {
    isLoading(true);

    Map<String, dynamic> value = await _laravelApiClient.submitInsurance(
        vehicle_number, name, emaiasasl, mobile);
    if (value.containsKey("errors")) {
      Fluttertoast.showToast(msg: "$value");
    } else if (value['token'] != "") {}

    isLoading(false);
    return value;
  }
}
