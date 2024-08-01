import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../cancelOrder.dart';
import '../controller/order_controller.dart';
import '../data/model/all_orders_model.dart';
import '../helper/colors.dart';
import '../home.dart';
import '../home_page.dart';
import '../order_details.dart';
import '../splashScreen.dart';

class VenderDetails extends StatefulWidget {

  String type;
  Booking booking;

   VenderDetails({super.key,required this.type,required this.booking});
  @override
  State<VenderDetails> createState() => _VenderDetailsState();
}

class _VenderDetailsState extends State<VenderDetails> {
  // List<step.Step> steps=[
  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init: OrderController(),
      builder: (controller) {
      return  Scaffold(
          backgroundColor:  Colors.white,
          // backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
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
                            padding: const EdgeInsets.only(top: 45.0, left: 80),
                            child: Text(
                              'Order Details',
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.booking.products?.isEmpty ?? true ?   Card(
                            color: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Optional: Rounded corners
                              side: BorderSide.none, // Remove bottom border
                            ),

                            //  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Row(
                                children: [

                                  FadeInImage
                                      .assetNetwork(
                                    fit: BoxFit.cover,
                                    height:
                                    80,
                                    placeholder:
                                    'assets/indianoil.png', // Placeholder image path
                                    image:
                                    '${configModel!.baseUrls!.categoryImageUrl}/${ widget.booking.category?.icon}', // Network image URL
                                    imageErrorBuilder: (context,
                                        error,
                                        stackTrace) {
                                      // Widget to display in case of an error
                                      return Image.asset("assets/indianoil.png", height: 80);
                                    },
                                    placeholderScale:
                                    1.0, // Optional: scale of the placeholder
                                  ),
                                  // Image
                                  //     .network(
                                  //   "${configModel!.baseUrls!.productThumbnailUrl}${controller.ordersList[index].details![0].product!.thumbnail!.toUpperCase()}",
                                  //   errorBuilder: (context,
                                  //       error,
                                  //       stackTrace) {
                                  //     return Image.asset(
                                  //         "assets/indianoil.png",
                                  //         height: 94);
                                  //   },
                                  // ),
                                  // Container(
                                  //   height: 100,
                                  //   width: 80,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(10),
                                  //   ),
                                  //   // margin: EdgeInsets.only(right: 10),
                                  //   child: Image.network( '${configModel!.baseUrls!.categoryImageUrl}/${ widget.booking.category?.icon}',),
                                  // ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${widget.booking.serviceName}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          //   SizedBox(height: 4),

                                          // Text(
                                          //   "Lorem lpush is simply dumm",
                                          //   style: TextStyle(
                                          //     fontSize: 12,
                                          //     color: Colors.black54,
                                          //   ),
                                          // ),

                                          SizedBox(height: 7),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )  :

                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.booking.products?.length,
                            itemBuilder:  (context, index) {
                              return   Card(

                                color: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12), // Optional: Rounded corners
                                  side: BorderSide.none, // Remove bottom border
                                ),
                                // elevation: 3,
                                //  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                                child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Row(
                                    children: [

                                      FadeInImage
                                          .assetNetwork(
                                        fit: BoxFit.cover,
                                        height:
                                        80,
                                        placeholder:
                                        'assets/indianoil.png', // Placeholder image path
                                        image:
                                        '${configModel!.baseUrls!.categoryImageUrl}/${widget.booking.products?[index].images}', // Network image URL
                                        imageErrorBuilder: (context,
                                            error,
                                            stackTrace) {
                                          // Widget to display in case of an error
                                          return Image.asset("assets/indianoil.png", height: 80);
                                        },
                                        placeholderScale:
                                        1.0, // Optional: scale of the placeholder
                                      ),

                                      SizedBox(width: 20,),

                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${widget.booking.products?[index].name}",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              //   SizedBox(height: 4),

                                              Text(
                                                "${widget.booking.products?[index].slug}",
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
                                      // Image
                                      //     .network(
                                      //   "${configModel!.baseUrls!.productThumbnailUrl}${controller.ordersList[index].details![0].product!.thumbnail!.toUpperCase()}",
                                      //   errorBuilder: (context,
                                      //       error,
                                      //       stackTrace) {
                                      //     return Image.asset(
                                      //         "assets/indianoil.png",
                                      //         height: 94);
                                      //   },
                                      // ),
                                      // Container(
                                      //   height: 100,
                                      //   width: 80,
                                      //   decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(10),
                                      //   ),
                                      //   // margin: EdgeInsets.only(right: 10),
                                      //   child: Image.network( '${configModel!.baseUrls!.categoryImageUrl}/${ widget.booking.category?.icon}',),
                                      // ),
                                      // SizedBox(width: 20,),
                                      // ListView.builder(
                                      //   shrinkWrap: true,
                                      //   physics: NeverScrollableScrollPhysics(),
                                      //   itemCount: widget.booking.products?.length,
                                      //   itemBuilder:  (context, index) {
                                      //     return    Expanded(
                                      //       child: Padding(
                                      //         padding: EdgeInsets.symmetric(vertical: 10),
                                      //         child: Column(
                                      //           crossAxisAlignment: CrossAxisAlignment.start,
                                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //           children: [
                                      //             Text(
                                      //               "${widget.booking.products?[index].name}",
                                      //               style: TextStyle(
                                      //                 fontSize: 16,
                                      //                 fontWeight: FontWeight.bold,
                                      //                 color: Colors.black,
                                      //               ),
                                      //             ),
                                      //             //   SizedBox(height: 4),
                                      //
                                      //             Text(
                                      //               "${widget.booking.products?[index].slug}",
                                      //               style: TextStyle(
                                      //                 fontSize: 12,
                                      //                 color: Colors.black54,
                                      //               ),
                                      //             ),
                                      //
                                      //             SizedBox(height: 7),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     );
                                      //   },)
                                    ],
                                  ),
                                ),
                              );
                            },),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Order ID - ${widget.booking.id}",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(child:     widget.booking.seller==null  ? SizedBox() :  Text(
                                  'Sold by : ${widget.booking.seller?.fName}',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),)


                              ],
                            ),
                          ),
                          widget.booking?.timeSlot==null  ? SizedBox()  : SizedBox(
                            height: 15,
                          ),
                          widget.booking?.timeSlot==null  ? SizedBox()  : Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Schedule Time",
                                        style: TextStyle(fontSize: 14, color: Colors.black54),
                                      ),
                                      Text(
                                        "${widget.booking?.timeSlot?.title ?? ''}",

                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date",
                                        style: TextStyle(fontSize: 14, color: Colors.black54),
                                      ),
                                      widget.booking?.timeSlot?.createdAt == '' ||   widget.booking?.timeSlot?.createdAt==null  ? SizedBox()  : Text(
                                        DateFormat('dd MMM yyyy').format(DateTime.parse(
                                          "${widget.booking?.timeSlot?.createdAt ?? ''}",
                                        )),
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),
                          widget.booking?.timeSlot==null  ? SizedBox(height: 15,)  :  SizedBox(
                            height: 30,
                          ),
                          Container(
                            color: Color(0xffFFF3EC),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Delivery Required an OTP'),
                                  Text(
                                    'Share the otp to delivey boy ${widget.booking?.otp}, after receive the fuel',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Container(
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.only(right: 180),
                                  //     child: Text(
                                  //       "Delivery Required an OTP",
                                  //       style: TextStyle(fontSize: 14, color: Colors.black54),
                                  //     ),
                                  //   ),
                                  // ),
                                  Text(
                                    "Price Detail",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "MRP (${widget.booking.products!.isEmpty ? '1' : widget.booking.products?.length})",
                                        style: TextStyle(fontSize: 14, color: Colors.black54),
                                      ),
                                      Text(
                                        "₹ ${widget.booking?.subtotal}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Delivery free",
                                        style: TextStyle(fontSize: 14, color: Colors.black54),
                                      ),
                                      Text(
                                        "₹ ${widget.booking?.serviceCharges}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Discount",
                                        style: TextStyle(fontSize: 14, color: Colors.black54),
                                      ),
                                      Text(
                                        "₹ ${widget.booking?.discount}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Divider(
                                    color: Colors.black54,
                                    thickness: 0.2,
                                    //indent: 5,
                                    // endIndent: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Amount",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "₹ ${widget.booking?.total}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.lightGreen,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
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
                                  Text(
                                    "Address",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 35),
                                    child: Text(
                                      '${widget.booking?.shippingAddress?.address}',
                                      style: TextStyle(fontSize: 14, color: Colors.black54),
                                    ),
                                  ),
                                  Text(
                                    '${widget.booking?.shippingAddress?.contactPersonName}',
                                    style: TextStyle(fontSize: 14, color: Colors.black54),
                                  ),
                                  Text(
                                    '${widget.booking?.shippingAddress?.state}',
                                    style: TextStyle(fontSize: 14, color: Colors.black54),
                                  ),
                                  Text(
                                    '${widget.booking?.shippingAddress?.zip}',
                                    style: TextStyle(fontSize: 14, color: Colors.black54),
                                  ),
                                  Text(
                                    'Phone- ${widget.booking?.shippingAddress?.phone}',
                                    style: TextStyle(fontSize: 14, color: Colors.black54),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Track Order',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Stepper(
                                    connectorColor: MaterialStatePropertyAll(colors.primary),
                                    currentStep: 0,
                                    stepIconBuilder: (stepIndex, stepState) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: colors.primary,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: colors.whiteTemp,
                                        ),
                                      );
                                    },
                                    controlsBuilder: (BuildContext context, ControlsDetails details) {
                                      return Container(); // This will hide the continue and cancel buttons
                                    },
                                    steps: <Step>[
                                      Step(
                                        title:
                                  Text(
                                      "Ordered ${DateFormat('EEEE, dd MMM, hh:mm a').format(DateTime.parse(widget.booking?.createdAt.toString() ?? '',))}",
                              style: TextStyle(fontSize: 14, color: Colors.black54),
                            ),
                                        // Text('Order Saturday, 13 Oct, 10:10 PM',
                                        //     style: TextStyle(color: colors.greyTemp)),
                                        content: Container(),
                                      ),
                                      // const Step(
                                      //   title: Text('Out for delivery',
                                      //       style: TextStyle(color: colors.greyTemp)),
                                      //   content:
                                      //   Text('Saturday, 13 Oct, between 11:00 PM to 12:00 PM'),
                                      // ),
                                       Step(
                                        title:      Text(
                                          "Updated At ${DateFormat('EEEE, dd MMM, hh:mm a').format(DateTime.parse(widget.booking?.updatedAt.toString() ?? '',))}",
                                          style: TextStyle(fontSize: 14, color: Colors.black54),
                                        ), content: Text(''),
                                      ),
                                    ],
                                  ),

                                  // Stepper(
                                  //   currentStep:2,
                                  //   stepIconBuilder: (stepIndex, stepState) {
                                  //     return Container(
                                  //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                                  //         color: colors.primary,
                                  //       ),
                                  //       child: Icon(Icons.check,color: colors.whiteTemp,),
                                  //     );
                                  //   },
                                  //
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
                                  //       title: const Text('Order Saturday, 13 Oct, 10:10 PM',style: TextStyle(color: colors.greyTemp)),
                                  //       content: Container(
                                  //         // alignment: Alignment.centerLeft,
                                  //         // child: const Text('Content for Step 1'),
                                  //       ),
                                  //     ),
                                  //     const Step(
                                  //       title: Text('Out for  delivery',style: TextStyle(color: colors.greyTemp),),
                                  //       content: Text('Saturday, 13 Oct, between 11:00 PM to 12:00 PM'),
                                  //     ),
                                  //     const Step(
                                  //       title: Text('Saturday, 13 Oct, between 11:00 PM to 12:00 PM',style: TextStyle(color: colors.greyTemp),),
                                  //       content: Text(''),
                                  //       // content: Text('Saturday, 13 Oct, between 11:00 PM to 12:00 PM'),
                                  //     ),
                                  //   ],
                                  // ),

                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 20),
                                  //   child: Container(
                                  //     child: Row(
                                  //       children: [
                                  //         Container(
                                  //           decoration: BoxDecoration(
                                  //             color: Colors.orange,
                                  //             borderRadius: BorderRadius.circular(50),
                                  //             boxShadow: [
                                  //               BoxShadow(
                                  //                 color: Colors.orange,
                                  //                 spreadRadius: 1,
                                  //               )
                                  //             ],
                                  //           ),
                                  //           child: Icon(
                                  //           Icons.check,
                                  //             size: 18,
                                  //             color: Colors.white,
                                  //           ),
                                  //         ),
                                  //         SizedBox(width: 10), // Add some spacing between the icon and the text
                                  //         Text(
                                  //           "Ordered Saturday, 13 Oct, 10:10 PM",
                                  //           style: TextStyle(fontSize: 14, color: Colors.black54),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //     left: 17.0,
                                  //   ),
                                  //   child: TimelineTile(
                                  //
                                  //     isFirst: true,
                                  //     beforeLineStyle: LineStyle(color: Colors.amber,),
                                  //     indicatorStyle: IndicatorStyle(color: Colors.amber),
                                  //   ),
                                  // ),
                                  // // VerticalDivider(
                                  // //   thickness: 2,
                                  // //   color: Colors.blue,
                                  // //   indent: 30,
                                  // //   endIndent: 30,
                                  // // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 20),
                                  //   child: Container(
                                  //     child: Row(
                                  //       children: [
                                  //         Container(
                                  //           decoration: BoxDecoration(
                                  //             color: Colors.white,
                                  //             borderRadius: BorderRadius.circular(50),
                                  //             boxShadow: [
                                  //               BoxShadow(
                                  //                 color: Colors.black54,
                                  //                 spreadRadius: 1,
                                  //               )
                                  //             ],
                                  //           ),
                                  //           child: Icon(
                                  //             CupertinoIcons.right_chevron,
                                  //             size: 18,
                                  //             color: Colors.white,
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //             width:
                                  //                 10), // Add some spacing between the icon and the text
                                  //         Text(
                                  //           "Out for delivery",
                                  //           style: TextStyle(fontSize: 14, color: Colors.black54),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  // VerticalDivider(
                                  //   thickness: 2,
                                  //   color: Colors.orange,
                                  //   indent: 30,
                                  //   endIndent: 30,
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 20),
                                  //   child: Container(
                                  //     child: Row(
                                  //       children: [
                                  //         Container(
                                  //           decoration: BoxDecoration(
                                  //             color: Colors.white,
                                  //             borderRadius: BorderRadius.circular(50),
                                  //             boxShadow: [
                                  //               BoxShadow(
                                  //                 color: Colors.black54,
                                  //                 spreadRadius: 1,
                                  //               )
                                  //             ],
                                  //           ),
                                  //           child: Icon(
                                  //             CupertinoIcons.right_chevron,
                                  //             size: 18,
                                  //             color: Colors.white,
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //             width:
                                  //                 10), // Add some spacing between the icon and the text
                                  //         Text(
                                  //           "Saturday,13 Oct,between 11:00 PM \n to 12:00 Pm",
                                  //           style: TextStyle(fontSize: 14, color: Colors.black54),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  widget.booking?.status=='completed' || widget.booking?.status=='cancelled' ?  SizedBox()  : InkWell(
                                    onTap: () {
                                      showReviewDialog(context,controller);
                                    },
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      width: 330,
                                      child: MyButton(
                                        text: 'Cancel Order',
                                      ),
                                    ),
                                  ) ,
                                  SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ])));
    },);
  }

  int selectedValue = 1;

  String selectedReason='';

  Widget customRadio(String text, int value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedValue = value;
          selectedReason=text;
        });
      },
      child: Row(
        children: [
          Radio<int>(
            value: value,
            groupValue: selectedValue,
            onChanged: (int? newValue) {
              dialogState!(() {
                selectedValue = newValue!;
              });
            },
            activeColor: Colors.red,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight:
                  selectedValue == value ? FontWeight.bold : FontWeight.normal,
              color: selectedValue == value ? Colors.black : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Function? dialogState;

  void showReviewDialog(BuildContext context,OrderController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, seatate) {
          dialogState = seatate;
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 1.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
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
                      //         padding: const EdgeInsets.only(top: 45.0, left: 60),
                      //         child: Text(
                      //           'Cancel Order Reasons',
                      //           style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Center(
                        child: Text(
                          'Cancel Order Reason',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 23.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customRadio("Changed My Mind", 1),
                            customRadio("Found a Better Deal", 2),
                            customRadio("Delay in Delivery", 3),
                            customRadio("No Longer Need the Item", 4),
                            customRadio("Technical Issues", 5),
                            customRadio("Personal Emergency", 6),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.updateOrder('cancelled',selectedReason,widget.booking.id).then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => OrderDetails(booking: widget.booking,)))).then((value) {
                                Navigator.pop(context);
                                        Get.offAll(Home());



                              });
                            });



                          },
                          child: MyButton(text: 'Done'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
