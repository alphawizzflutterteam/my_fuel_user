import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_form.dart';
import 'package:test_prj/payment/payment_page.dart';

class Evcheckout extends StatefulWidget {
  final bool? isFromFuelOnTap;

  const Evcheckout({super.key, this.isFromFuelOnTap});

  @override
  State<Evcheckout> createState() =>
      _EvcheckoutState();
}

class _EvcheckoutState extends State<Evcheckout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
          ),
        ),
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
        title: Text('Checkout'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child:  InkWell(

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  PaymentScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: const MyButton(text: 'Checkout'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentScreenTree(
                            isFromFuelOnTap: widget.isFromFuelOnTap,
                          )));
                },
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(245, 245, 245, 1),
              ),
              // height: 105,
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Scheduled Date and Time',
                    // style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '11:00 Pm to 12:00 Pm',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '13 jan 2024,mon',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Container(
                      //   height: 24,
                      //   width: 57,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(4),
                      //       color: colors.primary.withOpacity(.1),
                      //       border: Border.all(color: colors.primary)),
                      //   child: const Center(
                      //     child: Text(
                      //       'Home',
                      //       style: TextStyle(
                      //         fontSize: 12,
                      //         color: colors.primary,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  /*SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.blackTemp)),
                    child: Center(
                        child: Text(
                      'Change or add new address',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  )*/
                ],
              ),
            ),
          ),
          /*Container(
            width: MediaQuery.sizeOf(context).width,
            color: colors.lightgray,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scheduled Date and Time',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '11:00 to 12:00',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '13 jan 2024,Man',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),*/
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "Fuel On Tap Detail",
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                // Text(
                //   "0.5 KL DU 1",
                //   style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: colors.greyTemp),
                // )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Price Detail",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MRP(1 items)",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      "₹120,00",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery free",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      "₹0",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discount",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      "₹80",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(
                  // thickness: 2,
                  color: Colors.black26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "₹12000",
                      style: TextStyle(
                        fontSize: 18,
                        color: colors.greenTemp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  // thickness: 2,
                  color: Colors.black26,
                ),
                const SizedBox(height: 100),
            SizedBox(height: 100,),
            TextFormField(
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 16),
                labelText: "Need to Update Pricing",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  borderSide: new BorderSide(),
                ),
              ),
            ),
        ],
      ),
    )
    ]
      )
    );
  }
}
