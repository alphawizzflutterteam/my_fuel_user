import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/Home/Evdoorbottom.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/helper/utils/extentions.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/add_vehicle_controller.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/vendors_page.dart';
import 'package:test_prj/orderfuel/fuelToGo/my_assets2.dart';
import 'package:test_prj/orderfuel/fuelToGo/vendors_page2.dart';

import '../../Home/FuelAddQuantity.dart';
import '../../components/my_appbar.dart';
import '../add_fuel_quantity.dart';

class AddVehicles extends StatefulWidget {
  const AddVehicles({super.key});

  @override
  State<AddVehicles> createState() => _AddVehiclesState();
}

class _AddVehiclesState extends State<AddVehicles> {
  final TextEditingController _controller = TextEditingController();
  // final TextEditingController _fuelQuantityController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  List<TextEditingController> _fuelQuantityController = [];
  final List<String> items = [
    "Four Wheeler",
    "Heavy Vehicle",
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVehicleController>(
      init: AddVehicleController(),
      builder: (controller) {
        return Scaffold(
            appBar: const MyAppbar(
              title: 'Add Vehicles',
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    if (_controller.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: 'please add registration number');
                    } else {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: FueladdQuantity(
                            controller: _fuelQuantityController,
                            ontab: () {
                              if (_fuelQuantityController[0].text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: 'please add fuel quantity');
                              } else {
                                Navigator.pop(context);

                                shoTimeSlot(controller);
                              }
                            },
                          ),
                        ),
                      );
                    }
                  },
                  // onTap: () =>showBottomSheet(builder: (context) => AddFuelQuantity,context: context),
                  child: const MyButton(text: 'Next')),
            ),
            body: Obx(
              () {
                return controller.isLoading.value
                    ? controller.loader()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.4),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButton<int>(
                                  value: controller.selectedValue?.value,
                                  hint: const Text('Vehicles Type'),
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  items: controller.vehicleTypeList.value
                                      .map((value) {
                                    return DropdownMenuItem(
                                      value: value.id,
                                      child: Text(value.name ?? ''),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    controller.selectedValue?.value =
                                        newValue ?? 0;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: TextFormField(
                                  controller: _controller,
                                  decoration:
                                      CustomInputDecoration.inputDecoration(
                                          'Vehicles Registration number')),
                            ),
                          ],
                        ),
                      );
              },
            ));
      },
    );
  }

  shoTimeSlot(AddVehicleController controller) {
    showModalBottomSheet(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState1) {
          return Evdoorbottom(
            onTab: () {
              if (_dateController.text.isEmpty) {
                Fluttertoast.showToast(msg: 'please select date');
              } else {
                Get.to(const VendorsPage(), arguments: {
                  'from': 'addVehicle',
                  'date': _dateController.text,
                  'selectedSlot':
                      controller.timeslotList[controller.selectedSlot].id,
                  'vehicleType': controller.selectedValue?.value,
                  'registration': _controller.text,
                  'quantity': _fuelQuantityController[0].text
                });
              }
            },
            dateController: _dateController,
            onSelect: (index) {
              controller.selectedSlot = index;
              setState1(() {});
            },
            slotList: controller.timeslotList,
            selectedSlot: controller.selectedSlot,
          );
        },
      ),
    );
  }
}
