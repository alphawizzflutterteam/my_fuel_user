import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/Home/Evdoorbottom.dart';
import 'package:test_prj/SelectNewAddress.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/widgets/globle_widgets.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/helper/utils/extentions.dart';
import 'package:test_prj/orderfuel/EV/cartPage.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/ev_vehicle_controller.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/order_fuel_checkout.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/vendors_page.dart';
import 'package:test_prj/selectAddress.dart';
import '../../components/my_hinttext_field.dart';
import '../../vehicle_number.dart';
import '../bottom_sheet.dart';
import 'Fuelbottom.dart';

class EvVehicle extends StatefulWidget {
  final int? selectedIndex;
  final int? catId;
  EvVehicle({super.key, this.selectedIndex, this.catId});

  @override
  State<EvVehicle> createState() => _EvVehicleState();
}

class _EvVehicleState extends State<EvVehicle> {
  TextEditingController vehicleController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EvVehicleController>(
      init: EvVehicleController(),
      builder: (controller) {
        return Scaffold(
          appBar: const MyAppbar(title: 'EV Vehicle'),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 0,
                      mainAxisExtent: 150,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (_, index) {
                      final item = controller.vehicleList[index];
                      return InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.zero,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text(
                                        'Enter Your Vehicle Number',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                          controller: vehicleController,
                                          decoration: CustomInputDecoration
                                              .inputDecoration(
                                                  'Vehicle Number')),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: InkWell(
                                          child: InkWell(
                                            onTap: () {
                                              shoTimeSlot(controller,
                                                  item.id.toString());

                                              // showModalBottomSheet(
                                              //   context: context,
                                              //   builder: (context) => Fuelbottom(),
                                              // );
                                            },
                                            child: const MyButton(
                                              text: "Submit",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey.shade100),
                                  padding: const EdgeInsets.all(8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    // borderRadius: BorderRadius.circular(
                                    //     // topLeft: Radius.circular(16),
                                    //     // topRight: Radius.circular(16)),
                                    child: Image.network(
                                      item.image ?? '',
                                      height: 90,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              errorImage(90, 0),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  item.name ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: controller.vehicleList.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  shoTimeSlot(EvVehicleController controller, String vehicleId) {
    showModalBottomSheet(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState1) {
          return Evdoorbottom(
            onTab: () {
              if (_dateController.text.isEmpty) {
                Fluttertoast.showToast(msg: 'please select date');
              } else {
                if (widget.selectedIndex != null) {
                  Get.to(const VendorsPage(), arguments: {
                    'from': 'ev',
                    'date': _dateController.text,
                    'selectedSlot': controller
                        .addVehicleController
                        .timeslotList[
                            controller.addVehicleController.selectedSlot]
                        .id,
                    'vehicleType': '',
                    'registration': '',
                    'quantity': '1',
                    'vehicleNumber': vehicleController.text,
                    'vehicleId': vehicleId
                  });
                } else {
                  Get.to(const SelectNewAddress(
                    isFromEv: true,
                  ))?.then((value) {
                    if (value == true) {
                      Get.to(const VendorsPage(), arguments: {
                        'from': 'ev',
                        'date': _dateController.text,
                        'selectedSlot': controller
                            .addVehicleController
                            .timeslotList[
                                controller.addVehicleController.selectedSlot]
                            .id,
                        'vehicleType': '',
                        'registration': '',
                        'quantity': '1',
                        'vehicleNumber': vehicleController.text,
                        'vehicleId': vehicleId
                      });
                    }
                  });
                }
              }
            },
            dateController: _dateController,
            onSelect: (index) {
              controller.addVehicleController.selectedSlot = index;
              setState1(() {});
            },
            slotList: controller.addVehicleController.timeslotList,
            selectedSlot: controller.addVehicleController.selectedSlot,
          );
        },
      ),
    );
  }
}
