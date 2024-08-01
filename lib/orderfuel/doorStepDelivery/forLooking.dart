import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/data/model/OrderFuelModel.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/order_fuel_controller.dart';
import 'package:test_prj/orderfuel/fuelToGo/addVehicles.dart';
import '../../SelectNewAddress.dart';
import '../EV/evVehicle.dart';

class LookingForCompany extends StatefulWidget {
  const LookingForCompany({super.key});

  @override
  State<LookingForCompany> createState() => _LookingForCompanyState();
}

class _LookingForCompanyState extends State<LookingForCompany> {
  Widget customRadio(String text, int selectedTab,
      OrderFuelController controller, int index, ServiceListData item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: OutlinedButton(
        onPressed: () {
          if (selectedTab == 0) {
            controller.servicesList[0].data?.forEach((element) {
              element.isSelected = false;
            });

            controller.servicesList[0].data?[index].isSelected = true;
            controller.selectedData = controller.servicesList[0].data?[index];

            controller.update();
          } else {
            controller.servicesList[1].data?.forEach((element) {
              element.isSelected = false;
            });

            controller.servicesList[1].data?[index].isSelected = true;
            controller.selectedData = controller.servicesList[1].data?[index];

            controller.update();
          }

          // controller.selected.value = index;
        },
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(280, 50), // Set a fixed width and height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10),
          ),
          side: BorderSide(
            color: item.isSelected ?? false ? Colors.black : Colors.yellow,
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
              color: item.isSelected ?? false ? Colors.blueGrey : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderFuelController>(
      init: OrderFuelController(),
      builder: (controller) {
        return Scaffold(
          appBar: const MyAppbar(
            title: 'Order Fuel',
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {
                  if (controller.selectedIndex.value == 0) {
                    var item = controller.servicesList[0].data
                        ?.where((element) => element.isSelected!);

                    if ((item?.isNotEmpty ?? false) &&
                            item!.first.slug == 'diesel' ||
                        item!.first.slug == 'cng' ||
                        item.first.slug == 'petrol') {
                      Get.to(const SelectNewAddress(
                        isFromForLooking: true,
                        isFromOrderFuel: true,
                      ));
                    } else if ((item?.isNotEmpty ?? false) &&
                        item!.first.slug == 'ev') {
                      Get.to(EvVehicle(), arguments: item.first.id);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectNewAddress(
                                    isFromForLooking: true,
                                  )));
                    }
                  } else {
                    var item = controller.servicesList[1].data
                        ?.where((element) => element.isSelected!);

                    if ((item?.isNotEmpty ?? false) &&
                            item!.first.slug == 'diesel' ||
                        item!.first.slug == 'cng' ||
                        item.first.slug == 'petrol') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddVehicles()));
                    } else if ((item?.isNotEmpty ?? false) &&
                        item!.first.slug == 'ev') {
                      Get.to(
                          EvVehicle(
                            selectedIndex: 0,
                          ),
                          arguments: item.first.id);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectNewAddress(
                                    isFromForLooking: true,
                                  )));
                    }
                  }
                },
                child: const MyButton(text: 'Next')),
          ),
          body: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            tabWidget("Door Step Delivery", controller, 0),
                            tabWidget("Fuel to Go", controller, 1),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          controller.selectedIndex.value == 0
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      controller.servicesList[0].data?.length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    var item =
                                        controller.servicesList[0].data?[index];
                                    return customRadio(
                                        item?.name ?? '',
                                        controller.selectedIndex.value,
                                        controller,
                                        index,
                                        item!);
                                  },
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      controller.servicesList[1].data?.length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    var item =
                                        controller.servicesList[1].data?[index];
                                    return customRadio(item?.name ?? '',
                                        index + 1, controller, index, item!);
                                  },
                                )
                          /*customRadio("DIESEL", 1),
                    const SizedBox(
                      height: 20,
                    ),
                    customRadio("EV", 2),
                    const SizedBox(
                      height: 20,
                    ),
                    customRadio("CNG", 3),*/
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                ),
        );
      },
    );
  }

  tabWidget(String title, OrderFuelController controller, int index) {
    return InkWell(
      onTap: () {
        if (title == 'Door Step Delivery') {
          controller.changeIndexMethod(0);
        } else {
          controller.changeIndexMethod(1);
        }
      },
      child: Container(
        height: 45,
        width: 160,
        decoration: BoxDecoration(
          gradient: controller.selectedIndex.value == 0 && index == 0
              ? colors.buttonGradient
              : controller.selectedIndex.value == 1 && index == 1
                  ? colors.buttonGradient
                  : colors.unselectGradient,
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: controller.selectedIndex.value == 0 && index == 0
                ? colors.whiteTemp
                : controller.selectedIndex.value == 1 && index == 1
                    ? colors.whiteTemp
                    : colors.blackTemp,
          ),
        ),
      ),
    );
  }
}
