import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../data/model/assetlist_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class AssetController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  RxBool isLoading = false.obs;
  var assetInfoModel = AssetListModel().obs;
  RxList<AssetData>? dataList = <AssetData>[].obs;
  @override
  void onInit() {
    super.onInit();
    getAssets();
  }

  Future<Map<String, dynamic>> createAst(String asset_type, String name,
      String capacity, String fuel_capacity) async {
    isLoading(true);

    Map<String, dynamic> value = await _laravelApiClient.createAsset(
        asset_type, name, capacity, fuel_capacity);
    if (value.containsKey("errors")) {
      Fluttertoast.showToast(msg: "$value");
    } else if (value['token'] != "") {}

    isLoading(false);
    return value;
  }

  Future<Map<String, dynamic>> updateA(String id, String asset_type,
      String name, String capacity, String fuel_capacity) async {
    isLoading(true);

    Map<String, dynamic> value = await _laravelApiClient.updateAsset(
        id, asset_type, name, capacity, fuel_capacity);
    if (value.containsKey("errors")) {
      Fluttertoast.showToast(msg: "$value");
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
      Fluttertoast.showToast(msg: "$value");
    } else if (value['token'] != "") {}

    isLoading(false);
    return value;
  }

  Future<void> getAssets() async {
    isLoading(true);
    Map<String, dynamic> data = await _laravelApiClient.assetsList();

    assetInfoModel(AssetListModel.fromJson(data));
    dataList!.value = assetInfoModel.value.data!;
    isLoading(false);
    print("dataList ${dataList!.value.length}");
  }
}
