import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/data/model/vehicle_list_model.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/add_vehicle_controller.dart';

class EvVehicleController extends AppBaseController {
  int? catId;

  final addVehicleController = Get.put(AddVehicleController());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    catId = Get.arguments;
    getVehicleList();
  }

  RxList<VehicleList> vehicleList = <VehicleList>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getVehicleList() async {
    isLoading.value = true;
    update();
    VehicleListModel response =
        await orderFuelRepo.getVehicle(catId: catId.toString() ?? '');

    vehicleList.value = response.data ?? [];
    isLoading.value = false;
    update();
  }
}
