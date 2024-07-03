import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_page.dart';

import 'components/my_button.dart';
import 'helper/colors.dart';
// import 'CartItemSamples.dart';
// import 'MyButtan.dart';

class Summary1 extends StatefulWidget {
  @override
  State<Summary1> createState() => _Summary1State();
}

class _Summary1State extends State<Summary1> {
  DateTime? selectedDate;

  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 120,
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.topCenter,
            //       end: Alignment.center,
            //       colors: [
            //         Color.fromRGBO(211, 83, 7, 1),
            //         Color.fromRGBO(252, 130, 59, 1),
            //         Color.fromRGBO(252, 130, 59, 1),
            //       ],
            //     ),
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(23),
            //       bottomRight: Radius.circular(23),
            //     ),
            //   ),
            //   child: Row(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(top: 45.0, left: 20),
            //         child: Icon(
            //           Icons.arrow_back,
            //           color: Colors.white,
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(top: 45.0, left: 65),
            //         child: Text(
            //           'Schedule Day',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 20,
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //       ),
            //     ],
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 120, // Set a fixed height for the list
                    child: ListView(
                      padding: EdgeInsets.zero, // Remove top padding
                      children: [
                        Card(
                          color: Colors.white,
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          elevation: 0, // Remove the shadow effect
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.only(right: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        10), // Ensure the image corners are rounded
                                    child: Image.asset('assets/carwash.png')
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Sunfuel - Radisson Blu..",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on),
                                            SizedBox(width: 5),
                                            Text(
                                              "12, Ring Road",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 15),
                                              child: Text(
                                                "300",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              height: 30,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 1,
                                                    blurRadius: 10,
                                                  )
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.star_fill,
                                                    size: 18,
                                                    color: Colors.orange,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    '2.2',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Booking Date",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        Text(
                          "Mon,Aug 17",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Car",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        Text(
                          "Tata Nexon EV",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Service Type",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        Text(
                          "Pick Up",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 250),
                    child: Text(
                      "Price Detail",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Car Wash",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        Text(
                          "320.00",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Service",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        Text(
                          "30",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(
                    color: Colors.black54,
                    thickness: 0.2,
                    //indent: 5,
                    // endIndent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10, top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$120.00",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black54,
                    thickness: 0.2,
                    //indent: 5,
                    // endIndent: 10,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreenTree()));
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 330,
                      child: MyButton(text: 'Continue'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
