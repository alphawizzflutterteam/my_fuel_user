import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/data/model/OrderFuelModel.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/vendor_controller.dart';

class OrderFuelController extends AppBaseController {
  RxInt selectedIndex = 0.obs;

  RxList<OrderFuelData> servicesList = <OrderFuelData>[].obs;
  bool isLoading = false;
  ServiceListData? selectedData;

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

    servicesList.value.first.data?[0].isSelected = true;
    selectedData = servicesList.value.first.data?[0];
    isLoading = false;
    update();
  }
}
