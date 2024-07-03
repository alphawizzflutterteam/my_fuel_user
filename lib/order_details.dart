import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_prj/helper/colors.dart';

// import 'MyButtan.dart';

class OrderDetails extends StatelessWidget {
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 20),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 80),
                    child: Text(
                      'Oreder Detail',
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
              elevation: 0,
              // color: Colors.white,
              // elevation: 3,
              //  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.only(right: 10),
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
                  padding: const EdgeInsets.only(left: 40),
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
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Icon(
                      CupertinoIcons.check_mark,
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
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 2,
                    height: 40,
                    color: colors.greyTemp,
                  ),
                ],
              ),
            ),

            /*IntrinsicHeight(
              child: const VerticalDivider(
                thickness: 2,
                width: 20,
                color: colors.blackTemp,
                indent: 30,
                endIndent: 30,
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.clear,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                        width:
                            10), // Add some spacing between the icon and the text
                    Text(
                      "Out for delivery",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
