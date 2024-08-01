import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/data/model/TimeSlotModel.dart';
import 'package:test_prj/data/model/VehicleType.dart';

class AddVehicleController extends AppBaseController {
  RxList<VehicleData> vehicleTypeList = <VehicleData>[].obs;

  RxList<TimeData> timeslotList = <TimeData>[].obs;
  int selectedSlot = 0;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getTimeslot();
    await getFuelOrderService();
  }

  RxInt? selectedValue = 1.obs;

  RxBool isLoading = false.obs;

  Future<void> getFuelOrderService() async {
    isLoading.value = true;
    VehicleType response = await orderFuelRepo.getVehicleType();
    vehicleTypeList.value = response.data ?? [];
    isLoading.value = false;
  }

  Future<void> getTimeslot() async {
    TimeSlotModel response = await orderFuelRepo.getTimeSlotApi();
    timeslotList.value = response.data ?? [];
    isLoading.value = false;
  }
}
