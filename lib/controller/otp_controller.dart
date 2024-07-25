import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';

import '../data/model/CheckOtpModel.dart';
import '../data/model/verify_otp_model.dart';
import '../service/provider/lavavel_provider.dart';

class OtpController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  RxBool isLoading = false.obs;

  var verifyModel = VerifyModel().obs;
  var checkOtpval = CheckOtpNodel().obs;
  Future<Map<String, dynamic>> login(
      String membNo, String emailPhone, String password) async {
    isLoading(true);

    Map<String, dynamic> value =
        await _laravelApiClient.Login(membNo, emailPhone, password);
    if (value.containsKey("errors")) {
      Fluttertoast.showToast(msg: "$value");
    } else if (value['token'] != "") {}
    isLoading(false);
    return value;
  }

  Future<Map<String, dynamic>> checkOtp(String token, String mobile) async {
    isLoading(true);
    print("User ${token.toString()}");
    print("User ${mobile.toString()}");
    Map<String, dynamic> response =
        await _laravelApiClient.checkOtp(token, mobile);
    checkOtpval.value = CheckOtpNodel.fromJson(response);
    isLoading(false);
    return response;
    print("object response ${response['temporary_token']}");
  }

  Future<Map<String, dynamic>> verifyOtp(
      String token, String mobile, String otp) async {
    isLoading(true);
    print("User ${token.toString()}");
    print("User ${mobile.toString()}");
    Map<String, dynamic> response =
        await _laravelApiClient.verifyOtp(token, mobile, otp);
    verifyModel.value = VerifyModel.fromJson(response);
    isLoading(false);
    return response;
    print("object response ${response['temporary_token']}");
  }
}
