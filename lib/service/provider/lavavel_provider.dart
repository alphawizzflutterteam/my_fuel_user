import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_prj/data/model/OtherCategoryModel.dart';
import 'package:test_prj/data/model/service_detail.dart';

import 'package:test_prj/helper/utils/app_constants.dart';
import 'package:test_prj/repository/model/user_model.dart';
import 'package:test_prj/service/provider/end_points.dart';

import '../../data/model/CheckRequestModel.dart';
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

  Future<Map<String, dynamic>> updateProfile(UpdateProfile user) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";

    var response = await httpClient.put(
      ApiConstants.UPDATEPROFILE,
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
    Map data = {"temporary_token": "$token", "phone": "$mobile"};
    print("object Data Request $data");
    var response = await httpClient.post(
      ApiConstants.checkPhone,
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

  // Future<Map<String, dynamic>> serviceDetail(
  //     String token, String mobile) async {
  //   var response = await httpClient.post(
  //     ApiConstants.checkPhone,
  //     data: {'token': "$token", "mobile": "$mobile"},
  //     options: optionsNetwork,
  //   );
  //   if (response.statusCode == 200) {
  //     print("userRegister ${response.toString()} ");
  //     return json.decode(response.toString());
  //   } else {
  //     throw Exception(response.data['message']);
  //   }
  // }

  Future<ServiceDetailsModel> getServiceDetail(String id) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    print("category $id");
    var response = await httpClient.post(
      ApiConstants.serviceDetail,
      data: {'category': "$id", "offset": "0", "limit": "20"},
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");
      return ServiceDetailsModel.fromJson(json.decode(response.toString()));
      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> verifyOtp(
      String token, String mobile, String otp) async {
    var response = await httpClient.post(
      ApiConstants.veriFyPhone,
      data: {'temporary_token': "$token", "phone": "$mobile", "otp": "$otp"},
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");
      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> Enquiry(String id, String monthly_consumption,
      String number_of_assets, String fuel_consumption) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.post(
      ApiConstants.Enquiry,
      data: {
        'category_id': "$id",
        "monthly_consumption": "$monthly_consumption",
        "number_of_assets": "$number_of_assets",
        "fuel_consumption": "$fuel_consumption"
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

  Future<Map<String, dynamic>> AddToCart(
    String ids,
  ) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.post(
      ApiConstants.addToCart,
      data: {"id": "$ids", "quantity": "1"},
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> ManageCart(
    String address_id,
    String category_id,
  ) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.get(
      "${ApiConstants.MANAGECART}$address_id&category_id=$category_id",
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");
      print(
          "userRegister ${ApiConstants.MANAGECART}$address_id&category_id=$category_id ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> placeOrder(
      String address_id, String paymentType) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.get(
      "${ApiConstants.PLACEORDER}$address_id&payment_method=$paymentType&order_note=ABC Status",
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
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
      return json.decode(response.toString());
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
      return json.decode(response.toString());
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
      return json.decode(response.toString());
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
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> getVehicleType() async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.get(
      ApiConstants.VEHICLETYPE,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> getSlots() async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    log("TOKEN $token");
    var response = await httpClient.get(
      ApiConstants.TIMESLOTS,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> getVehicleModel(String id) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.post(
      data: {"id": "$id"},
      ApiConstants.VEHICLEMODEL,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> getCheckOut(OtherCategory otherCategory) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    print("object Rerquest ${otherCategory.toJson()}");
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    log("tokentoken $token");
    var response = await httpClient.post(
      data: otherCategory.toJson(),
      ApiConstants.VENDORCHEKOUT,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<Map<String, dynamic>> getConfirmVendorService(
      CheckOutRequest otherCategory) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    print("object Rerquest ${otherCategory.toJson()}");
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    log("tokentoken $token");
    var response = await httpClient.post(
      data: otherCategory.toJson(),
      ApiConstants.ConfirmPlaceOrder,
      // ApiConstants.VENDORCHEKOUT,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> getOrders() async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.get(
      ApiConstants.ORDERLIST,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
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
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> assetsList() async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.get(
      ApiConstants.assetsList,
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
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
      return json.decode(response.toString());
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
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> submitInsurance(
      String vehicle_number, String name, String email, String mobile) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.post(
      ApiConstants.insuranceSubmit,
      data: {
        "vehicle_number": "$vehicle_number",
        // "phone": "$emailPhone",
        "name": "$name",
        // "guest_id": "$membNo"
        "email": "$email",
        "mobile": "$mobile"
      },
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> createAsset(String asset_type, String name,
      String capacity, String fuel_capacity) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.post(
      ApiConstants.addAsset,
      data: {
        "asset_type": "$asset_type",
        // "phone": "$emailPhone",
        "name": "$name",
        // "guest_id": "$membNo"
        "capacity": "$capacity",
        "fuel_capacity": "$fuel_capacity"
      },
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> updateAsset(String id, String asset_type,
      String name, String capacity, String fuel_capacity) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.put(
      ApiConstants.updateAsset,
      data: {
        "id": "$id",
        "asset_type": "$asset_type",
        // "phone": "$emailPhone",
        "name": "$name",
        // "guest_id": "$membNo"
        "capacity": "$capacity",
        "fuel_capacity": "$fuel_capacity"
      },
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
    }
  }

  Future<Map<String, dynamic>> deleteAsset(
    String id,
  ) async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    optionsNetwork.headers!['Authorization'] = "Bearer $token";
    var response = await httpClient.delete(
      "${ApiConstants.deleteAsset}$id",
      options: optionsNetwork,
    );
    if (response.statusCode == 200) {
      print("userRegister ${response.toString()} ");

      return json.decode(response.toString());
    } else {
      return json.decode(response.toString());
    }
  }
}
