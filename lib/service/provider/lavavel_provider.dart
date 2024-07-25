import 'dart:convert';

import 'package:get/get.dart';

import 'package:test_prj/helper/utils/app_constants.dart';
import 'package:test_prj/repository/model/user_model.dart';
import 'package:test_prj/service/provider/end_points.dart';

import '../../data/model/addres_model.dart';
import '../../data/model/response/BannerModel.dart';
import '../../data/model/response/home_model.dart';
import '../../data/model/response/setting_model.dart';
import '../../helper/utils/shared_preference.dart';
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

  Future<SettingModel> getSettings() async {
    /*var _queryParameters = {
      'api_token': authService.apiToken,
    };
     Uri _uri =
        getApiBaseUri("options").replace(queryParameters: _queryParameters);*/
    // print(option.toJson());
    var response = await httpClient.get(
      ApiConstants.getSettingUri,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("getSettingUri ${response.toString()} ");
      return SettingModel.fromJson(json.decode(response.toString()));
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<List<BannerModel>> getBanner() async {
    List<BannerModel> bannerList = [];

    var response = await httpClient.get(
      ApiConstants.banners,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("banners ${response.toString()} ");
      List<dynamic> data = response.data;

      bannerList = data.map((json) => BannerModel.fromJson(json)).toList();
      // data.forEach((element) {
      //   bannerList.add(BannerModel.fromJson(json.decode(element.toString())));
      // });
      return bannerList;
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<HomeServicesModel> getHomeData() async {
    var response = await httpClient.get(
      ApiConstants.homeServices,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("homeServices ${response.toString()} ");

      return HomeServicesModel.fromJson(json.decode(response.toString()));
      // data.forEach((element) {
      //   bannerList.add(BannerModel.fromJson(json.decode(element.toString())));
      // });
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> register(User user) async {
    var response = await httpClient.post(
      ApiConstants.userRegister,
      data: user.toJson(),
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");
      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> checkOtp(String token, String mobile) async {
    var response = await httpClient.post(
      ApiConstants.checkPhone,
      data: {'token': "$token", "mobile": "$mobile"},
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");
      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> verifyOtp(
      String token, String mobile, String otp) async {
    var response = await httpClient.post(
      ApiConstants.veriFyPhone,
      data: {'token': "$token", "mobile": "$mobile", "otp": "$otp"},
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");
      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> Login(
      String membNo, String emailPhone, String password) async {
    var response = await httpClient.post(
      ApiConstants.login,
      data: {
        "email": "$emailPhone",
        // "phone": "$emailPhone",
        "password": "$password",
        // "guest_id": "$membNo"
        "guest_id": "123"
      },
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> forgetPassWord(String membNo) async {
    var response = await httpClient.post(
      ApiConstants.forgetpassword,
      data: {
        "identity": "$membNo",
        // "phone": "$emailPhone",
      },
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> addAddressWord(
    String name,
    String phone,
    String address_type,
    String address,
    String building,
    String landmark,
    String country,
    String state,
    String city,
    String zip,
    String latitude,
    String longitude,
    String is_billing,
  ) async {
    var response = await httpClient.post(
      ApiConstants.addAddress,
      data: {
        "contact_person_name": "$name",
        "phone": "$phone",
        "address_type": "$address_type",
        "address": "$address",
        "building": "$building",
        "landmark": "$landmark",
        "country": "$country",
        "state": "$state",
        "city": "$city",
        "zip": "$zip",
        "latitude": "$latitude",
        "longitude": "$longitude",
        "is_billing": "$is_billing",
      },
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> verifyPaswdOtp(String membNo, String otp) async {
    var response = await httpClient.post(
      ApiConstants.verifyOtp,
      data: {
        "identity": "$membNo",
        "otp": "$otp",
        // "phone": "$emailPhone",
      },
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> resetPassword(
      String membNo, String otp, String password) async {
    Map data = {
      "identity": "$membNo",
      "otp": "$otp",
      "password": "$password",
      "confirm_password": "$password",
    };
    print("resetPassword $data");
    var response = await httpClient.put(
      ApiConstants.resetPassword,
      data: data,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> getProfile() async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.get(
      ApiConstants.getProfile,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> getOffer() async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.get(
      ApiConstants.offers,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<List<AddressListModel>> getAddress() async {
    List<AddressListModel> addressList = [];
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.get(
      ApiConstants.addList,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;

      addressList =
          data.map((json) => AddressListModel.fromJson(json)).toList();
      print("userRegister ${response.toString()} ");

      return addressList;
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> getWalletHisory() async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.get(
      ApiConstants.walletTransactionHistory,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }
}
