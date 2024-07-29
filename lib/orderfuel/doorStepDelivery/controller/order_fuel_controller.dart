import 'package:get/get.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/data/model/OrderFuelModel.dart';

class OrderFuelController extends AppBaseController {
  RxInt selectedIndex = 0.obs;

  RxList<OrderFuelData> servicesList = <OrderFuelData>[].obs;
  bool isLoading = false;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getFuelOrderService();
  }

  void changeIndexMethod(int index) {
    selectedIndex.value = index;
    update();
  }

  Future<void> getFuelOrderService() async {
    isLoading = true;
    update();
    OrderFuelModel response = await orderFuelRepo.getOrderFuelServices();

    servicesList.value = response.data ?? [];
    isLoading = false;
    update();
  }
}
