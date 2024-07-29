import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';
import 'package:test_prj/controller/address_controller.dart';

import '../helper/utils/validator_all.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Add Address'.tr),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKeyReset,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        validator: (value) => Validator.validateName(value),
                        controller: nameController,
                        labelText: Text("Name".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
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
                        validator: (value) => Validator.validatePhone(value),
                        controller: alternatemobileController,
                        labelText: Text("Alternate Mobile Number".tr),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        validator: (value) => Validator.validateName(value),
                        controller: houseNoController,
                        labelText: Text("House no., Building Name".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        validator: (value) => Validator.validateName(value),
                        controller: roadNameController,
                        labelText: Text("Road name, Area Colony".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        validator: (value) => Validator.validateName(value),
                        controller: countryController,
                        labelText: Text("Country".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        validator: (value) => Validator.validateName(value),
                        controller: stateController,
                        labelText: Text("State".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        validator: (value) => Validator.validateName(value),
                        controller: cityController,
                        labelText: Text("City".tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTextField(
                        isAmount: true,
                        validator: (value) => Validator.validateName(value),
                        controller: pincodeController,
                        labelText: Text("PinCode".tr),
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
                                if (_formKeyReset.currentState!.validate()) {
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
                                          "22.75",
                                          "35.85",
                                          "1")
                                      .then((value) {
                                    Fluttertoast.showToast(
                                        msg: "${value['message']}");
                                    controller.getAddRess();
                                  });

                                  Navigator.pop(context);
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
