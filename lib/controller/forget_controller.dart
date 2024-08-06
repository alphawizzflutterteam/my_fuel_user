import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class ForgetPasswordController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  RxBool isLoading = false.obs;

  Future<Map<String, dynamic>> forgetpass(String membNo) async {
    isLoading(true);

    Map<String, dynamic> value = await _laravelApiClient.forgetPassWord(membNo);
    if (value.containsKey("errors")) {
      Fluttertoast.showToast(msg: "${value['message']}");
    } else if (value['token'] != "") {}
    isLoading(false);
    return value;
  }

  Future<Map<String, dynamic>> veriFyOtp(String membNo, String otp) async {
    isLoading(true);

    Map<String, dynamic> value =
        await _laravelApiClient.verifyPaswdOtp(membNo, otp);
    if (value.containsKey("errors")) {
      Fluttertoast.showToast(msg: "$value");
    } else if (value['token'] != "") {}
    isLoading(false);
    return value;
  }

  Future<Map<String, dynamic>> resetPassword(
      String membNo, String otp, String password) async {
    isLoading(true);

    Map<String, dynamic> value =
        await _laravelApiClient.resetPassword(membNo, otp, password);
    if (value.containsKey("errors")) {
      Fluttertoast.showToast(msg: "$value");
    } else if (value['token'] != "") {}
    isLoading(false);
    return value;
  }
}
