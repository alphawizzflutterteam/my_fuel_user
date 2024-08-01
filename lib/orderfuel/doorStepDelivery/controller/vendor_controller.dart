import 'package:get/get.dart';
import 'package:test_prj/controller/appBase/appbase_controller.dart';
import 'package:test_prj/controller/splash_controller.dart';
import 'package:test_prj/data/model/vendors_model.dart';
import 'package:test_prj/home_page.dart';
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
    VendorsModel response = await orderFuelRepo.getVendor(
        date: argument['date'].toString(),
        quantity: argument['quantity'],
        billing: otherCategory.billingAddressId ?? '',
        shipping: otherCategory.shippingAddressId ?? '',
        slotId: argument['selectedSlot'].toString(),
        serviceType: orderFuelController.selectedIndex.value == 0
            ? 'Door step'
            : 'At your station',
        id: orderFuelController.selectedData!.id.toString(),
        assetId: argument['assetId'] ?? '',
        vehicleType: argument['vehicleType'].toString());

    vendorList.value = response.data ?? [];
    isLoading.value = false;
  }
}
