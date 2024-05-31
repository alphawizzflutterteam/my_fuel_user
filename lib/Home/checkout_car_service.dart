import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_form.dart';

class Checkout_Car_Service extends StatefulWidget {
  const Checkout_Car_Service({super.key});

  @override
  State<Checkout_Car_Service> createState() => _Checkout_Car_ServiceState();
}

class _Checkout_Car_ServiceState extends State<Checkout_Car_Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_outlined),
        foregroundColor: Colors.white,
        flexibleSpace: Container(

          decoration: BoxDecoration(
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
        title: Text('Checkout'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),),
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
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
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
                            color:  colors.primary.withOpacity(.1),
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
                  SizedBox(height: 20,),

                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.blackTemp)
                    ),
                    child: Center(child: Text('Change or add new address',style: TextStyle(fontWeight: FontWeight.bold),)),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            color: colors.lightgray,
            child: Padding(
              padding: const EdgeInsets.only(left: 12,top: 8,bottom: 8),
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
                        "MRP (1 item)",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        "120.00",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery free",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        "80",
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
                        "Rs.120.00",
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
                const SizedBox(height: 100),
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
                                builder: (context) => const PaymentScreenTree()));
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
