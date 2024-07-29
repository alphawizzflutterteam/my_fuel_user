import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_button2.dart';
import 'package:test_prj/controller/asset_controller.dart';

import '../Home/FullAssets.dart';

class ProfileAssets extends StatefulWidget {
  const ProfileAssets({super.key});

  @override
  State<ProfileAssets> createState() => _ProfileAssetsState();
}

class _ProfileAssetsState extends State<ProfileAssets> {
  bool _index = true;

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
            backgroundColor: Colors.white,
            floatingActionButton: selectIndex == 2
                ? SizedBox()
                : Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.50),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    margin: EdgeInsets.symmetric(
                        horizontal:
                            16.0), // Optional padding for inner elements
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.white,
                      // backgroundColor: Colors.grey.shade200,
                      onPressed: () async {
                        var data = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyFullAssets(),
                            ));

                        if (data != null) {
                          controller.getAssets();
                        }
                        // Navigato
                        // Add your onPressed logic here
                      },
                      label: Text(
                        'Add Assets',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.black),
                      ),

                      // Optionally, adjust other properties like background color, elevation, etc.
                    ),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const MyAppbar(
                  title: "My Assets",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      Row(
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
                                      ? MyButton(text: "Door Step Delivery".tr)
                                      : DisButton(
                                          text: "Door Step Delivery".tr))),
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
                          ? Obx(() => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.66,
                                child: ListView.builder(
                                  itemCount: controller.dataList!.length!,
                                  shrinkWrap: true,
                                  physics: AlwaysScrollableScrollPhysics(),
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
                                          Text(
                                            "${controller.dataList![index].assetType}",
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
                                                    "Asset Name".tr,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade600),
                                                  ),
                                                  Text(
                                                    "${controller.dataList![index].name}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Asset Capacity/Power".tr,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade600),
                                                  ),
                                                  Text(
                                                    "${controller.dataList![index].capacity}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w800),
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
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              Text(
                                                "${controller.dataList![index].fuelCapacity}",
                                                style: TextStyle(
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.39,

                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 0.50),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15.0))),
                                                margin: EdgeInsets.symmetric(
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
                                                                          .dataList![
                                                                      index],
                                                                  update: true),
                                                        ));
                                                    // Navigato
                                                    // Add your onPressed logic here
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit_outlined,
                                                        color: Colors.black,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Edit Assets'.tr,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),

                                                  // Optionally, adjust other properties like background color, elevation, etc.
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.39,

                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 0.50),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15.0))),
                                                margin: EdgeInsets.symmetric(
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
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: Center(
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                    height: 32),
                                                                CircleAvatar(
                                                                    radius: 40,
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFFFFF7EF),
                                                                    child: Icon(
                                                                      Icons
                                                                          .delete,
                                                                      size: 44,
                                                                      color: Colors
                                                                          .red,
                                                                    )),
                                                                SizedBox(
                                                                    height: 20),
                                                                Text(
                                                                  "Are you Sure you want to"
                                                                      .tr,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "delete".tr,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 24),
                                                                Container(
                                                                  height: 48,
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              24),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      Get.back();
                                                                      controller
                                                                          .delete(controller
                                                                              .dataList![index]
                                                                              .id
                                                                              .toString())
                                                                          .then((value) {
                                                                        controller
                                                                            .getAssets();
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          56,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Color(0xFFF3B781F),
                                                                            Color(0xFF8AB402)
                                                                          ],
                                                                          stops: [
                                                                            0,
                                                                            1
                                                                          ],
                                                                          begin: AlignmentDirectional(
                                                                              0.94,
                                                                              -1),
                                                                          end: AlignmentDirectional(
                                                                              -0.94,
                                                                              1),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                          controller
                                                                              .delete(controller.dataList![index].id.toString())
                                                                              .then((value) {
                                                                            controller.getAssets();
                                                                          });
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          "Done"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold),
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
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.delete_outline,
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
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.black),
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
                                    );
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
}
