import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/routes/app_pages.dart';
import 'package:test_prj/routes/app_routes.dart';

class SplashController extends AppBaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3500), () {});

    Get.offAllNamed(Routes.LANGUAGE);
  }
}