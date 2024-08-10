import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:test_prj/controller/splash_controller.dart';
import 'package:test_prj/data/model/OrderFuelModel.dart';
import 'package:test_prj/data/model/fuel_services_model.dart';
import 'package:test_prj/data/model/response/setting_model.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/add_vehicle_controller.dart';
import 'package:test_prj/splashScreen.dart';

import '../data/model/assetlist_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class AssetController extends AppBaseController {
  final LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  final addAssetController = Get.put(AddVehicleController());

  RxBool isLoading = false.obs;
  var assetInfoModel = AssetListModel().obs;

  TextEditingController nameControiller = TextEditingController();
  TextEditingController capacityControiller = TextEditingController();
  TextEditingController fuelcapacityControiller = TextEditingController();

  RxList<AssetData>? assetDataList = <AssetData>[].obs;

  RxInt selectedButton = 1.obs;
  int selectedAsset = 0;

  RxList<FuelServices> servicesList = <FuelServices>[].obs;
  RxList<AssetTypeData> assetTypeList = <AssetTypeData>[].obs;
  FuelServices? selectedData;
  String? selectedUnit;
  var settingModel = SettingModel().obs;

  List data = [];

  // RxInt selectedAsset = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getAssets();
    await getFuelOrderService();

    // initUI();
  }

  Future<Map<String, dynamic>> createAst(
      String asset_type, String name, String capacity, String fuel_capacity,
      {String? serviceType, String? unit}) async {
    isLoading(true);

    Map<String, dynamic> value = await _laravelApiClient.createAsset(
        asset_type, name, capacity, fuel_capacity,
        serviceType: serviceType, unit: unit);

    if (value['status'] == true) {
      Fluttertoast.showToast(msg: "${value['message']}");
    } else if (value.containsKey("errors")) {
    } else if (value['token'] != "") {}

    isLoading(false);
    return value;
  }

  Future<Map<String, dynamic>> updateA(String id, String asset_type,
      String name, String capacity, String fuel_capacity) async {
    isLoading(true);

    Map<String, dynamic> value = await _laravelApiClient.updateAsset(
        id, asset_type, name, capacity, fuel_capacity);

    getAssets();
    if (value.containsKey("errors")) {
    } else if (value['token'] != "") {}

    isLoading(false);
    return value;
  }

  Future<Map<String, dynamic>> delete(String id) async {
    isLoading(true);

    Map<String, dynamic> value = await _laravelApiClient.deleteAsset(
      id,
    );
    if (value.containsKey("errors")) {
      // Fluttertoast.showToast(msg: "$value");
    } else if (value['token'] != "") {}

    isLoading(false);
    return value;
  }

  Future<void> getAssets() async {
    isLoading(true);
    Map<String, dynamic> data = await _laravelApiClient.assetsList();

    assetInfoModel(AssetListModel.fromJson(data));
    assetDataList!.value = assetInfoModel.value.data!;
    isLoading(false);
    print("dataList ${assetDataList!.value.length}");
  }

  Future<void> getFuelOrderService() async {
    Map<String, dynamic> value = await _laravelApiClient.getService();

    servicesList.value = FuelServicesModel.fromJson(value).data ?? [];
    assetTypeList.value = FuelServicesModel.fromJson(value).assetTyps ?? [];
  }

  Future<void> getSettingAPi() async {
    SettingModel response = await _laravelApiClient.getSettings();

    settingModel.value = response;
    if (response != null) {
      configModel = response;
    }

    print("getSettingAPi ${settingModel.value.shippingMethod}");
  }

  void initUI() {
    data = Get.arguments;
    print('${data}');

    if (data.isNotEmpty && data[0]) {
      for (int i = 0; i < assetTypeList.length; i++) {
        if (data[1]!.assetType.toString().toLowerCase() ==
            assetTypeList[i].title.toString().toLowerCase()) {
          selectedAsset = i;
        }
      }

      nameControiller.text = data[1]!.name!.toString();
      capacityControiller.text = data[1]!.capacity!.toString();
      selectedUnit = data[1].fuelCapacity.toString();

      // fuelcapacityControiller.text = widget.data!.fuelCapacity!.toString();
      // update();
    }
  }
}
