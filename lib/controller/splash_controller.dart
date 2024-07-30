import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/routes/app_pages.dart';
import 'package:test_prj/routes/app_routes.dart';
import 'package:test_prj/service/provider/lavavel_provider.dart';

import '../data/model/response/setting_model.dart';
import '../helper/utils/shared_preference.dart';
<<<<<<< Updated upstream
import '../splashScreen.dart';
=======
>>>>>>> Stashed changes

class SplashController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();
  var settingModel = SettingModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _navigateToHome();
    try {
      getSettingAPi();
    } catch (e) {
      print(e);
    }
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () async {});
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    try {
      String token = instance.getData(SharedPreferencesService.kTokenKey);

      print("object token $token");
      if (token == null) {
        Get.offAllNamed(Routes.LANGUAGE);
      } else if (token.isNotEmpty) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LANGUAGE);
      }
    } catch (e) {
      Get.offAllNamed(Routes.LANGUAGE);
      print(e);
    }
  }

  Future<void> getSettingAPi() async {
    SettingModel response = await _laravelApiClient.getSettings();

    settingModel.value = response;
<<<<<<< Updated upstream
    if (response != null) {
      configModel = response;
    }
=======
>>>>>>> Stashed changes

    print("getSettingAPi ${settingModel.value.shippingMethod}");
  }
}
