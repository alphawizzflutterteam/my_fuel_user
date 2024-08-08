import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/widgets/globle_widgets.dart';
import 'package:test_prj/home_page.dart';
import 'package:test_prj/orderfuel/EV/charginStationDetails.dart';
import 'package:test_prj/splashScreen.dart';

import '../components/my_button.dart';
import '../controller/carservice_controller.dart';
import '../helper/colors.dart';
import '../myOrder/CarWash.dart';
import '../staticpage/Carwashdetails.dart';

class CarWashList extends StatefulWidget {
  const CarWashList({super.key});

  @override
  State<CarWashList> createState() => _CarWashListState();
}

class _CarWashListState extends State<CarWashList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    CarServiceController carServiceController = Get.put(CarServiceController());
    carServiceController.getVendors(
        otherCategory.categoryId.toString(),
        otherCategory.service.toString(),
        otherCategory.timeSlotId.toString(),
        otherCategory.date.toString(),
        otherCategory.vehicleType.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarServiceController>(
        init: CarServiceController(),
        builder: (carServiceController) {
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
              title: Text('Vendor List'.tr),
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 55,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Image.asset(
                                    "assets/Search.png",
                                    scale: 20,
                                  ),
                                  fillColor:
                                      const Color.fromRGBO(245, 245, 245, 1),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "Search"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8), // Added spacing
                        InkWell(
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            child: const Icon(Icons.format_align_right_rounded))
                      ],
                    ),
                    Obx(() => carServiceController.isLoading.value == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : carServiceController.sellerList!.length == 0
                            ? Center(
                                child: Text("No Vendors Found"),
                              )
                            : ListView.builder(
                                physics: AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    carServiceController.sellerList!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.off(Carwashdetails(
                                            sellerData: carServiceController
                                                .sellerList![index]));
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             Carwashdetails()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: colors.lightgray),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  // Add additional decoration properties here as needed
                                                ),
                                                width: 100,
                                                height: 100,
                                                child: ClipRRect(
                                                  // Use ClipRRect to clip the image with the specified border radius
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    "${configModel?.baseUrls?.sellerImageUrl}/${carServiceController.sellerList?[index].seller?.image.toString()}",
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return errorImage(
                                                          100, 100);
                                                    },
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${carServiceController.sellerList![index].seller!.fName.toString()}',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons
                                                          .location_on_outlined),
                                                      Text(
                                                        "${carServiceController.sellerList![index].seller!.shop!.address.toString()}",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          carServiceController
                                                                      .sellerList?[
                                                                          index]
                                                                      .products
                                                                      ?.length ==
                                                                  0
                                                              ? "₹ 0.0"
                                                              : '₹ ${carServiceController.sellerList![index].products![0].unitPrice.toString()}',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      SizedBox(
                                                        width: 75,
                                                      ),
                                                      Container(
                                                        height: 30,
                                                        width: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 1,
                                                              blurRadius: 10,
                                                            )
                                                          ],
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .star_fill,
                                                              size: 18,
                                                              color:
                                                                  Colors.orange,
                                                            ),
                                                            SizedBox(width: 5),
                                                            Text(
                                                              '${carServiceController.sellerList![index].avg_rating}',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 400,
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 20),
                    child: Text(
                      "Filter",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(right: 290),
                  child: Text(
                    "Price",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey.withOpacity(0.2),
                            border: Border.all(color: colors.greyTemp)),
                        height: 40,
                        width: 140,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 15),
                          child: Text(
                            'Min',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'to',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.greyTemp),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 40,
                        width: 140,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 15),
                          child: Text(
                            'Max',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(right: 275),
                  child: Text(
                    "Rating",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.greyTemp),
                        ),
                        height: 30,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child: Text(
                            '2.0 and above',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.greyTemp),
                        ),
                        height: 30,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child: Text(
                            '3.0 and above',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.greyTemp),
                        ),
                        height: 30,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child: Text(
                            '4.0 and above',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.greyTemp),
                        ),
                        height: 30,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child: Text(
                            '3.5 and above',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.greyTemp),
                        ),
                        height: 30,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child: Text(
                            '4.5 and above',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          width: 160,
                          height: 45,
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              border: Border.all(color: colors.greyTemp),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Cencel',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 160,
                        height: 45,
                        child: MyButton(
                          text: 'Apply',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
