import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_prj/payment/paymentScreen.dart';

import '../components/my_button.dart';
import '../helper/colors.dart';

class GetSetCheckoutScreen extends StatefulWidget {
  const GetSetCheckoutScreen({super.key});

  @override
  State<GetSetCheckoutScreen> createState() => _GetSetCheckoutScreenState();
}

class _GetSetCheckoutScreenState extends State<GetSetCheckoutScreen> {
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
            )),
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
                  Card(
                    elevation: 0,
                    // elevation: 3,
                    //  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1330589502/photo/electric-vehicle-charging-station.jpg?s=1024x1024&w=is&k=20&c=gwve61BLBc9djE8P9Qp-2KSxS-ehZtvlcTW6AKy4DOA=',
                                height: 130,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Genset Maintenance",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Engion oil filter",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Preodic Service",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /*Container(
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
