import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../data/model/addres_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class AddressController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

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
    if (value.containsKey("errors")) {
      Fluttertoast.showToast(msg: "$value");
    } else if (value['token'] != "") {}
    isLoading(false);
    return value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getAddRess();
  }

  Future<void> getAddRess() async {
    isLoading(true);
    List<AddressListModel> addressList = await _laravelApiClient.getAddress();

    addressAList.value = addressList;

    // offerInfoModel(OffersModel.fromJson(data));
    // isLoading(false);
    // print("getBanner ${offerInfoModel.value.coupons?.length}");
  }
}
