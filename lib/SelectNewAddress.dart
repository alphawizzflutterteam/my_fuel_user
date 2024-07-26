import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/address_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/orderfuel/EV/checkout_page.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_form.dart';
import 'package:test_prj/payment/payment_page.dart';
import 'package:test_prj/profile/My_Address.dart';
import 'package:test_prj/profile/add_address.dart';
import 'package:test_prj/routes/app_routes.dart';
import 'package:test_prj/splashScreen.dart';

import 'Home/Genset_checkOut.dart';
import 'Home/checkout_car_service.dart';
import 'Home/fuel_ontab_checkout.dart';
import 'orderfuel/EV/charginStationDetails.dart';
import 'orderfuel/doorStepDelivery/my_assets.dart';

class SelectNewAddress extends StatefulWidget {
  final bool? isFromFuelOnTab;
  final bool? isFromForLooking;
  final bool? isFromFGenSet;
  SelectNewAddress(
      {super.key,
      this.isFromFuelOnTab = false,
      this.isFromForLooking = false,
      this.isFromFGenSet = false});

  @override
  State<SelectNewAddress> createState() => _SelectNewAddressState();
}

class _SelectNewAddressState extends State<SelectNewAddress> {
  int selectedValue = 1;
  int selectedValueAddress = -1;
  bool isChecked = false;
  bool isCheckedAddress = false;

  Widget customRadio(String text, int value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedValue = value;
        });
      },
      child: Row(
        children: [
          Radio<int>(
            value: value,
            groupValue: selectedValue,
            onChanged: (int? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            activeColor: Colors.red,
          ),
          Text(
            text,
            style: TextStyle(
              color: selectedValue == value ? Colors.black : Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (controller) {
          controller.getAddRess();
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 20,
                ),
              ),
              foregroundColor: Colors.white,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(252, 130, 59, 1),
                      Color.fromRGBO(252, 130, 59, 1),
                      Color.fromRGBO(211, 83, 7, 1),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(23),
                    bottomRight: Radius.circular(23),
                  ),
                ),
              ),
              title: const Text('Select Address'),
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Shipping Address',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 155,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromRGBO(138, 180, 2, 1),
                                      Color.fromRGBO(59, 120, 31, 1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.my_location,
                                          color: colors.whiteTemp,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Use My Location',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ) // MyButton(text: 'Use my location'),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AddAddressScreen(),
                                      ));
                                },
                                child: Container(
                                  height: 50,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(138, 180, 2, 1),
                                        Color.fromRGBO(59, 120, 31, 1),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddAddressScreen(),
                                            ));
                                      },
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.add,
                                            color: colors.whiteTemp,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'New Address',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ) // MyButton(text: 'Use my location'),
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => ()));
                          },
                        ),
                      ),
                    ),
                    //SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Select Delivery type',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    //SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customRadio("Home", 1),
                          customRadio("Office", 2),
                          customRadio("Other", 3),
                        ],
                      ),
                    ),
                    Obx(() => controller.addressAList.length > 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.addressAList.length,
                            // .value.products!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 231, 229, 229),
                                      ),
                                      height: 87,
                                      width: MediaQuery.sizeOf(context).width,
                                      //     width: 500,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Row(
                                            //   mainAxisAlignment: MainAxisAlignment.end,
                                            //   children: [
                                            //     Padding(
                                            //       padding: const EdgeInsets.only(
                                            //         right: 20,
                                            //       ),
                                            //     )
                                            //   ],
                                            // ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${controller.addressAList[index].contactPersonName},${controller.addressAList[index].zip}',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Checkbox(
                                                  activeColor:
                                                      Colors.deepOrange,
                                                  checkColor: Colors.white,
                                                  value: selectedValueAddress ==
                                                          index
                                                      ? true
                                                      : false,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      selectedValueAddress =
                                                          index;
                                                      isCheckedAddress =
                                                          newValue!;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${controller.addressAList[index].building},${controller.addressAList[index].landmark} ${controller.addressAList[index].city} ',
                                              // 'sobari nagar,sukhliya..',
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                ],
                              );
                            },
                          )
                        : Center(
                            child: Text("No Address Foound"),
                          )),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Billing Address',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),

                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            isChecked = value!;
                            setState(() {});
                          },
                        ),
                        const Text(
                          'Same as Shipping address',
                          style: TextStyle(color: colors.greyTemp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Name'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Enter your name',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: const Text('Mobile Number'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Enter your Mobile number',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Alternate Mobile number'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Enter your Alternate Mobile number',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('House no., Building Name'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Enter your Home no.. Building Name',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Road name ,Area Colony'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Enter your Road name ,area colony',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Country'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Colors.red), //
                            ),
                            hintText: 'Enter your country name',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: const Text('State'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Enter your State name',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('City '),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Enter your city name',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Pincode'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Enter your Pincode ',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: const MyButton(text: 'Save Address & Next'),
                          onTap: () {
                            if (widget.isFromFuelOnTab != null &&
                                widget.isFromFuelOnTab!) {
                              Get.toNamed(Routes.FUEL_CHECKOUT, arguments: {
                                'address_id': controller
                                    .addressAList[selectedValueAddress].id,
                                'category_id': '${categoryId}',
                              });
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             FuelOnTabCheckoutScreen(
                              //               isFromFuelOnTap:
                              //                   widget.isFromFuelOnTab,
                              //             )));
                            } else if (widget.isFromForLooking ?? false) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyAssets()));
                            } else if (widget.isFromFGenSet ?? false) {
                              Get.toNamed(Routes.GENSET_CHECKOUT, arguments: {
                                'address_id': controller
                                    .addressAList[selectedValueAddress].id,
                                'category_id': '${categoryId}',
                              });
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const GetSetCheckoutScreen()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentScreenTree()));
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
