import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_prj/Home/checkout_car_service.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/checkout_page1.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/vendor_controller.dart';
import 'package:test_prj/orderfuel/fuelToGo/checkout_page2.dart';

import '../../Home/Genset_checkOut.dart';
import '../../Home/checkout_battery.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorController>(
      init: VendorController(),
      builder: (controller) {
        return Scaffold(
          appBar: const MyAppbar(title: "Vendors"),
          body: Obx(
            () {
              return controller.isLoading.value
                  ? controller.loader()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                // fuels price section
                                Container(
                                  height: 59,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(138, 180, 2, 200),
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(138, 180, 2, 10),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const GetSetCheckoutScreen(
                                                      isfrom: true,
                                                    )),
                                          );
                                        },
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "My Fuels Price",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "₹89.00",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromRGBO(
                                                      138, 180, 2, 1),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/Arrow - Down 2.png",
                                        height: 24,
                                      )
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                ListView.builder(
                                  itemCount: controller.vendorList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var item = controller.vendorList[index];

                                    return GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CheckOutTo(),
                                          )),
                                      child: Container(
                                        height: 102,
                                        margin:
                                            const EdgeInsets.only(bottom: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            children: [
                                              Image.network(
                                                  '${controller.splashController.settingModel.}',
                                                  height: 94),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Vendor Name",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          size: 18,
                                                          color: Color.fromRGBO(
                                                              242, 151, 15, 1),
                                                        ),
                                                        Text(
                                                          " 4.3",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    242,
                                                                    151,
                                                                    15,
                                                                    1),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "● ",
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey.shade500,
                                                          ),
                                                        ),
                                                        const Text(
                                                          "Diesel",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          size: 16,
                                                        ),
                                                        Text(
                                                          " 11Km",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        SizedBox(width: 86),
                                                        Text(
                                                          "₹89.00",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      138,
                                                                      180,
                                                                      2,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              height: 1),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
            },
          ),
        );
      },
    );
  }
}
