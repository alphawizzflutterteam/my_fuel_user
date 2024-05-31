import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_prj/write_review.dart';

import 'cancelOrder.dart';
import 'components/my_button.dart';
import 'helper/colors.dart';

// import 'MyButtan.dart';

class VenderDetails3 extends StatelessWidget {
  // List<step.Step> steps=[

  //]
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

            // Container(
            //   height: 50,
            //     decoration: BoxDecoration(color: colors.lightgray),
            //   child: Row(children: [
            //     SizedBox(width: 10,),
            //
            //     Icon(Icons.library_books),
            //     SizedBox(width: 10,),
            //     Text('Download Invoice',style: TextStyle(color: colors.blackTemp),),
            //     SizedBox(width: MediaQuery.sizeOf(context).width/2.2,),
            //     Icon(Icons.download),
            //   ],),
            // ),
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
                        Icon(Icons.edit_outlined,color: Colors.orange,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: InkWell(
                            onTap: (){
                              showReviewDialog(context);
                            },
                            child: Text(
                              "Write Review",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
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
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
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

          ],
        ),
      ),
    );
  }


  void showReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Container(
                      child: Center(
                        child: Text(
                          "Write Review",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "Review",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemSize: 25,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "Description",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(height: 150,
                  decoration: BoxDecoration(
                      border:Border.all( color: Colors.grey, // Change color as needed
                        width: 2.0, 
                      ) ,
                  borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    maxLines: null, // Allow unlimited lines
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // contentPadding: EdgeInsets.only(bottom: 100),
                      hintText: 'Write here...',
                      contentPadding: EdgeInsets.only(left: 10)
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(15),
                      //   // borderSide: BorderSide(
                      //   //   color: Colors.grey, // Change color as needed
                      //   //   width: 2.0, // Border width
                      //   // ),
                      // ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //     color: Colors.grey, // Change color as needed
                      //     width: 2.0, // Border width
                      //   ),
                      // ),
                    ),
                  ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: TextField(
                  //     maxLines: null, // Allow unlimited lines
                  //     keyboardType: TextInputType.multiline,
                  //     decoration: InputDecoration(
                  //       // contentPadding: EdgeInsets.only(bottom: 100),
                  //       hintText: 'Write here...',
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(15),
                  //         borderSide: BorderSide(
                  //           color: Colors.grey, // Change color as needed
                  //           width: 2.0, // Border width
                  //         ),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           color: Colors.grey, // Change color as needed
                  //           width: 2.0, // Border width
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CancelOrder()));
                    },
                    child: Container(
                      // alignment: Alignment.bottomCenter,
                      width: 300,
                      child: MyButton(
                        text: 'Submit Review',
                      ),
                    ),
                  )

                  // // SizedBox(height: 30),
                  // Container(
                  //   alignment: Alignment.bottomCenter,
                  //   width: 330,
                  //   // child: MyButton(text: 'Submit Review',),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
