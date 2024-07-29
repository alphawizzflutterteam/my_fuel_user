import 'package:get/get.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/data/model/vendors_model.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/order_fuel_controller.dart';

class VendorController extends AppBaseController {
  RxList<VendorData> vendorList = <VendorData>[].obs;
  final orderFuelController = Get.find<OrderFuelController>();

  Map<String, dynamic> argument = {};

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    argument = Get.arguments;
    await getVendors();
  }

  RxBool isLoading = false.obs;

  Future<void> getVendors() async {
    isLoading.value = true;
    update();
    VendorsModel response = await orderFuelRepo.getVendor(
        date: argument['date'].toString(),
        quantity: argument['quantity'],
        billing: '',
        shipping: '',
        slotId: argument['selectedSlot'].toString(),
        serviceType: orderFuelController.selectedIndex.value == 0
            ? 'Door Step'
            : 'Fuel to Go',
        id: orderFuelController.selectedData!.id.toString());

    vendorList.value = response.data ?? [];
    isLoading.value = false;
    update();
  }
}
