import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_form.dart';

import '../helper/utils/app_constants.dart';

class Checkout_Battery extends StatefulWidget {
  const Checkout_Battery({super.key});

  @override
  State<Checkout_Battery> createState() => _Checkout_BatteryState();
}

class _Checkout_BatteryState extends State<Checkout_Battery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_outlined),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Column(
          //   children: [
          //
          //   ],
          // ),
          // Card(
          //   color: Colors.white,
          //   elevation: 1,
          //   child: Padding(
          //     padding: const EdgeInsets.all(4),
          //     child: Row(
          //       children: [
          //         Container(
          //           height: 100,
          //           width: 100,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           margin: const EdgeInsets.only(right: 10),
          //           child: Image.asset('assets/fuel.png')
          //         ),
          //         Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(vertical: 10),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 const Text(
          //                   "Sunfuel - Radisson Blu..",
          //                   style: TextStyle(
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.bold,
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //                 const SizedBox(height: 8),
          //                 const Row(
          //                   children: [
          //                     Icon(Icons.location_on),
          //                     SizedBox(width: 5),
          //                     Text(
          //                       "12, ring Road",
          //                       style: TextStyle(
          //                         fontSize: 16,
          //                         color: Colors.black54,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 const SizedBox(height: 7),
          //                 Row(
          //                   children: [
          //                     const Text(
          //                       "1 Km away",
          //                       style: TextStyle(
          //                         fontSize: 16,
          //                         color: Colors.black54,
          //                       ),
          //                     ),
          //                     const Spacer(),
          //                     Container(
          //                       height: 30,
          //                       width: 70,
          //                       decoration: BoxDecoration(
          //                         color: Colors.black,
          //                         borderRadius: BorderRadius.circular(5),
          //                         boxShadow: [
          //                           BoxShadow(
          //                             color: Colors.grey.withOpacity(0.1),
          //                             spreadRadius: 1,
          //                             blurRadius: 10,
          //                           )
          //                         ],
          //                       ),
          //                       child: const Row(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: [
          //                           Icon(
          //                             CupertinoIcons.star_fill,
          //                             size: 18,
          //                             color: Colors.orange,
          //                           ),
          //                           SizedBox(width: 5),
          //                           Text(
          //                             '2.2',
          //                             style: TextStyle(
          //                               color: Colors.white,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

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
                    'Delivery Address',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Navin Yadav,452010',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'G-14 1st sobari nagar,sukhliya..',
                            style: TextStyle(
                                color: Color.fromRGBO(118, 118, 128, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Container(
                        height: 24,
                        width: 57,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: colors.primary.withOpacity(.1),
                            border: Border.all(color: colors.primary)),
                        child: const Center(
                          child: Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 12,
                              color: colors.primary,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
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
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              color: colors.lightgray,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 12, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Car & tyres detail',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vehicle Manufacture',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Audi',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Tyres',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Perfinza CLX1',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Model',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'A3',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Booking Date',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Mon, Aug 17',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, right: 225),
                  child: Text(
                    "Price Detail",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tyres Price",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        "₹ 9170",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 2),
                // const Padding(
                //   padding: EdgeInsets.only(left: 15, right: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Delivery free",
                //         style: TextStyle(fontSize: 16, color: Colors.black54),
                //       ),
                //       Text(
                //         "0",
                //         style: TextStyle(
                //           fontSize: 18,
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 2),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Service",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        "₹ 80",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(
                  // thickness: 2,
                  color: Colors.black26,
                  indent: 15,
                  endIndent: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 10),
                  child: Row(
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
                        "${AppConstants.currencySymbol}.120.00",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  // thickness: 2,
                  color: Colors.black26,
                  indent: 15,
                  endIndent: 10,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: const MyButton(text: 'Checkout'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentScreenTree()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
