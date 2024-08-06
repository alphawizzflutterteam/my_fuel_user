import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/helper/colors.dart';

import '../controller/address_controller.dart';
import 'add_address.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (controller) {
          // controller.getAddRess();
          return Scaffold(
            appBar: MyAppbar(title: 'Address'.tr),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: [
                  InkWell(
                      onTap: () async {
                        var data = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddAddressScreen(),
                            ));

                        if (data != null) {
                          controller.getAddRess();
                        }
                      },
                      child: MyButton(text: 'New Address'.tr)),
                  Positioned(
                      top: 14,
                      left: 85,
                      child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: colors.whiteTemp)),
                          child: Center(
                              child: Icon(
                            Icons.add,
                            size: 18,
                            color: colors.whiteTemp,
                          ))))
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Obx(() => controller.addressAList.value.length == 0
                            ? Container()
                            : controller.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    physics: AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.addressAList.value.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          AddressCard(
                                            id: "${controller.addressAList.value[index].id}",
                                            name:
                                                "${controller.addressAList.value[index].contactPersonName},${controller.addressAList.value[index].zip}",
                                            address:
                                                "${controller.addressAList.value[index].building}"
                                                "${controller.addressAList.value[index].addressType},${controller.addressAList.value[index].address}",
                                            label:
                                                "${controller.addressAList.value[index].addressType}",
                                          ),
                                          const SizedBox(height: 10.0),
                                        ],
                                      );
                                    },
                                  )),
                        // AddressCard(
                        //   name: "Navin Yadav, 452010",
                        //   address: "G-14 1st sabari nagar, sukhliya...",
                        //   label: "Home",
                        // ),
                        // const SizedBox(height: 10.0),
                        // AddressCard(
                        //   name: "Navin Yadav, 452010",
                        //   address: "G-14 1st sabari nagar, sukhliya...",
                        //   label: "Office",
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 1.9,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class AddressCard extends StatelessWidget {
  final String id;
  final String name;
  final String address;
  final String label;

  AddressCard({
    required this.id,
    required this.name,
    required this.address,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 250,
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(height: 4.0),
              Container(
                width: 250,
                child: Text(
                  address,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<AddressController>(
              init: AddressController(),
              builder: (addressController) {
                return Column(
                  children: [
                    InkWell(
                        onTap: () async {
                          final result = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Alert'.tr),
                              content: Text(
                                  'Are you sure want to delete address?'.tr),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: Text('Cancel'.tr),
                                ),
                                TextButton(
                                  onPressed: () {
                                    addressController.delete(id).then((value) {
                                      addressController.getAddRess();
                                    });

                                    Navigator.pop(context, true);
                                  },
                                  child: Text('Delete'.tr),
                                ),
                              ],
                            ),
                          );

                          if (result == null || !result) {
                            return;
                          }
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    Text(
                      label,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
