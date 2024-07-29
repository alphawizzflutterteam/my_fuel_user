import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/order_fuel_controller.dart';
import 'package:test_prj/orderfuel/fuelToGo/fuelToGo.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/my_assets.dart';
import '../../SelectNewAddress.dart';
import '../EV/evVehicle.dart';

class LookingForCompany extends StatefulWidget {
  const LookingForCompany({super.key});

  @override
  State<LookingForCompany> createState() => _LookingForCompanyState();
}

class _LookingForCompanyState extends State<LookingForCompany> {
  int selected = 0;

  Widget customRadio(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(280, 50), // Set a fixed width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        side: BorderSide(
          color: (selected == index) ? Colors.black : Colors.yellow,
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            color: (selected == index) ? Colors.blueGrey : Colors.black,
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
          body: controller.isLoading
              ? Center(
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
                                        item?.name ?? '', index + 1);
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
                                    return customRadio(
                                        item?.name ?? '', index + 1);
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                          onTap: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                if (selected == 1) {
                                  return SelectNewAddress(
                                    isFromForLooking: true,
                                  );
                                } else if (selected == 2) {
                                  return EvVehicle(
                                    selectedIndex: 0,
                                  );
                                } else if (selected == 3) {
                                  return const LookingForCompany();
                                } else {
                                  return const LookingForCompany();
                                }
                              })),
                          child: const MyButton(text: 'Next')),
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
