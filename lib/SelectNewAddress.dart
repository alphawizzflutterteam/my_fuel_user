import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/address_controller.dart';
import 'package:test_prj/controller/profile_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/home_page.dart';
import 'package:test_prj/orderfuel/EV/checkout_page.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/order_fuel_checkout.dart';
import 'package:test_prj/payment/paymentScreen.dart';

import 'package:test_prj/profile/add_address.dart';
import 'package:test_prj/profile/profile_assets.dart';
import 'package:test_prj/routes/app_routes.dart';
import 'package:test_prj/splashScreen.dart';
// import 'package:location/location.dart';

import 'Home/checkout_car_service.dart';

import 'components/my_textfield.dart';
import 'helper/utils/app_constants.dart';
import 'helper/utils/validator_all.dart';
import 'orderfuel/doorStepDelivery/my_assets.dart';

class SelectNewAddress extends StatefulWidget {
  final bool? isFromFuelOnTab;
  final bool? isFromOrderFuel;
  final bool? isFromEv;
  final bool? isFromForLooking;
  final bool? isFromFGenSet;
  const SelectNewAddress(
      {super.key,
      this.isFromFuelOnTab = false,
      this.isFromForLooking = false,
      this.isFromFGenSet = false,
      this.isFromOrderFuel,
      this.isFromEv});

  @override
  State<SelectNewAddress> createState() => _SelectNewAddressState();
}

class _SelectNewAddressState extends State<SelectNewAddress> {
  RxInt selectedValue = 1.obs;
  RxInt selectedValueAddress = 0.obs;
  final _formKeyReset = GlobalKey<FormState>();
  bool isCheckedAddress = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController alternatemobileController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController roadNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  String? _latitude;
  String? _longitude;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    print("object position $position");
    print("object position ${position.toJson()}");

    List<Placemark> placemark = await placemarkFromCoordinates(
        double.parse(position.latitude!.toString()),
        double.parse(position.longitude!.toString()),
        localeIdentifier: "en");

    latitude = position.latitude!.toString();
    longitude = position.longitude!.toString();

    placemark.toList(growable: true);

    Placemark place = placemark[0];

    address =
        "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";

    ProfileController profileController = Get.put(ProfileController());
    AddressController addressController = Get.put(AddressController());

    addressController
        .addAddress(
            profileController.userInfoModel.value.fName ?? fName.toString(),
            profileController.userInfoModel.value.phone ?? Phone.toString(),
            "Home",
            place.street.toString(),
            place.locality.toString(),
            place.locality.toString(),
            place.country.toString(),
            place.administrativeArea.toString(),
            place.locality.toString(),
            place.postalCode.toString(),
            "${latitude}",
            "${longitude}",
            "1")
        .then((value) {
      addressController.getAddRess().then((value) {
        setState(() {});
      });
    });

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget customRadio(String text, int value) {
    return Obx(
      () {
        return GestureDetector(
          onTap: () {
            selectedValue.value = value;
          },
          child: Row(
            children: [
              Radio<int>(
                value: value,
                groupValue: selectedValue.value,
                onChanged: (int? newValue) {
                  selectedValue.value = newValue!;
                },
                activeColor: Colors.red,
              ),
              Text(
                text,
                style: TextStyle(
                  color: selectedValue.value == value
                      ? Colors.black
                      : Colors.blueGrey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (controller) {
          return Scaffold(
            appBar: MyAppbar(
              title: 'Select Address'.tr,
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 50,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: MyButton(text: 'Save Address & Next'.tr),
                    onTap: () {
                      print("objectcategoryId ${categoryId}");

                      ///for OrderFuelFlow
                      if (widget.isFromOrderFuel ?? false) {
                        checkAndNavigate(controller, 'orderFuel');
                      } else if (widget.isFromEv ?? false) {
                        checkAndNavigate(controller, 'ev');
                      } else if (categoryId == "9" ||
                          categoryId == "16" ||
                          categoryId == "10" ||
                          categoryId == "11" ||
                          categoryId == "10" ||
                          categoryId == "8") {
                        print('__________________');

                        if (controller.addressAList.isEmpty) {
                          Fluttertoast.showToast(msg: "Please Select Address");
                          return;
                        }
                        otherCategory.billingAddressId = controller
                            .addressAList[selectedValueAddress.value].id
                            .toString();

                        checkAndNavigate(controller, 'CarCheckOut');

                        //if check Same
                      } else if (widget.isFromFuelOnTab != null &&
                          widget.isFromFuelOnTab!) {
                        Get.toNamed(Routes.FUEL_CHECKOUT, arguments: {
                          'address_id': controller
                              .addressAList[selectedValueAddress.value].id,
                          'category_id': '${categoryId}',
                        });
                      } /* else if (widget.isFromForLooking ?? false) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyAssets()));
                      }*/
                      else if (widget.isFromFGenSet ?? false) {
                        Get.toNamed(Routes.GENSET_CHECKOUT, arguments: {
                          'address_id': controller
                              .addressAList[selectedValueAddress.value].id,
                          'category_id': '${categoryId}',
                        });
                      } else {
                        // if()

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
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                controller.getAddRess();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Shipping Address'.tr,
                          style: const TextStyle(
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
                                    gradient: colors.buttonGradient,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  child: TextButton(
                                      onPressed: () {
                                        _determinePosition();
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.my_location,
                                            color: colors.whiteTemp,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Use My Location'.tr,
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
                                      gradient: colors.buttonGradient,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: TextButton(
                                        onPressed: () async {
                                          var data = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddAddressScreen(),
                                              ));

                                          if (data != null) {
                                            controller
                                                .getAddRess()
                                                .then((value) {});
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: colors.whiteTemp,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'New Address'.tr,
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
                      /*Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Select Delivery type'.tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),*/
                      //SizedBox(height: 10),

                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       customRadio("Home".tr, 1),
                      //       customRadio("Office".tr, 2),
                      //       customRadio("Other".tr, 3),
                      //     ],
                      //   ),
                      // ),
                      Obx(() => controller.addressAList.isNotEmpty
                          ? Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.isTab.value
                                      ? 1
                                      : controller.addressAList.length,
                                  // .value.products!.length,
                                  itemBuilder: (context, index) {
                                    return Obx(() {
                                      return InkWell(
                                        onTap: () {
                                          selectedValueAddress.value = index;
                                        },
                                        child: Stack(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            colors.myCardColor,
                                                        border: Border.all(
                                                            color: selectedValueAddress
                                                                        .value ==
                                                                    index
                                                                ? colors
                                                                    .darkYellow
                                                                : colors
                                                                    .transparent)),
                                                    //height: 87,
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    //     width: 500,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10.0,
                                                          vertical: 15),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
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
                                                              Container(
                                                                width: 250,
                                                                child: Text(
                                                                  '${controller.addressAList[index].contactPersonName},${controller.addressAList[index].zip}',
                                                                  style: const TextStyle(
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              /*Checkbox(
                                                          activeColor:
                                                              Colors.deepOrange,
                                                          checkColor: Colors.white,
                                                          value: selectedValueAddress ==
                                                                  index
                                                              ? true
                                                              : false,
                                                          onChanged: (bool? newValue) {
                                                            setState(() {
                                                              selectedValueAddress = index;
                                                              isCheckedAddress = newValue!;
                                                            });
                                                          },
                                                        ),*/
                                                            ],
                                                          ),
                                                          Text(
                                                            '${controller.addressAList[index].building},${controller.addressAList[index].landmark} ${controller.addressAList[index].city} ',
                                                            // 'sobari nagar,sukhliya..',
                                                            style: const TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // const SizedBox(height: 10.0),
                                              ],
                                            ),
                                            Positioned(
                                                top: 15,
                                                right: 15,
                                                child: Container(
                                                  height: 24,
                                                  width: 57,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: colors.primary
                                                          .withOpacity(.1),
                                                      border: Border.all(
                                                          color:
                                                              colors.primary)),
                                                  child: Center(
                                                    child: Text(
                                                      '${controller.addressAList[index].addressType}'
                                                          .tr,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: colors.primary,
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.isTab.value =
                                          !controller.isTab.value;
                                    },
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(controller.isTab.value
                                          ? 'See more...'
                                          : 'See less...'),
                                    ))
                              ],
                            )
                          : Center(
                              child: Text("No Address Found".tr),
                            )),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'Billing Address'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),

                      Obx(() {
                        return Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.deepOrange,
                              value: controller.isBillDeilivery.value,
                              onChanged: (value) {
                                controller.isBillDeilivery.value = value!;
                              },
                            ),
                            Text(
                              'Same as Shipping address'.tr,
                              style: const TextStyle(color: colors.greyTemp),
                            )
                          ],
                        );
                      }),

                      Obx(() {
                        return Visibility(
                          visible: !controller.isBillDeilivery.value,
                          child: SizedBox(
                            height: Get.height / 2.7,
                            child: SingleChildScrollView(
                              padding: EdgeInsets.zero,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Form(
                                      key: _formKeyReset,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: MyTextField(
                                              validator: (value) =>
                                                  Validator.validateName(value),
                                              controller: nameController,
                                              labelText: Text("Name".tr),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: MyTextField(
                                              isAmount: true,
                                              maxLenth:
                                                  AppConstants.phoneValidation,
                                              validator: (value) =>
                                                  Validator.validatePhone(
                                                      value),
                                              controller: mobileController,
                                              labelText:
                                                  Text("Mobile Number".tr),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: MyTextField(
                                              isAmount: true,
                                              maxLenth:
                                                  AppConstants.phoneValidation,
                                              validator: (value) => null,
                                              // validator: (value) => Validator.validateWithhint(
                                              //     value, "Alternate Mobile Number".tr),
                                              controller:
                                                  alternatemobileController,
                                              labelText: Text(
                                                  "Alternate Mobile Number(Optional)"
                                                      .tr),
                                            ),
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.symmetric(
                                          //       vertical: 8.0),
                                          //   child: MyTextField(
                                          //     maxLenth:
                                          //         AppConstants.phoneValidation,
                                          //     isAmount: true,
                                          //     validator: (value) =>
                                          //         Validator.validatePhone(
                                          //             value),
                                          //     controller:
                                          //         alternatemobileController,
                                          //     labelText: Text(
                                          //         "Alternate Mobile Number".tr),
                                          //   ),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: MyTextField(
                                              validator: (value) =>
                                                  Validator.validateWithhint(
                                                      value,
                                                      "House no., Building Name"
                                                          .tr),
                                              controller: houseNoController,
                                              labelText: Text(
                                                  "House no., Building Name"
                                                      .tr),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: MyTextField(
                                              validator: (value) =>
                                                  Validator.validateWithhint(
                                                      value,
                                                      "Road name, Area Colony"
                                                          .tr),
                                              controller: roadNameController,
                                              labelText: Text(
                                                  "Road name, Area Colony".tr),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: MyTextField(
                                              validator: (value) =>
                                                  Validator.validateWithhint(
                                                      value, "Country".tr),
                                              controller: countryController,
                                              labelText: Text("Country".tr),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: MyTextField(
                                              validator: (value) =>
                                                  Validator.validateWithhint(
                                                      value, "State".tr),
                                              controller: stateController,
                                              labelText: Text("State".tr),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: MyTextField(
                                              validator: (value) =>
                                                  Validator.validateWithhint(
                                                      value, "City".tr),
                                              controller: cityController,
                                              labelText: Text("City".tr),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: MyTextField(
                                              maxLenth:
                                                  AppConstants.pinValidation,
                                              isAmount: true,
                                              validator: (value) => Validator
                                                  .validatePincodeWithhint(
                                                      value, "Pincode".tr),
                                              controller: pincodeController,
                                              labelText: Text("Pincode".tr),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  // SizedBox(
                                  //   height: 70,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(10.0),
                                  //     child: TextFormField(
                                  //       decoration: InputDecoration(
                                  //         label: const Text('Name'),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(12),
                                  //         ),
                                  //         hintText: 'Enter your name',
                                  //         hintStyle: const TextStyle(color: Colors.grey),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 70,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(10.0),
                                  //     child: TextFormField(
                                  //       keyboardType: TextInputType.number,
                                  //       decoration: InputDecoration(
                                  //         label: const Text('Mobile Number'),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(12),
                                  //         ),
                                  //         hintText: 'Enter your Mobile number',
                                  //         hintStyle: const TextStyle(color: Colors.grey),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 70,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(10.0),
                                  //     child: TextFormField(
                                  //       decoration: InputDecoration(
                                  //         label: const Text('Alternate Mobile number'),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(12),
                                  //         ),
                                  //         hintText: 'Enter your Alternate Mobile number',
                                  //         hintStyle: const TextStyle(color: Colors.grey),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 70,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(10.0),
                                  //     child: TextFormField(
                                  //       decoration: InputDecoration(
                                  //         label: const Text('House no., Building Name'),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(12),
                                  //         ),
                                  //         hintText: 'Enter your Home no.. Building Name',
                                  //         hintStyle: const TextStyle(color: Colors.grey),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 70,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(10.0),
                                  //     child: TextFormField(
                                  //       decoration: InputDecoration(
                                  //         label: const Text('Road name ,Area Colony'),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(12),
                                  //         ),
                                  //         hintText: 'Enter your Road name ,area colony',
                                  //         hintStyle: const TextStyle(color: Colors.grey),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  //
                                  // SizedBox(
                                  //   height: 70,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(10.0),
                                  //     child: TextFormField(
                                  //       decoration: InputDecoration(
                                  //         label: const Text('Country'),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(12),
                                  //           borderSide:
                                  //           const BorderSide(color: Colors.red), //
                                  //         ),
                                  //         hintText: 'Enter your country name',
                                  //         hintStyle: const TextStyle(color: Colors.grey),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 70,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(10.0),
                                  //     child: TextFormField(
                                  //       keyboardType: TextInputType.number,
                                  //       decoration: InputDecoration(
                                  //         label: const Text('State'),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(12),
                                  //         ),
                                  //         hintText: 'Enter your State name',
                                  //         hintStyle: const TextStyle(color: Colors.grey),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 70,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(10.0),
                                  //     child: TextFormField(
                                  //       decoration: InputDecoration(
                                  //         label: const Text('City '),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(12),
                                  //         ),
                                  //         hintText: 'Enter your city name',
                                  //         hintStyle: const TextStyle(color: Colors.grey),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 70,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(10.0),
                                  //     child: TextFormField(
                                  //       decoration: InputDecoration(
                                  //         label: const Text('Pincode'),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(12),
                                  //         ),
                                  //         hintText: 'Enter your Pincode ',
                                  //         hintStyle: const TextStyle(color: Colors.grey),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  checkAndNavigate(AddressController controller, String title) {
    otherCategory.shippingAddressId =
        controller.addressAList[selectedValueAddress.value].id.toString();
    if (controller.isBillDeilivery.value == true) {
      otherCategory.billingSameAsShipping = "1";
      otherCategory.billingAddressId =
          controller.addressAList[selectedValueAddress.value].id.toString();
      if (title == 'orderFuel') {
        Get.to(const ProfileAssets(
          isFromFuel: true,
        ));
      } else if (title == 'ev') {
        Navigator.pop(context, true);
      } else {
        Get.toNamed(Routes.CarCheckout);
      }
    } else {
      otherCategory.billingSameAsShipping = "0";
      if (_formKeyReset.currentState!.validate()) {
        if (mobileController.text.toString().length < 10) {
          Fluttertoast.showToast(msg: "Please enter valid mobile".tr);
          return;
        }
        controller
            .addAddress(
                nameController.text,
                mobileController.text,
                "Home",
                houseNoController.text.toString(),
                roadNameController.text.toString(),
                roadNameController.text.toString(),
                countryController.text.toString(),
                stateController.text.toString(),
                cityController.text.toString(),
                pincodeController.text.toString(),
                "${latitude}",
                "${longitude}",
                "1")
            .then((value) {
          otherCategory.billingSameAsShipping = "0";
          otherCategory.billingAddressId = "${value['id'].toString()}";

          if (title == 'orderFuel') {
            Get.to(const ProfileAssets(
              isFromFuel: true,
            ));
          } else {
            Get.to(Routes.CarCheckout);
          }
        });
      }
    }
  }
}
