import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/orderfuel/EV/checkout_page.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_form.dart';
import 'package:test_prj/payment/payment_page.dart';

import 'Home/Genset_checkOut.dart';
import 'Home/checkout_car_service.dart';
import 'Home/fuel_ontab_checkout.dart';
import 'orderfuel/EV/charginStationDetails.dart';
import 'orderfuel/doorStepDelivery/my_assets.dart';

class SelectNewAddress extends StatefulWidget {
  const SelectNewAddress(
      {super.key,
      this.isFromFuelOnTab,
      this.isFromForLooking,
      this.isFromFGenSet});
  final bool? isFromFuelOnTab;
  final bool? isFromForLooking;
  final bool? isFromFGenSet;
  @override
  State<SelectNewAddress> createState() => _SelectNewAddressState();
}

class _SelectNewAddressState extends State<SelectNewAddress> {
  int selectedValue = 1;
  bool isChecked = false;

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
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new_outlined,
          size: 20,
        ),
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                Color.fromRGBO(211, 83, 7, 1),
                Color.fromRGBO(252, 130, 59, 1),
                Color.fromRGBO(252, 130, 59, 1),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                                        color: Colors.white, fontSize: 12),
                                  ) // MyButton(text: 'Use my location'),
                                ],
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
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
                                    Icons.add,
                                    color: colors.whiteTemp,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'New Address',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ) // MyButton(text: 'Use my location'),
                                ],
                              )),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 231, 229, 229),
                  ),
                  height: 65,
                  width: MediaQuery.sizeOf(context).width,
                  //     width: 500,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text(
                          'Navin Yadav,452010',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'G-14 1st sobari nagar,sukhliya..',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Billing Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                        borderSide: const BorderSide(color: Colors.red), //
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
              // SizedBox(
              //   height: 70,
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: TextFormField(
              //       decoration: InputDecoration(
              //         label: Text('Road name,Area '),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(12),
              //         ),
              //         hintText: 'Enter your Road name ,area colony',
              //         hintStyle: TextStyle(color: Colors.grey),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: const MyButton(text: 'Save Address'),
                    onTap: () {
                      if (widget.isFromFuelOnTab != null &&
                          widget.isFromFuelOnTab!) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FuelOnTabCheckoutScreen(
                                      isFromFuelOnTap: widget.isFromFuelOnTab,
                                    )));
                      } else if (widget.isFromForLooking ?? false) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyAssets()));
                      } else if (widget.isFromFGenSet ?? false) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const GetSetCheckoutScreen()));
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
  }
}
