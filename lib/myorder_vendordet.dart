import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import 'MyButtan.dart';

class VenderDetails1 extends StatelessWidget {
  // List<step.Step> steps=[

  //]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 20),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 30),
                    child: Text(
                      'Vendor Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.white,
              // elevation: 3,
              //  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

              child: Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://media.istockphoto.com/id/1330589502/photo/electric-vehicle-charging-station.jpg?s=1024x1024&w=is&k=20&c=gwve61BLBc9djE8P9Qp-2KSxS-ehZtvlcTW6AKy4DOA=',
                          height: 75,
                          width: 75,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Speed Petrol",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            //   SizedBox(height: 4),

                            Text(
                              "Lorem lpush is simply dumm",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),

                            SizedBox(height: 7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Order ID - OID52466246325",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text(
                    'Sold by:Seller',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 240),
              child: Text(
                "Schedule Time",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 130),
              child: Text(
                "11:00 to 12:0013 Jan 2024,Mon",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 180),
                      child: Text(
                        "Delivery Required an OTP",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Share the otp to delivery boy 01562,after recive the fuel",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image(
                          image: AssetImage(
                            'assets/Vendericon1.png',
                          ),
                          height: 40,
                          width: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Download Invoice",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 130),
                        child: Image(
                          image: AssetImage('assets/Vendericon2.png'),
                          height: 40,
                          width: 40,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image(
                          image: AssetImage(
                            'assets/Star.png',
                          ),
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/Star.png'),
                        height: 30,
                        width: 30,
                      ),
                      Image(
                        image: AssetImage('assets/Star.png'),
                        height: 30,
                        width: 30,
                      ),
                      Image(
                        image: AssetImage('assets/Star.png'),
                        height: 30,
                        width: 30,
                      ),
                      Image(
                        image: AssetImage('assets/Star.png'),
                        height: 30,
                        width: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Image(
                          image: AssetImage('assets/Vender.png'),
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Write Review",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                    "MRP (2item)",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Text(
                    "2,120.00",
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
                    "Delivery free",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Text(
                    "0",
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
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Text(
                    "60",
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
              padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "2060",
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
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                "Shopping address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: Text(
                '2118 Tharnridge Cir Syracuse,Connecticut 35',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 230),
              child: Text(
                'Naman Pawar',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 280),
              child: Text(
                "Indore",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 245),
              child: Text(
                'MP-452010',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 195),
              child: Text(
                'Phone- 589689365',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 210),
              child: Text(
                'Track Order',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Icon(
                        CupertinoIcons.right_chevron,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                        width:
                            10), // Add some spacing between the icon and the text
                    Text(
                      "Ordered Saturday, 13 Oct, 10:10 PM",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),


            // VerticalDivider(
            //   thickness: 2,
            //   color: Colors.red,
            //   indent: 30,
            //   endIndent: 30,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Icon(
                        CupertinoIcons.right_chevron,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                        width:
                            10), // Add some spacing between the icon and the text
                    Text(
                      "Delivered",
                      style: TextStyle(fontSize: 14, color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(
                "Saturday,13 Oct,betbeen 11.00 Pm \n to 12:00",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: 330,
              // child:MyButton(text: 'Cancel Order',),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
