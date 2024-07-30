import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/data/model/BatteryTyreCheckOutModel.dart';
import 'package:test_prj/data/model/OtherCategoryModel.dart';
import 'package:test_prj/data/model/TimeSlotModel.dart';
import 'package:test_prj/data/model/VehicleModel.dart';
import 'package:test_prj/home_page.dart';

import '../data/model/CheckRequestModel.dart';
import '../data/model/VehicleType.dart';
import '../service/provider/lavavel_provider.dart';

class CarServiceController extends AppBaseController {
  LaravelApiClient _laravelApiClient = Get.find<LaravelApiClient>();

  var vehicletype = VehicleType().obs;
  var timeSlotModel = TimeSlotModel().obs;
  RxInt selectTimeSlot = 99.obs;

  var vehicleModel = VehicleModel().obs;
  var batterTyreCheckOut = BatteryTyreCheckOutModel().obs;
  RxBool isLoading = false.obs;

  RxList<VehicleData>? vehicleList = <VehicleData>[].obs;
  RxList<VehicleModelData>? vehicleModelList = <VehicleModelData>[].obs;
  RxList<TimeData>? tileList = <TimeData>[].obs;
  var selectedVehicle = VehicleData().obs;
  var selectedVehicleManufacture = VehicleData().obs;
  // String? selectedService;
  var selectedService = VehicleModelData().obs;
  var selectModel = VehicleModelData().obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getVehiCleType() async {
    isLoading(true);

    Map<String, dynamic> data = await _laravelApiClient.getVehicleType();
    isLoading(false);
    vehicletype(VehicleType.fromJson(data));
    VehicleData v = VehicleData(name: "Select Vehicle ");
    vehicleList = <VehicleData>[].obs;
    vehicleList!.value.add(v);
    vehicleList!.value.addAll(vehicletype.value.data!);

    selectedVehicle.value = vehicleList!.value[0];
    selectedVehicleManufacture.value = vehicleList!.value[0];

    // list.value = response;
    getVehicleModel(selectedVehicle.value.id.toString());

    update();

    print("getBanner ${vehicletype.value}");
  }

  Future<void> getSlots() async {
    isLoading(true);
    Map<String, dynamic> data = await _laravelApiClient.getSlots();
    isLoading(false);
    timeSlotModel(TimeSlotModel.fromJson(data));

    tileList?.value = timeSlotModel.value.data!;
    // list.value = response;
    update();

    print("getBanner ${vehicletype.value}");
  }

  Future<void> getVehicleModel(String id) async {
    vehicleModelList = <VehicleModelData>[].obs;
    vehicleModelList!.clear();
    isLoading(true);
    Map<String, dynamic> data = await _laravelApiClient.getVehicleModel(id);
    isLoading(false);
    vehicleModel(VehicleModel.fromJson(data));
    VehicleModelData v = VehicleModelData(name: "Select Vehicle Model");
    vehicleModelList!.value.add(v);
    vehicleModelList!.value.addAll(vehicleModel.value.data!);
    // vehicleModelList!.value = vehicleModel.value.data!;
    if (vehicleModelList!.value.isNotEmpty) {
      selectedService.value = vehicleModelList!.value[0];
      selectModel.value = vehicleModelList!.value[0];
    }

    update();
    // list.value = response;

    print("getVehicleModel ${vehicletype.value}");
  }

  Future<void> getVendorCheckOut(OtherCategory otherCategory) async {
    vehicleModelList = <VehicleModelData>[].obs;
    isLoading(true);
    Map<String, dynamic> data =
        await _laravelApiClient.getCheckOut(otherCategory);

    isLoading(false);
    batterTyreCheckOut(BatteryTyreCheckOutModel.fromJson(data));

    // vehicleModelList!.value = vehicleModel.value.data!;
    // selectedService.value = vehicleModelList!.value[0];

    update();
    // list.value = response;

    print("getVehicleModel ${batterTyreCheckOut.value}");
  }

  Future<Map> PlaceOtherCatOrder(CheckOutRequest otherCategory) async {
    vehicleModelList = <VehicleModelData>[].obs;
    isLoading(true);
    Map<String, dynamic> data =
        await _laravelApiClient.getConfirmVendorService(otherCategory);

    isLoading(false);

    return data;
    // batterTyreCheckOut(BatteryTyreCheckOutModel.fromJson(data));

    // vehicleModelList!.value = vehicleModel.value.data!;
    // selectedService.value = vehicleModelList!.value[0];

    update();
    // list.value = response;

    print("getVehicleModel ${batterTyreCheckOut.value}");
  }
}
