import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_prj/service/provider/lavavel_provider.dart';

class SplashRepo {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  SplashRepo() {
    _laravelApiClient = Get.find<LaravelApiClient>();
  }





}
