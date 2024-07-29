import 'package:get/get.dart';

import '../data/model/offers_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class OfferController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();
  var offerInfoModel = OffersModel().obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getOffers();
  }

  Future<void> getOffers() async {
    isLoading(true);
    Map<String, dynamic> data = await _laravelApiClient.getOffer();

    offerInfoModel(OffersModel.fromJson(data));
    isLoading(false);
    print("getBanner ${offerInfoModel.value.coupons?.length}");
  }
}
