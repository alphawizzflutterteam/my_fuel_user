import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:test_prj/SelectNewAddress.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/cart_controller.dart';
import 'package:test_prj/controller/home_controller.dart';
import 'package:test_prj/helper/colors.dart';

import '../components/my_appbar.dart';

class FuelOnTabScreen extends StatefulWidget {
  final String? title;

  FuelOnTabScreen({super.key, this.title});

  @override
  State<FuelOnTabScreen> createState() => _FuelOnTabScreenState();
}

class _FuelOnTabScreenState extends State<FuelOnTabScreen> {
  int _selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Scaffold(
            appBar: MyAppFinalbar(
              title: 'Fuel On Tab',
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Obx(() => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.grey),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      '${homeController.servicesDetailModel.value.products![_selectedRadio].name}',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '₹${homeController.servicesDetailModel.value.products![_selectedRadio].unitPrice.toString()}',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: colors.greenTemp,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(height: 20.0),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: homeController
                                .servicesDetailModel.value.products!.length,
                            itemBuilder: (context, index) {
                              return _buildRadioOption(index,
                                  '${homeController.servicesDetailModel.value.products![index].name}');
                            },
                          ),
                          // _buildRadioOption(0, '0.5 KL DU 1'),
                          // _buildRadioOption(1, '0.5 KL DU 2'),
                          // _buildRadioOption(2, '1 KL DU 1'),
                          // _buildRadioOption(3, '1 KL DU 2'),
                          // _buildRadioOption(4, '2 KL DU 1'),
                          // _buildRadioOption(5, '2 KL DU 2'),
                          // _buildRadioOption(6, 'Other'),
                          SizedBox(
                            height: 20,
                          ),
                          GetBuilder<CartController>(builder: (cartcontroller) {
                            return Obx(
                                () => cartcontroller.isLoading.value == true
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          cartcontroller.AddTocart(
                                                  homeController
                                                      .servicesDetailModel
                                                      .value
                                                      .products![_selectedRadio]
                                                      .id
                                                      .toString())
                                              .then((value) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SelectNewAddress(
                                                    isFromFuelOnTab: true,
                                                  ),
                                                ));
                                          });
                                        },
                                        child: const MyButton(text: 'Next'),
                                      ));
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _selectedRadio = value;
    });
  }

  Widget _buildRadioOption(int value, String text) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: colors.greyTemp.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text,
              style: const TextStyle(fontSize: 16.0, color: colors.greyTemp)),
          Radio(
              // Change the active radio button color here
              fillColor: MaterialStateProperty.all(colors.primary),
              value: value,
              groupValue: _selectedRadio,
              onChanged: (int? value) {
                _handleRadioValueChange(value ?? 0);
              }),
        ],
      ),
    );
  }
}
