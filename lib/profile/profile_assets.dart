import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/Home/Evdoorbottom.dart';
import 'package:test_prj/Home/FuelAddQuantity.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_button2.dart';
import 'package:test_prj/controller/asset_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/vendors_page.dart';

import '../Home/FullAssets.dart';

class ProfileAssets extends StatefulWidget {
  final bool? isFromFuel;
  const ProfileAssets({super.key, this.isFromFuel});

  @override
  State<ProfileAssets> createState() => _ProfileAssetsState();
}

class _ProfileAssetsState extends State<ProfileAssets> {
  bool _index = true;
  final TextEditingController _fuelQuantityController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  void toggle() {
    setState(() {
      _index = !_index;
    });
  }

  int selectIndex = 1;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssetController>(
        init: AssetController(),
        builder: (controller) {
          controller.getAssets();
          return Scaffold(
            appBar: const MyAppbar(
              title: "My Assets",
            ),
            backgroundColor: Colors.white,
            floatingActionButton: selectIndex == 2
                ? const SizedBox()
                : widget.isFromFuel ?? false
                    ? Obx(() {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    controller.selectedButton.value = 0;

                                    var data = await Get.to(MyFullAssets());

                                    if (data != null) {
                                      controller.getAssets();
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        gradient:
                                            controller.selectedButton.value == 0
                                                ? colors.buttonGradient
                                                : colors.unselectGradient,
                                        border: Border.all(
                                            color: controller
                                                        .selectedButton.value ==
                                                    0
                                                ? colors.cardColor
                                                : colors.blackTemp,
                                            width: 0.50),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15.0))),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal:
                                            8), // Optional padding for inner elements
                                    child: Center(
                                      child: Text(
                                        'Add Assets',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: controller
                                                        .selectedButton.value ==
                                                    0
                                                ? colors.cardColor
                                                : colors.blackTemp),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    controller.selectedButton.value = 1;

                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) => Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: FueladdQuantity(
                                          controller: _fuelQuantityController,
                                          ontab: () {
                                            if (_fuelQuantityController
                                                .text.isEmpty) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'please add fuel quantity');
                                            } else {
                                              Navigator.pop(context);
                                              shoTimeSlot(controller);
                                            }
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 50,

                                    decoration: BoxDecoration(
                                        gradient:
                                            controller.selectedButton.value == 1
                                                ? colors.buttonGradient
                                                : colors.unselectGradient,
                                        border: Border.all(
                                            color: controller
                                                        .selectedButton.value ==
                                                    1
                                                ? colors.cardColor
                                                : colors.blackTemp,
                                            width: 0.50),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0))),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal:
                                            8), // Optional padding for inner elements
                                    child: Center(
                                      child: Text(
                                        'Order',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: controller
                                                        .selectedButton.value ==
                                                    1
                                                ? colors.cardColor
                                                : colors.blackTemp),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  var data = await Get.to(MyFullAssets());

                                  if (data != null) {
                                    controller.getAssets();
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      gradient: colors.unselectGradient,
                                      border: Border.all(
                                          color: colors.blackTemp, width: 0.50),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0))),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal:
                                          8), // Optional padding for inner elements
                                  child: const Center(
                                    child: Text(
                                      'Add Assets',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: colors.blackTemp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      widget.isFromFuel ?? false
                          ? const SizedBox()
                          : const SizedBox(height: 20),
                      widget.isFromFuel ?? false
                          ? const SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: 48,
                                    width: 160,
                                    child: InkWell(
                                        onTap: () {
                                          selectIndex = 1;
                                          setState(() {});
                                          // showModalBottomSheet(
                                          //   context: context,
                                          //   builder: (context) => const AddFuelQuantity(),
                                          // );
                                        },
                                        child: selectIndex == 1
                                            ? MyButton(
                                                text: "Door Step Delivery".tr)
                                            : DisButton(
                                                text:
                                                    "Door Step Delivery".tr))),
                                InkWell(
                                  onTap: () {
                                    selectIndex = 2;
                                    setState(() {});
                                  },
                                  child: SizedBox(
                                      height: 48,
                                      width: 160,
                                      child: selectIndex == 2
                                          ? MyButton(text: "Fuel to Go".tr)
                                          : DisButton(text: "Fuel to Go".tr)),
                                ),
                              ],
                            ),

                      // assets card
                      selectIndex == 1
                          ? Obx(() => SizedBox(
                                height: widget.isFromFuel ?? false
                                    ? MediaQuery.of(context).size.height * 0.75
                                    : MediaQuery.of(context).size.height * 0.66,
                                child: ListView.builder(
                                  itemCount: controller.assetDataList!.length!,
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Obx(() {
                                      return InkWell(
                                        onTap: widget.isFromFuel ?? false
                                            ? () {
                                                controller.selectedAsset.value =
                                                    index;
                                              }
                                            : null,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 16),
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: (widget.isFromFuel ??
                                                              false) &&
                                                          controller
                                                                  .selectedAsset
                                                                  .value ==
                                                              index
                                                      ? colors.darkYellow
                                                      : colors.transparent)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${controller.assetDataList![index].assetType}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              const SizedBox(height: 12),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Asset Name".tr,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey.shade600),
                                                      ),
                                                      Text(
                                                        "${controller.assetDataList![index].name}",
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Asset Capacity/Power"
                                                            .tr,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey.shade600),
                                                      ),
                                                      Text(
                                                        "${controller.assetDataList![index].capacity}",
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Fuel capacity".tr,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade600),
                                                  ),
                                                  Text(
                                                    "${controller.assetDataList![index].fuelCapacity}",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.39,

                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.black,
                                                            width: 0.50),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    15.0))),
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                            5.0), // Optional padding for inner elements
                                                    child: TextButton(
                                                      // backgroundColor: Colors.white,
                                                      // backgroundColor: Colors.grey.shade200,
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MyFullAssets(
                                                                      data: controller
                                                                              .assetDataList![
                                                                          index],
                                                                      update:
                                                                          true),
                                                            ));
                                                        // Navigato
                                                        // Add your onPressed logic here
                                                      },
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.edit_outlined,
                                                            color: Colors.black,
                                                            size: 20,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            'Edit Assets'.tr,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),

                                                      // Optionally, adjust other properties like background color, elevation, etc.
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.39,

                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.black,
                                                            width: 0.50),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    15.0))),
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                            5.0), // Optional padding for inner elements
                                                    child: TextButton(
                                                      // backgroundColor: Colors.white,
                                                      // backgroundColor: Colors.grey.shade200,
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              Dialog(
                                                            child: Container(
                                                              height: 292,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: Center(
                                                                child: Column(
                                                                  children: [
                                                                    const SizedBox(
                                                                        height:
                                                                            32),
                                                                    const CircleAvatar(
                                                                        radius:
                                                                            40,
                                                                        backgroundColor:
                                                                            Color(
                                                                                0xFFFFF7EF),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .delete,
                                                                          size:
                                                                              44,
                                                                          color:
                                                                              Colors.red,
                                                                        )),
                                                                    const SizedBox(
                                                                        height:
                                                                            20),
                                                                    Text(
                                                                      "Are you Sure you want to"
                                                                          .tr,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "delete"
                                                                          .tr,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            24),
                                                                    Container(
                                                                      height:
                                                                          48,
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              24),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                          controller
                                                                              .delete(controller.assetDataList![index].id.toString())
                                                                              .then((value) {
                                                                            controller.getAssets();
                                                                          });
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              56,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                const LinearGradient(
                                                                              colors: [
                                                                                Color(0xFFF3B781F),
                                                                                Color(0xFF8AB402)
                                                                              ],
                                                                              stops: [
                                                                                0,
                                                                                1
                                                                              ],
                                                                              begin: AlignmentDirectional(0.94, -1),
                                                                              end: AlignmentDirectional(-0.94, 1),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12),
                                                                          ),
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Get.back();
                                                                              controller.delete(controller.assetDataList![index].id.toString()).then((value) {
                                                                                controller.getAssets();
                                                                              });
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              "Done".tr,
                                                                              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                        // Navigato
                                                        // Add your onPressed logic here
                                                      },
                                                      child: const Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .delete_outline,
                                                            color: Colors.black,
                                                            size: 20,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            'Delete Assets',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),

                                                      // Optionally, adjust other properties like background color, elevation, etc.
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                ),
                              ))
                          : ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(top: 16),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Four Wheeler",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Vehicles Registration Number",
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              const Text(
                                                "ACD123456",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                    ],
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
        });
  }

  shoTimeSlot(AssetController controller) {
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
                  'from': 'asset',
                  'date': _dateController.text,
                  'selectedSlot': controller
                      .addAssetController
                      .timeslotList[controller.addAssetController.selectedSlot]
                      .id,
                  'vehicleType': '',
                  'registration': '',
                  'quantity': _fuelQuantityController.text,
                  'assetId': controller
                      .assetDataList?[controller.selectedAsset.value].id
                      .toString()
                });
              }
            },
            dateController: _dateController,
            onSelect: (index) {
              controller.addAssetController.selectedSlot = index;
              setState1(() {});
            },
            slotList: controller.addAssetController.timeslotList,
            selectedSlot: controller.addAssetController.selectedSlot,
          );
        },
      ),
    );
  }
}
