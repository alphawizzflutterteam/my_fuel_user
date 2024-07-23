import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_prj/repository/model/user_model.dart';
import 'package:test_prj/service/provider/lavavel_provider.dart';

class AuthRepository {
  late LaravelApiClient _laravelApiClient;

  AuthRepository() {
    _laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<String> registerUserApi(User user) {
    return _laravelApiClient.userRegister(user);
  }
}
