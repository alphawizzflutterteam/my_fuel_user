import 'dart:io';
//
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';
import 'package:test_prj/controller/address_controller.dart';

import '../helper/utils/app_constants.dart';
import '../helper/utils/validator_all.dart';
import '../splashScreen.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController alternatemobileController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController roadNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  final _formKeyReset = GlobalKey<FormState>();
  int selectedValueAddress = -1;
  int selectedValue = 1;

  LatLng? initialPosition;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _determinePosition();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.'.tr);
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
        return Future.error('Location permissions are denied'.tr);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.'
              .tr);
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

    setState(() {});
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Add Address'.tr),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customRadio("Home".tr, 1),
                  customRadio("Office".tr, 2),
                  customRadio("Other".tr, 3),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKeyReset,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        validator: (value) =>
                            Validator.validateWithhint(value, "Name".tr),
                        controller: nameController,
                        labelText: Text("Name".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        maxLenth: AppConstants.phoneValidation,
                        isAmount: true,
                        validator: (value) => Validator.validatePhone(value),
                        controller: mobileController,
                        labelText: Text("Mobile Number".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        isAmount: true,
                        maxLenth: AppConstants.phoneValidation,
                        validator: (value) => null,
                        // validator: (value) => Validator.validateWithhint(
                        //     value, "Alternate Mobile Number".tr),
                        controller: alternatemobileController,
                        labelText: Text("Alternate Mobile Number(Optional)".tr),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        validator: (value) => Validator.validateWithhint(
                            value, "House no., Building Name".tr),
                        controller: houseNoController,
                        labelText: Text("House no., Building Name".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlacePicker(
                                apiKey: Platform.isAndroid
                                    ? "AIzaSyDi_XlHtopewZHtpWWxIO-EQ7mCegHr5o0"
                                    : "AIzaSyDi_XlHtopewZHtpWWxIO-EQ7mCegHr5o0",
                                onPlacePicked: (result) {
                                  print(result.formattedAddress);
                                  setState(() {
                                    roadNameController.text =
                                        result.formattedAddress.toString();
                                    latitude = result.geometry!.location.lat
                                        .toString();
                                    longitude = result.geometry!.location.lng
                                        .toString();
                                  });
                                  Get.back();
                                  _getAddressFromLatLng();
                                },
                                selectInitialPosition: true,
                                usePinPointingSearch: true,
                                usePlaceDetailSearch: true,
                                zoomGesturesEnabled: true,
                                zoomControlsEnabled: true,
                                ignoreLocationPermissionErrors: true,
                                initialPosition: LatLng(
                                    double.parse(latitude.toString()),
                                    double.parse(longitude.toString())),
                                useCurrentLocation: true,
                              ),
                            ),
                          );
                        },
                        validator: (value) =>
                            Validator.validateWithhint(value, "Address".tr),
                        controller: roadNameController,
                        labelText: Text("Address".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        validator: (value) =>
                            Validator.validateWithhint(value, "Country".tr),
                        controller: countryController,
                        labelText: Text("Country".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        validator: (value) =>
                            Validator.validateWithhint(value, "State".tr),
                        controller: stateController,
                        labelText: Text("State".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        validator: (value) =>
                            Validator.validateWithhint(value, "City".tr),
                        controller: cityController,
                        labelText: Text("City".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        isAmount: true,
                        validator: (value) => Validator.validatePincodeWithhint(
                            value, "PinCode".tr),
                        controller: pincodeController,
                        maxLenth: AppConstants.pinValidation,
                        labelText: Text("Pincode".tr),
                      ),
                    ),
                    // _buildTextField(label: 'Name', hintText: 'Navin Pawa'),
                    // _buildTextField(label: 'Mobile Number'),
                    // _buildTextField(label: 'Alternate Mobile Number'),
                    // _buildTextField(label: 'House no., Building Name'),
                    // _buildTextField(label: 'Road name, Area Colony'),
                    // _buildTextField(label: 'Country'),
                    // _buildTextField(label: 'State'),
                    // _buildTextField(label: 'City'),
                    // _buildTextField(label: 'PinCode'),
                    SizedBox(
                      height: 20,
                    ),
                    GetBuilder<AddressController>(
                        init: AddressController(),
                        builder: (controller) {
                          return InkWell(
                              onTap: () {
                                if (mobileController.text.toString().length <
                                    10) {
                                  Fluttertoast.showToast(
                                      msg: "Please Enter 10 digit phone number"
                                          .tr);
                                  return;
                                }
                                if (alternatemobileController.text.isNotEmpty &&
                                    alternatemobileController.text
                                            .toString()
                                            .length <
                                        10) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Please Enter 10 digit alternate phone number"
                                              .tr);
                                  return;
                                }

                                if (pincodeController.text.toString().length <
                                    6) {
                                  Fluttertoast.showToast(
                                      msg: "Please Enter 6 digit pin code".tr);
                                  return;
                                }

                                if (_formKeyReset.currentState!.validate()) {
                                  controller
                                      .addAddress(
                                          nameController.text,
                                          mobileController.text,
                                          selectedValue == 1
                                              ? "Home"
                                              : selectedValue == 2
                                                  ? "Office"
                                                  : "Other",
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
                                    Fluttertoast.showToast(
                                        msg: "${value['message']}");
                                    controller.getAddRess();
                                    Get.back(result: "new ");
                                  });
                                }
                              },
                              child: MyButton(text: 'Save Address'.tr));
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getAddressFromLatLng() async {
    await placemarkFromCoordinates(double.parse(latitude.toString()),
            double.parse(longitude.toString()))
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      pincodeController.text = place.postalCode.toString();
      cityController.text = place.locality ?? '';
      stateController.text = place.administrativeArea ?? '';
      countryController.text = place.country ?? '';
      setState(() {
        print('${place.name}____________');
        print('${place.postalCode}____________');
        print('${place.administrativeArea}____________');
        print('${place.isoCountryCode}____________');
        print('${place.subAdministrativeArea}____________');
        print('${place.subLocality}____________');
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Widget _buildTextField({required String label, String? hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.red)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
    );
  }
}
