import 'package:get/get.dart';

import '../data/model/response/BannerModel.dart';
import '../data/model/response/home_model.dart';
import '../data/model/service_detail.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class HomeController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  RxList<BannerModel> list = <BannerModel>[].obs;
  var homeServicesModel = HomeServicesModel().obs;
  var servicesDetailModel = ServiceDetailsModel().obs;
  RxList<Self> serviceList = <Self>[].obs;
  RxList<OtherData> otherList = <OtherData>[].obs;
  RxBool isLoading = false.obs;
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
    isLoading(true);
    HomeServicesModel response = await _laravelApiClient.getHomeData();
    isLoading(false);
    homeServicesModel.value = response;
    serviceList.value = homeServicesModel.value.data!.self!;
    otherList.value = homeServicesModel.value.data!.other!;
    print("getBanner ${list.value.length}");
  }

  Future<void> getServiceDetails(String id) async {
    isLoading(true);
    ServiceDetailsModel response = await _laravelApiClient.getServiceDetail(id);
    isLoading(false);
    servicesDetailModel.value = response;
    // serviceList.value = homeServicesModel.value.data!.self!;
    // otherList.value = homeServicesModel.value.data!.other!;
    print("getBanner ${list.value.length}");
  }

  Future<Map> getEnquiry(String id, String monthly_consumption,
      String number_of_assets, String fuel_consumption) async {
    isLoading(true);
    Map response = await _laravelApiClient.Enquiry(
        id, monthly_consumption, number_of_assets, fuel_consumption);
    isLoading(false);

    return response;
    // serviceList.value = homeServicesModel.value.data!.self!;
    // otherList.value = homeServicesModel.value.data!.other!;
    print("getBanner ${list.value.length}");
  }
}
