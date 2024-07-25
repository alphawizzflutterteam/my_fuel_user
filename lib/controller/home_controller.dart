import 'package:get/get.dart';

import '../data/model/response/BannerModel.dart';
import '../data/model/response/home_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class HomeController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  RxList<BannerModel> list = <BannerModel>[].obs;
  var homeServicesModel = HomeServicesModel().obs;
  RxList<Self> serviceList = <Self>[].obs;
  RxList<OtherData> otherList = <OtherData>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getBanner();
    getHomeList();
  }

  Future<void> getBanner() async {
    List<BannerModel> response = await _laravelApiClient.getBanner();

    list.value = response;

    print("getBanner ${list.value.length}");
  }

  Future<void> getHomeList() async {
    HomeServicesModel response = await _laravelApiClient.getHomeData();

    homeServicesModel.value = response;
    serviceList.value = homeServicesModel.value.data!.self!;
    otherList.value = homeServicesModel.value.data!.other!;
    print("getBanner ${list.value.length}");
  }
}
