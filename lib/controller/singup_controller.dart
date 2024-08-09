import 'package:get/get.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/data/model/industry_type_model.dart';

import '../data/model/CheckOtpModel.dart';
import '../repository/model/user_model.dart';
import '../repository/model/user_model.dart';
import '../repository/model/user_model.dart';
import '../service/provider/lavavel_provider.dart';

class SignupController extends AppBaseController {
  // Get.find<SettingsService>()
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getIndustryType();
  }

  IndustryTypeData? selectedIndustry;
  var name = 'Select Industry';
  final List<String> companyNames = [
    'Select Industry',
    'TCS',
    'Infosys',
    'Capgimini',
    'Genpack',
    'Sunpharma',
    'Lupin',
  ];

  RxList<IndustryTypeData> industryTypeList = <IndustryTypeData>[].obs;

  RxBool isLoading = false.obs;

  var checkOtpval = CheckOtpNodel().obs;

  Future<Map<String, dynamic>?> Register(User user) async {
    isLoading(true);
    Map<String, dynamic>? val;
    print("User Register${user.toJson()}");
    Map<String, dynamic> data = await _laravelApiClient.register(user);
    print("User ${data}");
    isLoading(false);
    return data;
    // print("object response ${response['temporary_token']}");
  }

  Future<Map<String, dynamic>> UpdateProfileA(UpdateProfile user) async {
    isLoading(true);
    print("User ${user.toJson()}");
    Map<String, dynamic> response = await _laravelApiClient.updateProfile(user);

    isLoading(false);
    return response;
    print("object response ${response['temporary_token']}");
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

  Future<Map<String, dynamic>> chnagePassword(
      String oldpassword, String newPassword) async {
    isLoading(true);
    print("User ${oldpassword.toString()}");
    print("User ${newPassword.toString()}");
    Map<String, dynamic> response =
        await _laravelApiClient.chnagePassword(oldpassword, newPassword);
    // checkOtpval.value = CheckOtpNodel.fromJson(response);
    isLoading(false);
    return response;
    print("object response ${response['temporary_token']}");
  }

  Future<void> getIndustryType() async {
    industryTypeList.value = await _laravelApiClient.getIndustryType();
  }
}
