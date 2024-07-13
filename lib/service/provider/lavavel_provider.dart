import 'package:get/get.dart';

import 'package:test_prj/helper/utils/app_constants.dart';
import 'package:test_prj/repository/model/user_model.dart';
import 'package:test_prj/service/provider/end_points.dart';

import 'api_provider.dart';

class LaravelApiClient extends GetxService with ApiClient {
  LaravelApiClient() {
    baseUrl = AppConstants.baseUrl;
  }

  @override
  Future<LaravelApiClient> init() async {
    super.init();
    return this;
  }

  Future<String> userRegister(User user) async {
    /*var _queryParameters = {
      'api_token': authService.apiToken,
    };
     Uri _uri =
        getApiBaseUri("options").replace(queryParameters: _queryParameters);*/
    // print(option.toJson());
    var response = await httpClient.post(
      ApiConstants.userRegister,
      data: user.toJson(),
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      return response.data['temporary_token'];
    } else {
      throw Exception(response.data['message']);
    }
  }
}
