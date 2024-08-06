import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/repository/model/user_model.dart';

import '../data/model/response/userinfo_model.dart';
import '../routes/app_routes.dart';
import '../service/provider/lavavel_provider.dart';
import '../splashScreen.dart';
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

    fName = userInfoModel.value.fName.toString();
    Phone = userInfoModel.value.phone.toString();
    // list.value = response;

    print("getBanner ${userInfoModel.value}");
  }

  Future<void> uploadChalan(
    UpdateProfile user, {
    File? chalanImages,
  }) async {
    // isLoading.value = true;
    // update();
    // DioClient get
    _laravelApiClient
        .updateProfileWithImage(user, chalanImages)
        .then((getData) {
      bool error = getData['status'];
      String msg = getData['message'];
      if (error) {
        Fluttertoast.showToast(msg: msg);
        // Get.dialog(AddSuccessPopup());
        // Get.toNamed(signInScreen);
        Get.offAllNamed(Routes.HOME);
      } else {
        Fluttertoast.showToast(msg: msg);
      }
      isLoading.value = false;
      update();
    });
  }

  Future<Map> cashFree(String name, String email, String mobile, String amount,
      String id) async {
    isLoading(true);
    Map response =
        await orderFuelRepo.getPaymentId(name, email, mobile, amount, id);
    isLoading(false);
    if (response['status']) {
      // Get.to(OrderPlaced(
      //   amount: response['message'],
      //   order_id: "${response['order_id']}",
      // ));
    }

    isLoading.value = false;
    return response;
  }
}
