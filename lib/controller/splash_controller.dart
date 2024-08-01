import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/controller/language_controller.dart';
import 'package:test_prj/routes/app_pages.dart';
import 'package:test_prj/routes/app_routes.dart';
import 'package:test_prj/service/provider/lavavel_provider.dart';

import '../data/model/response/setting_model.dart';
import '../helper/utils/shared_preference.dart';
import '../splashScreen.dart';

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
    LanguageController languageController = Get.put(LanguageController());
    await Future.delayed(const Duration(milliseconds: 6000), () async {});
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    try {
      String? token = instance.getData(SharedPreferencesService.kTokenKey);
      String? languageType =
          instance.getData(SharedPreferencesService.kLanguageKey);

      print("object token $token");
      if (token == null) {
        Get.offAllNamed(Routes.LANGUAGE);
      } else if (token.isNotEmpty) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LANGUAGE);
      }
      if (languageType == '1') {
        languageController.changeLanguage('hi', 'IN');
      } else if (languageType == '2') {
        languageController.changeLanguage('en', 'US');
      } else if (languageType == '3') {
        languageController.changeLanguage('te', 'IN');
      } else if (languageType == '4') {
        print('kklll');
        languageController.changeLanguage('ml', 'IN');
      } else if (languageType == '5') {
        languageController.changeLanguage('kn', 'IN');
      } else if (languageType == '6') {
        languageController.changeLanguage('bn', 'IN');
      }
    } catch (e) {
      Get.offAllNamed(Routes.LANGUAGE);
      print(e);
    }
  }

  Future<void> getSettingAPi() async {
    SettingModel response = await _laravelApiClient.getSettings();

    settingModel.value = response;
    if (response != null) {
      configModel = response;
    }

    print("getSettingAPi ${settingModel.value.shippingMethod}");
  }
}
