import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/helper/app_images.dart';
import 'package:test_prj/repository/model/language_model.dart';
import 'package:test_prj/routes/app_pages.dart';
import 'package:test_prj/routes/app_routes.dart';

class LanguageController extends AppBaseController {
  List<LanguageModel> languageList = [
    LanguageModel(
        image: AppImages.hindiImage, title: 'Hindi', isSelected: false),
    LanguageModel(
        image: AppImages.englishImage, title: 'English', isSelected: false),
    LanguageModel(
        image: AppImages.teluguImage, title: 'Telugu', isSelected: false),
    LanguageModel(
        image: AppImages.malayalamImage, title: 'Malayalam', isSelected: false),
    LanguageModel(
        image: AppImages.kannadaImage, title: 'Kannada', isSelected: false),
    LanguageModel(
        image: AppImages.bengaliImage, title: 'Bengali', isSelected: false),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    Get.offAllNamed(Routes.LOGIN);
    update();
  }

  void changeLanguage(var param1, var param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }
}
