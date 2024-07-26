import 'package:get/get.dart';

import '../data/model/response/userinfo_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class ProfileController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  var userInfoModel = UserInfoModel().obs;

  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getProfile();
  }

  Future<void> getProfile() async {
    isLoading(true);
    Map<String, dynamic> data = await _laravelApiClient.getProfile();
    isLoading(false);
    userInfoModel(UserInfoModel.fromJson(data));
    // list.value = response;

    print("getBanner ${userInfoModel.value}");
  }
}
