import 'package:get/get.dart';

import '../data/model/notification_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class NotificationController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();
  RxList<Notification> list = <Notification>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getNotification();
  }

  Future<void> getNotification() async {
    isLoading(true);
    List<Notification> response = await _laravelApiClient.getNotification();
    isLoading(false);
    list.value = response;

    print("getBanner ${list.value.length}");
  }

  // Future<List<BannerModel>> getNotification() async {
  //   List<BannerModel> bannerList = [];
  //
  //   var response = await httpClient.getUri(
  //     Uri.parse(ApiConstants.banners),
  //     options: optionsNetwork,
  //   );
  //   if (response.statusCode == 200) {
  //     print("banners ${response.toString()} ");
  //     List<dynamic> data = response.data;
  //
  //     bannerList = data.map((json) => BannerModel.fromJson(json)).toList();
  //     // data.forEach((element) {
  //     //   bannerList.add(BannerModel.fromJson(json.decode(element.toString())));
  //     // });
  //     return bannerList;
  //   } else {
  //     throw Exception(response.data['message']);
  //   }
  // }
}
