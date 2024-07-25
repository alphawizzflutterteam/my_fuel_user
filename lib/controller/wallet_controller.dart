import 'package:get/get.dart';

import '../data/model/wallet_history_model.dart';
import '../service/provider/lavavel_provider.dart';
import 'appBase/appbase_controller.dart';

class WalletController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();
  var walletInfoModel = WalletTransactionModel().obs;
  RxList<WalletTransactionList>? listView = <WalletTransactionList>[].obs;

  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getWalletHisory();
  }

  Future<void> getWalletHisory() async {
    isLoading(true);
    Map<String, dynamic> data = await _laravelApiClient.getWalletHisory();

    walletInfoModel(WalletTransactionModel.fromJson(data));
    listView!.value = walletInfoModel.value.walletTransactionList!;
    isLoading(false);
    print("getBanner ${walletInfoModel.value}");
  }
}
