import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../data/model/addres_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class AddressController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  RxBool isBillDeilivery = false.obs;
  RxBool isTab = true.obs;
  RxBool isLoading = false.obs;
  RxList<AddressListModel> addressAList = <AddressListModel>[].obs;

  Future<Map<String, dynamic>> addAddress(
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
      String is_billing) async {
    isLoading(true);

    Map<String, dynamic> value = await _laravelApiClient.addAddressWord(
        name,
        phone,
        address_type,
        address,
        building,
        landmark,
        country,
        state,
        city,
        zip,
        latitude,
        longitude,
        is_billing);

    if (value['status'] == true) {
      Fluttertoast.showToast(msg: "${value['message']}");
    } else if (value.containsKey("errors")) {
      Fluttertoast.showToast(msg: "$value");
    } else if (value['token'] != "") {}
    isLoading(false);
    return value;
  }

  Map? data;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data = Get.arguments;
    getAddRess();
  }

  Future<void> getAddRess() async {
    isLoading(true);
    addressAList = <AddressListModel>[].obs;
    List<AddressListModel> addressList = await _laravelApiClient.getAddress();

    addressAList.value = addressList;

    isLoading(false);
    update();
    // offerInfoModel(OffersModel.fromJson(data));
    // isLoading(false);
    // print("getBanner ${offerInfoModel.value.coupons?.length}");
  }

  Future<Map> delete(id) async {
    isLoading(true);
    addressAList = <AddressListModel>[].obs;
    Map data = await _laravelApiClient.delete(id);

    update();

    return data;
    // offerInfoModel(OffersModel.fromJson(data));
    // isLoading(false);
    // print("getBanner ${offerInfoModel.value.coupons?.length}");
  }
}
