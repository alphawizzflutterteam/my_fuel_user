import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_prj/Home/car_wish_list.dart';
import 'package:test_prj/controller/internet_controller.dart';
import 'package:test_prj/controller/order_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/myOrder/CarWash.dart';
import 'package:test_prj/myOrder/VendorDetail.dart';
import 'package:test_prj/profile/notification1.dart';
import 'package:test_prj/splashScreen.dart';
import '../VenderDetails4.dart';
import '../carwash_vendordet.dart';
import '../components/my_button.dart';
import '../myorder_vendordet2.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  int selectedIndex = 0;

  List category = [
    "Fuels".tr,
    "Car Wash".tr,
    "Rescue fuel".tr,
    "Tyres".tr,
    "Battery".tr,
    "Insurance".tr,
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        init: OrderController(),
        builder: (controller) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(252, 130, 59, 1),
                    Color.fromRGBO(252, 130, 59, 1),
                    Color.fromRGBO(211, 83, 7, 1),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/mingcute_location-fill.png",
                                height: 24,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${address.toString().split(",")[0]}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "${address.toString()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/Search.png",
                                height: 24,
                                color: colors.whiteTemp,
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Notification1(),
                                      ));

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             VenderDetails2()));

                                  //
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             VenderDetails4()));

                                  //
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             VenderDetails3(
                                  //               title:
                                  //               'Star Car Wash',
                                  //             )));

                                  /*Navigator.push(
                       context,
                       MaterialPageRoute(
                               builder: (context) =>
                 CarWashList()));*/
                                },
                                child: Image.asset(
                                  "assets/Notification.png",
                                  height: 24,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                            ),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.747,
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 28),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        'My Order'.tr,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25, left: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 55,
                                              child: TextFormField(
                                                controller: controller.search,
                                                onChanged: (value) {
                                                  controller.searchOrderText
                                                      .value = value;
                                                },
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "Search Order ID".tr,
                                                    hintStyle: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    prefixIcon: SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child: Image.asset(
                                                          "assets/Search.png",
                                                          scale: 20,
                                                        )),

                                                    // Image.asset(
                                                    //   "assets/Search2.png",
                                                    //   height: 20,
                                                    // ),
                                                    fillColor: Colors.grey
                                                        .withOpacity(.2),
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                              ),
                                            ),
                                          ),
                                          // Expanded(
                                          //   child: SizedBox(
                                          //     height: 55,
                                          //     child: TextFormField(
                                          //       decoration:
                                          //           InputDecoration(
                                          //               prefixIcon:
                                          //                   Image.asset(
                                          //                 "assets/Search.png",
                                          //                 scale: 20,
                                          //               ),
                                          //               fillColor:
                                          //                   const Color
                                          //                       .fromRGBO(
                                          //                       245,
                                          //                       245,
                                          //                       245,
                                          //                       1),
                                          //               filled: true,
                                          //               enabledBorder:
                                          //                   OutlineInputBorder(
                                          //                 borderRadius:
                                          //                     BorderRadius
                                          //                         .circular(
                                          //                             12),
                                          //                 borderSide:
                                          //                     BorderSide
                                          //                         .none,
                                          //               ),
                                          //               hintText:
                                          //                   "Search"),
                                          //     ),
                                          //   ),
                                          // ),
                                          // const SizedBox(
                                          //     width: 8), // Added spacing
                                          // const Icon(
                                          //     Icons.format_align_right_rounded)
                                        ],
                                      ),
                                    ),
                                    //  const SizedBox(height: 16),
                                    // categoryWidget(),

                                    SizedBox(
                                      height: 10,
                                    ),

                                    SizedBox(
                                      height: 50,
                                      child: ListView.builder(
                                        itemCount:
                                            controller.allOrdersList.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return CategoryProducts(
                                            text: controller
                                                    .allOrdersList[index].name
                                                    .toString()
                                                    .tr ??
                                                "",
                                            press: () {
                                              controller.index.value = index;
                                              setState(() {
                                                selectedIndex = index;
                                              });
                                            },
                                            isSelected: selectedIndex == index,
                                          );
                                        },
                                      ),
                                    ),

                                    // ListView.builder(
                                    //   scrollDirection: Axis.vertical,
                                    //   shrinkWrap: true,
                                    //   itemCount: controller.allOrdersList.length,
                                    //   itemBuilder: (
                                    //
                                    //       context, index) {
                                    //
                                    //     return ;
                                    //
                                    // },),

                                    controller.allOrdersList.isEmpty
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : controller
                                                    .allOrdersList[
                                                        selectedIndex]
                                                    .name ==
                                                'Insurance'
                                            ? controller
                                                        .allOrdersList[
                                                            selectedIndex]
                                                        .insurances
                                                        ?.length ==
                                                    0
                                                ? Center(
                                                    child:
                                                        Text("No Orders Found"),
                                                  )
                                                : ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: controller
                                                        .allOrdersList[
                                                            selectedIndex]
                                                        .insurances
                                                        ?.length,
                                                    itemBuilder:
                                                        (context, index1) {
                                                      return InkWell(
                                                        onTap: () {
                                                          // Navigator.push(
                                                          //     context,
                                                          //     MaterialPageRoute(
                                                          //         builder: (context) =>
                                                          //             VenderDetails(type: controller.allOrdersList[selectedIndex].name  ?? '',booking: controller
                                                          //                 .allOrdersList[selectedIndex]
                                                          //                 .bookings![index1],)));
                                                        },
                                                        child: Container(
                                                          height: 70,
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(6),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .grey.shade200,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          12.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "${controller.allOrdersList[selectedIndex].insurances![index1].name}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${controller.allOrdersList[selectedIndex].insurances![index1].email}",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.grey,
                                                                          fontSize:
                                                                              15,
                                                                          // fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      // SizedBox(
                                                                      //   height: 6,
                                                                      // ),
                                                                      // Container(
                                                                      //   height: 34,
                                                                      //   width: 90,
                                                                      //   decoration: BoxDecoration(
                                                                      //     borderRadius:
                                                                      //     BorderRadius
                                                                      //         .circular(
                                                                      //         6),
                                                                      //     color:controller.allOrdersList[selectedIndex].insurances![index1].status=='pending'  ?  Color(0xFFF6C209) : controller.allOrdersList[selectedIndex].insurances![index1].status=='inprogress'  ||   controller.allOrdersList[selectedIndex].insurances![index1].status=='confirmed'  ?
                                                                      //
                                                                      //     Color(0xFFF2970F) :  Color(0xFF9AC228) ,
                                                                      //
                                                                      //   ),
                                                                      //   child: Center(
                                                                      //       child: Text(
                                                                      //         // 'On the way',
                                                                      //         "${controller.allOrdersList[selectedIndex].insurances![index1].status}",
                                                                      //         style: TextStyle(
                                                                      //             color: colors
                                                                      //                 .whiteTemp),
                                                                      //       )),
                                                                      // ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  )
                                            : controller
                                                        .allOrdersList[
                                                            selectedIndex]
                                                        .bookings
                                                        ?.length ==
                                                    0
                                                ? Center(
                                                    child:
                                                        Text("No Orders Found"),
                                                  )
                                                : ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: controller
                                                        .allOrdersList[
                                                            selectedIndex]
                                                        .bookings
                                                        ?.length,
                                                    itemBuilder:
                                                        (context, index1) {
                                                      return InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          VenderDetails(
                                                                            type:
                                                                                controller.allOrdersList[selectedIndex].name ?? '',
                                                                            booking:
                                                                                controller.allOrdersList[selectedIndex].bookings![index1],
                                                                          )));
                                                        },
                                                        child: Container(
                                                          height: 110,
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(6),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .grey.shade200,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Row(
                                                              children: [
                                                                controller
                                                                            .allOrdersList[
                                                                                selectedIndex]
                                                                            .bookings?[
                                                                                index1]
                                                                            .products
                                                                            ?.isEmpty ??
                                                                        true
                                                                    ? FadeInImage
                                                                        .assetNetwork(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        height:
                                                                            80,
                                                                        placeholder:
                                                                            'assets/indianoil.png', // Placeholder image path
                                                                        image:
                                                                            '${configModel!.baseUrls!.categoryImageUrl}/${controller.allOrdersList[selectedIndex].bookings?[index1].category?.icon}', // Network image URL
                                                                        imageErrorBuilder: (context,
                                                                            error,
                                                                            stackTrace) {
                                                                          // Widget to display in case of an error
                                                                          return Image.asset(
                                                                              "assets/indianoil.png",
                                                                              height: 80);
                                                                        },
                                                                        placeholderScale:
                                                                            1.0, // Optional: scale of the placeholder
                                                                      )
                                                                    : ClipRRect(
                                                                        child: FadeInImage
                                                                            .assetNetwork(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          height:
                                                                              80,
                                                                          width:
                                                                              80,

                                                                          placeholder:
                                                                              'assets/indianoil.png', // Placeholder image path
                                                                          image:
                                                                              '${configModel!.baseUrls!.productImageUrl}/${controller.allOrdersList[selectedIndex].bookings![index1].products?[0].images[0]}', // Network image URL
                                                                          imageErrorBuilder: (context,
                                                                              error,
                                                                              stackTrace) {
                                                                            // Widget to display in case of an error
                                                                            return Image.asset("assets/indianoil.png",
                                                                                height: 80);
                                                                          },
                                                                          placeholderScale:
                                                                              1.0, // Optional: scale of the placeholder
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),

                                                                // FadeInImage
                                                                //     .assetNetwork(
                                                                //   height:
                                                                //   94,
                                                                //   placeholder:
                                                                //   'assets/indianoil.png', // Placeholder image path
                                                                //   image:
                                                                //   '${configModel!.baseUrls!.supportTicketImageUrl}/${controller.ordersList[index].details![0].product!.thumbnail!.toUpperCase()}', // Network image URL
                                                                //   imageErrorBuilder: (context,
                                                                //       error,
                                                                //       stackTrace) {
                                                                //     // Widget to display in case of an error
                                                                //     return Image.asset("assets/indianoil.png", height: 94);
                                                                //   },
                                                                //   placeholderScale:
                                                                //   1.0, // Optional: scale of the placeholder
                                                                // ),
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
                                                                controller
                                                                            .allOrdersList[selectedIndex]
                                                                            .bookings?[index1]
                                                                            .products
                                                                            ?.isEmpty ??
                                                                        true
                                                                    ? Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                12.0),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "${controller.allOrdersList[selectedIndex].bookings?[index1].serviceName}",
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              "${controller.allOrdersList[selectedIndex].bookings?[index1].serviceType}",
                                                                              style: TextStyle(
                                                                                color: Colors.grey,
                                                                                fontSize: 15,
                                                                                // fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 6,
                                                                            ),
                                                                            Container(
                                                                              height: 34,
                                                                              width: 90,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(6),
                                                                                color: controller.allOrdersList[selectedIndex].bookings?[index1].status == 'pending'
                                                                                    ? Color(0xFFF6C209)
                                                                                    : controller.allOrdersList[selectedIndex].bookings?[index1].status == 'cancelled'
                                                                                        ? Colors.red
                                                                                        : controller.allOrdersList[selectedIndex].bookings?[index1].status == 'inprogress' || controller.allOrdersList[selectedIndex].bookings?[index1].status == 'confirmed'
                                                                                            ? Color(0xFFF2970F)
                                                                                            : Color(0xFF9AC228),
                                                                              ),
                                                                              child: Center(
                                                                                  child: Text(
                                                                                // 'On the way',
                                                                                "${controller.allOrdersList[selectedIndex].bookings?[index1].status}",
                                                                                style: TextStyle(color: colors.whiteTemp),
                                                                              )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                12.0),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "${controller.allOrdersList[selectedIndex].bookings![index1].products?[0].name}",
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              "${controller.allOrdersList[selectedIndex].bookings?[index1].products?[0].slug}",
                                                                              style: TextStyle(
                                                                                color: Colors.grey,
                                                                                fontSize: 15,
                                                                                // fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 6,
                                                                            ),
                                                                            Container(
                                                                              height: 34,
                                                                              width: 90,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(6),
                                                                                color: controller.allOrdersList[selectedIndex].bookings?[index1].status == 'pending'
                                                                                    ? Color(0xFFF6C209)
                                                                                    : controller.allOrdersList[selectedIndex].bookings?[index1].status == 'inprogress' || controller.allOrdersList[selectedIndex].bookings?[index1].status == 'confirmed'
                                                                                        ? Color(0xFFF2970F)
                                                                                        : Color(0xFF9AC228),
                                                                              ),
                                                                              child: Center(
                                                                                  child: Text(
                                                                                // 'On the way',
                                                                                "${controller.allOrdersList[selectedIndex].bookings?[index1].status}",
                                                                                style: TextStyle(color: colors.whiteTemp),
                                                                              )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  )

                                    // selectedIndex == 0
                                    //     ? Column(
                                    //         children: [
                                    //           Obx(() =>
                                    //               controller.ordersList
                                    //                           .length ==
                                    //                       0
                                    //                   ? Center(
                                    //                       child: Text(
                                    //                           "No Orders Found"),
                                    //                     )
                                    //                   : ListView.builder(
                                    //                       shrinkWrap:
                                    //                           true,
                                    //                       itemCount:
                                    //                           controller
                                    //                               .ordersList
                                    //                               .length,
                                    //                       itemBuilder:
                                    //                           (context,
                                    //                               index) {
                                    //                         print(
                                    //                             "object User Data ${configModel!.baseUrls!.productImageUrl}${controller.ordersList[index].details![0].product!.thumbnail!.toUpperCase()}");
                                    //                         return Container(
                                    //                           height: 110,
                                    //                           margin:
                                    //                               const EdgeInsets
                                    //                                   .all(
                                    //                                   6),
                                    //                           decoration:
                                    //                               BoxDecoration(
                                    //                             color: Colors
                                    //                                 .grey
                                    //                                 .shade200,
                                    //                             borderRadius:
                                    //                                 BorderRadius.circular(
                                    //                                     12),
                                    //                           ),
                                    //                           child:
                                    //                               Padding(
                                    //                             padding: const EdgeInsets
                                    //                                 .all(
                                    //                                 10.0),
                                    //                             child:
                                    //                                 Row(
                                    //                               children: [
                                    //                                 FadeInImage
                                    //                                     .assetNetwork(
                                    //                                   height:
                                    //                                       94,
                                    //                                   placeholder:
                                    //                                       'assets/indianoil.png', // Placeholder image path
                                    //                                   image:
                                    //                                       '${configModel!.baseUrls!.supportTicketImageUrl}/${controller.ordersList[index].details![0].product!.thumbnail!.toUpperCase()}', // Network image URL
                                    //                                   imageErrorBuilder: (context,
                                    //                                       error,
                                    //                                       stackTrace) {
                                    //                                     // Widget to display in case of an error
                                    //                                     return Image.asset("assets/indianoil.png", height: 94);
                                    //                                   },
                                    //                                   placeholderScale:
                                    //                                       1.0, // Optional: scale of the placeholder
                                    //                                 ),
                                    //                                 // Image
                                    //                                 //     .network(
                                    //                                 //   "${configModel!.baseUrls!.productThumbnailUrl}${controller.ordersList[index].details![0].product!.thumbnail!.toUpperCase()}",
                                    //                                 //   errorBuilder: (context,
                                    //                                 //       error,
                                    //                                 //       stackTrace) {
                                    //                                 //     return Image.asset(
                                    //                                 //         "assets/indianoil.png",
                                    //                                 //         height: 94);
                                    //                                 //   },
                                    //                                 // ),
                                    //                                 Padding(
                                    //                                   padding:
                                    //                                       const EdgeInsets.symmetric(horizontal: 12.0),
                                    //                                   child:
                                    //                                       Column(
                                    //                                     crossAxisAlignment: CrossAxisAlignment.start,
                                    //                                     children: [
                                    //                                       Text(
                                    //                                         "${controller.ordersList[index].details![0].product!.name.toString()}",
                                    //                                         style: TextStyle(
                                    //                                           fontSize: 16,
                                    //                                           fontWeight: FontWeight.bold,
                                    //                                         ),
                                    //                                       ),
                                    //                                       Text(
                                    //                                         " ${controller.ordersList[index].details![0].product!.slug.toString()}",
                                    //                                         style: TextStyle(
                                    //                                           color: Colors.grey,
                                    //                                           fontSize: 15,
                                    //                                           // fontWeight: FontWeight.bold,
                                    //                                         ),
                                    //                                       ),
                                    //                                       SizedBox(
                                    //                                         height: 6,
                                    //                                       ),
                                    //                                       Container(
                                    //                                         height: 34,
                                    //                                         width: 90,
                                    //                                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.amber),
                                    //                                         child: Center(
                                    //                                             child: Text(
                                    //                                           // 'On the way',
                                    //                                           '${controller.ordersList[index].deliveryServiceName.toString().toUpperCase()}',
                                    //                                           style: TextStyle(color: colors.whiteTemp),
                                    //                                         )),
                                    //                                       ),
                                    //                                     ],
                                    //                                   ),
                                    //                                 ),
                                    //                               ],
                                    //                             ),
                                    //                           ),
                                    //                         );
                                    //                       },
                                    //                     )
                                    //           ),
                                    //
                                    //           // GestureDetector(
                                    //           //   onTap: () {
                                    //           //     Navigator.push(
                                    //           //         context,
                                    //           //         MaterialPageRoute(
                                    //           //             builder: (context) =>
                                    //           //                 VenderDetails()));
                                    //           //   },
                                    //           //   child: Container(
                                    //           //     height: 110,
                                    //           //     margin: const EdgeInsets.all(6),
                                    //           //     decoration: BoxDecoration(
                                    //           //       color: Colors.grey.shade200,
                                    //           //       borderRadius:
                                    //           //           BorderRadius.circular(12),
                                    //           //     ),
                                    //           //     child: Padding(
                                    //           //       padding: const EdgeInsets.all(
                                    //           //           10.0),
                                    //           //       child: Row(
                                    //           //         children: [
                                    //           //           Image.asset(
                                    //           //               "assets/indianoil.png",
                                    //           //               height: 94),
                                    //           //           Padding(
                                    //           //             padding:
                                    //           //                 const EdgeInsets
                                    //           //                     .symmetric(
                                    //           //                     horizontal:
                                    //           //                         12.0),
                                    //           //             child: Column(
                                    //           //               crossAxisAlignment:
                                    //           //                   CrossAxisAlignment
                                    //           //                       .start,
                                    //           //               children: [
                                    //           //                 const Text(
                                    //           //                   "Speed Petrol",
                                    //           //                   style: TextStyle(
                                    //           //                     fontSize: 16,
                                    //           //                     fontWeight:
                                    //           //                         FontWeight
                                    //           //                             .bold,
                                    //           //                   ),
                                    //           //                 ),
                                    //           //                 Text(
                                    //           //                   " Lorem Ipsum is simply dumm",
                                    //           //                   style: TextStyle(
                                    //           //                     color:
                                    //           //                         Colors.grey,
                                    //           //                     fontSize: 15,
                                    //           //                     // fontWeight: FontWeight.bold,
                                    //           //                   ),
                                    //           //                 ),
                                    //           //                 SizedBox(
                                    //           //                   height: 6,
                                    //           //                 ),
                                    //           //                 Container(
                                    //           //                   height: 34,
                                    //           //                   width: 90,
                                    //           //                   decoration: BoxDecoration(
                                    //           //                       borderRadius:
                                    //           //                           BorderRadius
                                    //           //                               .circular(
                                    //           //                                   6),
                                    //           //                       color: Colors
                                    //           //                           .amber),
                                    //           //                   child: Center(
                                    //           //                       child: Text(
                                    //           //                     'On the way',
                                    //           //                     style: TextStyle(
                                    //           //                         color: colors
                                    //           //                             .whiteTemp),
                                    //           //                   )),
                                    //           //                 ),
                                    //           //               ],
                                    //           //             ),
                                    //           //           ),
                                    //           //         ],
                                    //           //       ),
                                    //           //     ),
                                    //           //   ),
                                    //           // ),
                                    //           // InkWell(
                                    //           //   onTap: () {
                                    //           //     Navigator.push(
                                    //           //         context,
                                    //           //         MaterialPageRoute(
                                    //           //             builder: (context) =>
                                    //           //                 VenderDetails2()));
                                    //           //   },
                                    //           //   child: Container(
                                    //           //     height: 110,
                                    //           //     margin: const EdgeInsets.all(6),
                                    //           //     decoration: BoxDecoration(
                                    //           //       color: Colors.grey.shade200,
                                    //           //       borderRadius:
                                    //           //           BorderRadius.circular(12),
                                    //           //     ),
                                    //           //     child: Padding(
                                    //           //       padding: const EdgeInsets.all(
                                    //           //           10.0),
                                    //           //       child: Row(
                                    //           //         children: [
                                    //           //           Image.asset(
                                    //           //               "assets/indianoil.png",
                                    //           //               height: 94),
                                    //           //           Padding(
                                    //           //             padding:
                                    //           //                 const EdgeInsets
                                    //           //                     .symmetric(
                                    //           //                     horizontal:
                                    //           //                         12.0),
                                    //           //             child: Column(
                                    //           //               crossAxisAlignment:
                                    //           //                   CrossAxisAlignment
                                    //           //                       .start,
                                    //           //               children: [
                                    //           //                 const Text(
                                    //           //                   "Diesel",
                                    //           //                   style: TextStyle(
                                    //           //                     fontSize: 16,
                                    //           //                     fontWeight:
                                    //           //                         FontWeight
                                    //           //                             .bold,
                                    //           //                   ),
                                    //           //                 ),
                                    //           //                 Text(
                                    //           //                   " Lorem Ipsum is simply dumm",
                                    //           //                   style: TextStyle(
                                    //           //                     color:
                                    //           //                         Colors.grey,
                                    //           //                     fontSize: 15,
                                    //           //                     // fontWeight: FontWeight.bold,
                                    //           //                   ),
                                    //           //                 ),
                                    //           //                 SizedBox(
                                    //           //                   height: 6,
                                    //           //                 ),
                                    //           //                 Container(
                                    //           //                   height: 34,
                                    //           //                   width: 90,
                                    //           //                   decoration: BoxDecoration(
                                    //           //                       borderRadius:
                                    //           //                           BorderRadius
                                    //           //                               .circular(
                                    //           //                                   6),
                                    //           //                       color: colors
                                    //           //                           .darkYellow),
                                    //           //                   child: Center(
                                    //           //                       child: Text(
                                    //           //                           'Fuel to go',
                                    //           //                           style: TextStyle(
                                    //           //                               color:
                                    //           //                                   colors.whiteTemp))),
                                    //           //                 ),
                                    //           //               ],
                                    //           //             ),
                                    //           //           ),
                                    //           //         ],
                                    //           //       ),
                                    //           //     ),
                                    //           //   ),
                                    //           // ),
                                    //           // Container(
                                    //           //   height: 110,
                                    //           //   margin: const EdgeInsets.all(6),
                                    //           //   decoration: BoxDecoration(
                                    //           //     color: Colors.grey.shade200,
                                    //           //     borderRadius:
                                    //           //         BorderRadius.circular(12),
                                    //           //   ),
                                    //           //   child: Padding(
                                    //           //     padding:
                                    //           //         const EdgeInsets.all(10.0),
                                    //           //     child: Row(
                                    //           //       children: [
                                    //           //         Image.asset(
                                    //           //             "assets/indianoil.png",
                                    //           //             height: 94),
                                    //           //         Padding(
                                    //           //           padding: const EdgeInsets
                                    //           //               .symmetric(
                                    //           //               horizontal: 12.0),
                                    //           //           child: Column(
                                    //           //             crossAxisAlignment:
                                    //           //                 CrossAxisAlignment
                                    //           //                     .start,
                                    //           //             children: [
                                    //           //               const Text(
                                    //           //                 "Diesel",
                                    //           //                 style: TextStyle(
                                    //           //                   fontSize: 16,
                                    //           //                   fontWeight:
                                    //           //                       FontWeight
                                    //           //                           .bold,
                                    //           //                 ),
                                    //           //               ),
                                    //           //               Text(
                                    //           //                 " Lorem Ipsum is simply dumm",
                                    //           //                 style: TextStyle(
                                    //           //                   color:
                                    //           //                       Colors.grey,
                                    //           //                   fontSize: 15,
                                    //           //                   // fontWeight: FontWeight.bold,
                                    //           //                 ),
                                    //           //               ),
                                    //           //               SizedBox(
                                    //           //                 height: 6,
                                    //           //               ),
                                    //           //               Container(
                                    //           //                 height: 34,
                                    //           //                 width: 120,
                                    //           //                 decoration: BoxDecoration(
                                    //           //                     borderRadius:
                                    //           //                         BorderRadius
                                    //           //                             .circular(
                                    //           //                                 6),
                                    //           //                     color:
                                    //           //                         Colors.red),
                                    //           //                 child: Center(
                                    //           //                     child: Text(
                                    //           //                   'Order Concelled',
                                    //           //                   style: TextStyle(
                                    //           //                       color: Colors
                                    //           //                           .white),
                                    //           //                 )),
                                    //           //               ),
                                    //           //             ],
                                    //           //           ),
                                    //           //         ),
                                    //           //       ],
                                    //           //     ),
                                    //           //   ),
                                    //           // ),
                                    //           // InkWell(
                                    //           //   onTap: () {
                                    //           //     Navigator.push(
                                    //           //         context,
                                    //           //         MaterialPageRoute(
                                    //           //             builder: (context) =>
                                    //           //                 VenderDetails4()));
                                    //           //   },
                                    //           //   child: Container(
                                    //           //     height: 110,
                                    //           //     margin: const EdgeInsets.all(6),
                                    //           //     decoration: BoxDecoration(
                                    //           //       color: Colors.grey.shade200,
                                    //           //       borderRadius:
                                    //           //           BorderRadius.circular(12),
                                    //           //     ),
                                    //           //     child: Padding(
                                    //           //       padding: const EdgeInsets.all(
                                    //           //           10.0),
                                    //           //       child: Row(
                                    //           //         children: [
                                    //           //           Image.asset(
                                    //           //               "assets/indianoil.png",
                                    //           //               height: 94),
                                    //           //           Padding(
                                    //           //             padding:
                                    //           //                 const EdgeInsets
                                    //           //                     .symmetric(
                                    //           //                     horizontal:
                                    //           //                         12.0),
                                    //           //             child: Column(
                                    //           //               crossAxisAlignment:
                                    //           //                   CrossAxisAlignment
                                    //           //                       .start,
                                    //           //               children: [
                                    //           //                 const Text(
                                    //           //                   "CNG",
                                    //           //                   style: TextStyle(
                                    //           //                     fontSize: 16,
                                    //           //                     fontWeight:
                                    //           //                         FontWeight
                                    //           //                             .bold,
                                    //           //                   ),
                                    //           //                 ),
                                    //           //                 Text(
                                    //           //                   " Lorem Ipsum is simply dumm",
                                    //           //                   style: TextStyle(
                                    //           //                     color:
                                    //           //                         Colors.grey,
                                    //           //                     fontSize: 15,
                                    //           //                     // fontWeight: FontWeight.bold,
                                    //           //                   ),
                                    //           //                 ),
                                    //           //                 SizedBox(
                                    //           //                   height: 6,
                                    //           //                 ),
                                    //           //                 Container(
                                    //           //                   height: 34,
                                    //           //                   width: 90,
                                    //           //                   decoration: BoxDecoration(
                                    //           //                       borderRadius:
                                    //           //                           BorderRadius
                                    //           //                               .circular(
                                    //           //                                   6),
                                    //           //                       color: Colors
                                    //           //                           .amber),
                                    //           //                   child: Center(
                                    //           //                     child: Text(
                                    //           //                       'Completed',
                                    //           //                       style: TextStyle(
                                    //           //                           color: Colors
                                    //           //                               .white),
                                    //           //                     ),
                                    //           //                   ),
                                    //           //                 ),
                                    //           //               ],
                                    //           //             ),
                                    //           //           ),
                                    //           //         ],
                                    //           //       ),
                                    //           //     ),
                                    //           //   ),
                                    //           // ),
                                    //         ],
                                    //       )
                                    //     : selectedIndex == 1
                                    //         ? ListView.builder(
                                    //             padding: EdgeInsets.zero,
                                    //             shrinkWrap: true,
                                    //             physics:
                                    //                 NeverScrollableScrollPhysics(),
                                    //             itemCount: 4,
                                    //             itemBuilder:
                                    //                 (context, index) {
                                    //               return Padding(
                                    //                 padding:
                                    //                     const EdgeInsets
                                    //                         .all(8.0),
                                    //                 child: InkWell(
                                    //                   onTap: () {
                                    //                     Navigator.push(
                                    //                         context,
                                    //                         MaterialPageRoute(
                                    //                             builder: (context) =>
                                    //                                 VenderDetails3(
                                    //                                   title:
                                    //                                       'Star Car Wash',
                                    //                                 )));
                                    //                   },
                                    //                   child: Container(
                                    //                     decoration: BoxDecoration(
                                    //                         borderRadius:
                                    //                             BorderRadius
                                    //                                 .circular(
                                    //                                     10),
                                    //                         color: colors
                                    //                             .lightgray),
                                    //                     child: Padding(
                                    //                       padding:
                                    //                           const EdgeInsets
                                    //                               .all(
                                    //                               8.0),
                                    //                       child: Row(
                                    //                         crossAxisAlignment:
                                    //                             CrossAxisAlignment
                                    //                                 .start,
                                    //                         children: [
                                    //                           Container(
                                    //                             decoration:
                                    //                                 BoxDecoration(
                                    //                               borderRadius:
                                    //                                   BorderRadius.circular(10),
                                    //                               // Add additional decoration properties here as needed
                                    //                             ),
                                    //                             width:
                                    //                                 100,
                                    //                             height:
                                    //                                 100,
                                    //                             child:
                                    //                                 ClipRRect(
                                    //                               // Use ClipRRect to clip the image with the specified border radius
                                    //                               borderRadius:
                                    //                                   BorderRadius.circular(10),
                                    //                               child: Image
                                    //                                   .network(
                                    //                                 'https://static.langimg.com/photo/imgsize-103878,msid-96686021/navbharat-times.jpg',
                                    //                                 fit: BoxFit
                                    //                                     .cover,
                                    //                               ),
                                    //                             ),
                                    //                           ),
                                    //                           SizedBox(
                                    //                             width: 20,
                                    //                           ),
                                    //                           Column(
                                    //                             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                             crossAxisAlignment:
                                    //                                 CrossAxisAlignment
                                    //                                     .start,
                                    //                             children: [
                                    //                               SizedBox(
                                    //                                 height:
                                    //                                     5,
                                    //                               ),
                                    //                               Text(
                                    //                                 'Star Car Wash',
                                    //                                 style: TextStyle(
                                    //                                     fontSize: 16,
                                    //                                     fontWeight: FontWeight.bold),
                                    //                               ),
                                    //                               SizedBox(
                                    //                                 height:
                                    //                                     5,
                                    //                               ),
                                    //                               Text(
                                    //                                 'Free vector icon.thousands',
                                    //                                 style:
                                    //                                     TextStyle(color: colors.greyTemp),
                                    //                               ),
                                    //                               SizedBox(
                                    //                                 height:
                                    //                                     5,
                                    //                               ),
                                    //                               Row(
                                    //                                 children: [
                                    //                                   const Text('₹350',
                                    //                                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                    //                                   const SizedBox(
                                    //                                     width: 75,
                                    //                                   ),
                                    //                                   Container(
                                    //                                     height: 28,
                                    //                                     width: 80,
                                    //                                     decoration: BoxDecoration(
                                    //                                         borderRadius: BorderRadius.circular(5),
                                    //                                         color: index == 0
                                    //                                             ? colors.primary
                                    //                                             : index == 1
                                    //                                                 ? colors.greenTemp
                                    //                                                 : colors.primary),
                                    //                                     child: Center(
                                    //                                       child: Text(
                                    //                                         index == 0
                                    //                                             ? 'Pending'
                                    //                                             : index == 1
                                    //                                                 ? "Completed"
                                    //                                                 : 'Pending',
                                    //                                         textAlign: TextAlign.center,
                                    //                                         style: TextStyle(color: colors.whiteTemp),
                                    //                                       ),
                                    //                                     ),
                                    //                                   )
                                    //                                 ],
                                    //                               )
                                    //                             ],
                                    //                           )
                                    //                         ],
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //               );
                                    //             },
                                    //           )
                                    //         : ListView.builder(
                                    //             padding: EdgeInsets.zero,
                                    //             shrinkWrap: true,
                                    //             physics:
                                    //                 NeverScrollableScrollPhysics(),
                                    //             itemCount: 10,
                                    //             itemBuilder:
                                    //                 (context, index) {
                                    //               return Padding(
                                    //                 padding:
                                    //                     const EdgeInsets
                                    //                         .all(8.0),
                                    //                 child: InkWell(
                                    //                   onTap: () {
                                    //                     /*Navigator.push(
                                    //                   context,
                                    //                   MaterialPageRoute(
                                    //                       builder: (context) =>
                                    //                           CarWashList()));*/
                                    //                   },
                                    //                   child: Container(
                                    //                     decoration: BoxDecoration(
                                    //                         borderRadius:
                                    //                             BorderRadius
                                    //                                 .circular(
                                    //                                     10),
                                    //                         color: colors
                                    //                             .lightgray),
                                    //                     child: Padding(
                                    //                       padding:
                                    //                           const EdgeInsets
                                    //                               .all(
                                    //                               8.0),
                                    //                       child: Row(
                                    //                         crossAxisAlignment:
                                    //                             CrossAxisAlignment
                                    //                                 .start,
                                    //                         children: [
                                    //                           Container(
                                    //                             decoration:
                                    //                                 BoxDecoration(
                                    //                               borderRadius:
                                    //                                   BorderRadius.circular(10),
                                    //                               // Add additional decoration properties here as needed
                                    //                             ),
                                    //                             width:
                                    //                                 100,
                                    //                             height:
                                    //                                 100,
                                    //                             child:
                                    //                                 ClipRRect(
                                    //                               // Use ClipRRect to clip the image with the specified border radius
                                    //                               borderRadius:
                                    //                                   BorderRadius.circular(10),
                                    //                               child: Image
                                    //                                   .asset(
                                    //                                 'assets/tyre.png',
                                    //                                 fit: BoxFit
                                    //                                     .cover,
                                    //                               ),
                                    //                             ),
                                    //                           ),
                                    //                           SizedBox(
                                    //                             width: 20,
                                    //                           ),
                                    //                           Column(
                                    //                             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                             crossAxisAlignment:
                                    //                                 CrossAxisAlignment
                                    //                                     .start,
                                    //                             children: [
                                    //                               SizedBox(
                                    //                                 height:
                                    //                                     5,
                                    //                               ),
                                    //                               Text(
                                    //                                 'Perfinza CLX1',
                                    //                                 style: TextStyle(
                                    //                                     fontSize: 16,
                                    //                                     fontWeight: FontWeight.bold),
                                    //                               ),
                                    //                               SizedBox(
                                    //                                 height:
                                    //                                     5,
                                    //                               ),
                                    //                               Text(
                                    //                                 '205/55R16 91V TL',
                                    //                                 style:
                                    //                                     TextStyle(color: colors.greyTemp),
                                    //                               ),
                                    //                               SizedBox(
                                    //                                 height:
                                    //                                     5,
                                    //                               ),
                                    //                               Text(
                                    //                                   '₹ 9170',
                                    //                                   style:
                                    //                                       TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                                    //                             ],
                                    //                           )
                                    //                         ],
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //               );
                                    //             },
                                    //           )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  categoryWidget() {
    return SizedBox(
      height: 52,
      child: ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryProducts(
            text: category[index],
            press: () {
              setState(() {
                selectedIndex = index;
              });
            },
            isSelected: selectedIndex == index,
          );
        },
      ),
    );
  }
}

class CategoryProducts extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final bool isSelected;

  const CategoryProducts({
    Key? key,
    required this.text,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: 5,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? Colors.orange : Colors.grey,
              // width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.orange : Colors.grey,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
