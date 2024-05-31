import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_prj/write_review.dart';

import 'helper/colors.dart';

// import 'MyButtan.dart';

class VenderDetails4 extends StatefulWidget {
  const VenderDetails4({super.key});

  @override
  State<VenderDetails4> createState() => _VenderDetails4State();
}

class _VenderDetails4State extends State<VenderDetails4> {
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding: const EdgeInsets.only(top: 45.0, left: 70),
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
                      child: Image.asset('assets/petrol.png'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Star Car Wash",
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
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Time',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: Text(
                        'Date',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '11:00 to 12:00',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 85),
                      child: Text(
                        '13 Jan 2024,Man',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(color: Color(0xffFFF3EC)),
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

            Container(
              height: 50,
              decoration: BoxDecoration(color: colors.lightgray),
              child: Row(children: [
                SizedBox(width: 10,),

                Icon(Icons.library_books),
                SizedBox(width: 10,),
                Text('Download Invoice',style: TextStyle(color: colors.blackTemp),),
                SizedBox(width: MediaQuery.sizeOf(context).width/2.2,),
                Icon(Icons.download),
              ],),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: (){

                AlertDialog(
                  title: Text('Alert Dialog'),
                  content: Text('This is an example of an alert dialog.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>WriteReview()));
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(color: Color(0xffFFF3EC)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 40,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(width: 20,),
                        Icon(Icons.edit_outlined,color: colors.primary,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Write Review",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: colors.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 250,left: 10),
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
                    "₹ 320.00",
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
                    "₹ 30",
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
                      color: colors.greenTemp,
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
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '2118 Tharnridge Cir Syracuse,Connecticut 35',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                'Naman Pawar',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 10),
              child: Text(
                "Indore",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10),
              child: Text(
                'MP-452010',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, bottom: 50),
              child: Text(
                'Phone- 589689365',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Track Order",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Stepper(
              connectorColor: MaterialStatePropertyAll(colors.primary),
              currentStep: 1,
              stepIconBuilder: (stepIndex, stepState) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: colors.primary,
                  ),
                  child: Icon(Icons.check, color: colors.whiteTemp,),
                );
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Container(); // This will hide the continue and cancel buttons
              },
              steps: <Step>[
                Step(
                  title: const Text('Order Saturday, 13 Oct, 10:10 PM', style: TextStyle(color: colors.greyTemp)),
                  content: Container(),
                ),
                    const Step(
                      title: Text('Delivered',style: TextStyle(color: colors.primary),),
                      content: Text('Saturday, 13 Oct, between 11:00 PM to 12:00 PM', style: TextStyle(color: colors.greyTemp)),
                    ),
              ],
            ),

            SizedBox(height: 20,)

            // Row(children: [
            //
            // ],)
            // Stepper(
            //    // connectorCo,
            //   connectorColor: MaterialStatePropertyAll(colors.primary),
            //   currentStep:1,
            //   stepIconBuilder: (stepIndex, stepState) {
            //     return Container(
            //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
            //       color: colors.primary,
            //       ),
            //       child: Icon(Icons.check,color: colors.whiteTemp,),
            //     );
            //   },
            //   // onStepCancel: () {
            //   //   if (_index > 0) {
            //   //     setState(() {
            //   //       _index -= 1;
            //   //     });
            //   //   }
            //   // },
            //   // onStepContinue: () {
            //   //   if (_index <= 0) {
            //   //     setState(() {
            //   //       _index += 1;
            //   //     });
            //   //   }
            //   // },
            //   // onStepTapped: (int index) {
            //   //   setState(() {
            //   //     _index = index;
            //   //   });
            //   // },
            //   steps: <Step>[
            //     Step(
            //       title: const Text('Order Saturday, 13 Oct, 10:10 PM'),
            //       content: Container(
            //         // alignment: Alignment.centerLeft,
            //         // child: const Text('Content for Step 1'),
            //       ),
            //     ),
            //     const Step(
            //       title: Text('Delivered',style: TextStyle(color: colors.primary),),
            //       content: Text('Saturday, 13 Oct, between 11:00 PM to 12:00 PM'),
            //     ),
            //   ],
            // ),

          ],
        ),
      ),
    );
  }
}


