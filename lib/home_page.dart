import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_prj/components/home_slider.dart';
import 'package:test_prj/components/my_textfield.dart';
import 'package:test_prj/controller/cart_controller.dart';
import 'package:test_prj/controller/home_controller.dart';
import 'package:test_prj/helper/utils/validator_all.dart';
import 'package:test_prj/home.dart';
import 'package:test_prj/profile/notification1.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/forLooking.dart';
import 'package:test_prj/schedule_day.dart';
import 'package:test_prj/splashScreen.dart';
import 'Home/car_service.dart';
import 'Home/fuel_on_tab.dart';
import 'Home/insurance_scr.dart';
import 'Home/rescue_me_src.dart';
import 'Home/tyres_screen.dart';
import 'SelectNewAddress.dart';
import 'components/my_button.dart';
import 'components/my_hinttext_field.dart';
import 'controller/carservice_controller.dart';
import 'controller/internet_controller.dart';
import 'controller/splash_controller.dart';
import 'data/model/OtherCategoryModel.dart';
import 'data/model/VehicleModel.dart';
import 'data/model/VehicleType.dart';
import 'helper/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

OtherCategory otherCategory = OtherCategory();

class _HomePageState extends State<HomePage> {
  List<String> vehicles = ['Two Wheeler', 'Four Wheeler ,Heavy Vehicle'];
  List<String> productsAndServices = [
    'Genset Maintenance',
    'Fuel Management Services ',
    'Fuel on Tap',
    'My Fuels Jerry...'
  ];

  String? selectedVehicleManufacture;
  String? selectModel;

  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUI();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    CarServiceController controller = Get.find();
    controller.getVehiCleType();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InternetController>(
        init: InternetController(),
        builder: (connectivityController) {
          return Obx(() {
            print("object Vlue $connectivityController");
            return connectivityController.isConnected
                ? GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (controller) {
                      print("object Vlue $controller");
                      controller.getBanner();
                      controller.getHomeList();
                      return SingleChildScrollView(
                        child: Container(
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

                                  // Top App bar
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/mingcute_location-fill.png",
                                            // scale: 20,
                                            height: 24,
                                          ),
                                          const SizedBox(width: 8),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Ward 35",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                "Ratan Lok Colony Indore",
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
                                          // Image.asset(
                                          //   "assets/Group 2979.png",
                                          //   height: 24,
                                          // ),
                                          const Icon(
                                            Icons.search,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          const SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Notification1(),
                                                )),
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 27),

                                          // search bar
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.symmetric(horizontal: 16.0),
                                          //   child: SizedBox(
                                          //     height: 55,
                                          //     child: TextFormField(
                                          //       decoration: InputDecoration(
                                          //           prefixIcon: Image.asset(
                                          //             "assets/Search.png",
                                          //             scale: 20,
                                          //           ),
                                          //           fillColor: Color.fromRGBO(245, 245, 245, 1),
                                          //           filled: true,
                                          //           enabledBorder: OutlineInputBorder(
                                          //             borderRadius: BorderRadius.circular(12),
                                          //             borderSide: BorderSide.none,
                                          //           ),
                                          //           // enabled: true,
                                          //           hintText: "Search"),
                                          //     ),
                                          //   ),
                                          // ),
                                          // SizedBox(height: 16),

                                          // Order fuel section
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LookingForCompany()),
                                              );
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: Container(
                                                height: 59,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      138, 180, 2, 200),
                                                  border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        138, 180, 2, 10),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        "assets/login-logo.png",
                                                        height: 36),
                                                    const SizedBox(width: 13),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Order Fuel".tr,
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Door Step Delivery"
                                                              .tr,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromRGBO(
                                                                    89,
                                                                    89,
                                                                    89,
                                                                    1),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(width: 124),
                                                    GestureDetector(
                                                      // onTap: () => Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //       builder: (context) =>
                                                      //           const LookingForCompany(),
                                                      //     )),
                                                      child: Image.asset(
                                                        "assets/Arrow - Down 2.png",
                                                        height: 24,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.symmetric(horizontal: 20.0),
                                          //   child: Divider(
                                          //     color: Color.fromRGBO(138, 180, 2, 100),
                                          //     thickness: 2,
                                          //   ),
                                          // ),
                                          const SizedBox(height: 24),

                                          // slider
                                          const SliderHome(),
                                          const SizedBox(height: 30),

                                          // Products & Services
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    255, 243, 236, 1)),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 28),
                                                Text(
                                                  "Products & Services".tr,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),

                                                Obx(() {
                                                  print(
                                                      "controller.serviceList ${controller.serviceList} ");
                                                  return controller.serviceList
                                                          .isNotEmpty
                                                      ? GridView.builder(
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          primary: false,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          itemCount: controller
                                                              .serviceList
                                                              .length,
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            childAspectRatio:
                                                                95 / 120,
                                                            crossAxisSpacing:
                                                                10,
                                                            mainAxisSpacing:
                                                                10.0,
                                                          ),
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int i) {
                                                            return Stack(
                                                                children: [
                                                                  InkWell(
                                                                    child:
                                                                        Container(
                                                                      // child: Image.asset('assets/fuel.png',fit: BoxFit.cover,),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(20),
                                                                          image: DecorationImage(
                                                                              image: NetworkImage(
                                                                                "${configModel?.baseUrls?.categoryImageUrl}/${controller.serviceList[i].icon}",
                                                                              ),
                                                                              fit: BoxFit.cover)),
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          2.4,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          2.4,
                                                                    ),
                                                                    onTap: () {
                                                                      // Here Tap Sercice Detail
                                                                      if (i ==
                                                                          0) {
                                                                        controller
                                                                            .getServiceDetails(controller.serviceList[i].id.toString())
                                                                            .then((value) {
                                                                          categoryId = controller
                                                                              .serviceList[i]
                                                                              .id
                                                                              .toString();
                                                                          genesetMaintenance(
                                                                              context);
                                                                        });
                                                                      } else if (i ==
                                                                          1) {
                                                                        fuelManagmentServices(
                                                                            context,
                                                                            controller.serviceList[i].id.toString());
                                                                      } else if (i ==
                                                                          2) {
                                                                        controller
                                                                            .getServiceDetails(controller.serviceList[i].id.toString())
                                                                            .then((value) {
                                                                          categoryId = controller
                                                                              .serviceList[i]
                                                                              .id
                                                                              .toString();
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => FuelOnTabScreen(),
                                                                              ));
                                                                        });
                                                                      } else {
                                                                        controller
                                                                            .getServiceDetails(controller.serviceList[i].id.toString())
                                                                            .then((value) {
                                                                          categoryId = controller
                                                                              .serviceList[i]
                                                                              .id
                                                                              .toString();
                                                                          print(
                                                                              "object categoryId $categoryId");
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => FuelOnTabScreen(title: "My Fuel Jerry Can"),
                                                                              ));
                                                                        });
                                                                      }
                                                                    },
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 10,
                                                                    left: 5,
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              100,
                                                                          child:
                                                                              Text(
                                                                            "${controller.serviceList[i].name}",
                                                                            maxLines:
                                                                                2,
                                                                            style:
                                                                                const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                                                            overflow:
                                                                                TextOverflow.visible,
                                                                          ),
                                                                        ),
                                                                        i % 4 == 2 ||
                                                                                i % 4 == 3
                                                                            ? const Text(
                                                                                '0.5 kl/LK/2KI',
                                                                                style: TextStyle(color: Colors.grey),
                                                                                overflow: TextOverflow.visible,
                                                                              )
                                                                            : const SizedBox()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ]);
                                                          })
                                                      : Container(
                                                          child: Text(
                                                              "No Self Service Found"),
                                                        );
                                                }),

                                                // const SizedBox(height: 20),
                                                // productTile(),
                                                // const SizedBox(height: 12),
                                                // productTile(),
                                                // const SizedBox(height: 12),
                                                // productTile(),
                                                // const SizedBox(height: 50),
                                              ],
                                            ),
                                          ),

                                          Obx(() => controller
                                                      .otherList.length ==
                                                  0
                                              ? Container()
                                              : GridView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  primary: false,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  itemCount: controller
                                                      .otherList.length,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    childAspectRatio: 95 / 108,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 5.0,
                                                  ),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int i) {
                                                    return InkWell(
                                                      onTap: () {
                                                        print(
                                                            "OtherId ${controller.otherList[i].id}");
                                                        categoryId = controller
                                                            .otherList[i].id
                                                            .toString();
                                                        if (controller
                                                                .otherList[i]
                                                                .id ==
                                                            16) {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          RescueMe()));
                                                        } else if (controller
                                                                .otherList[i]
                                                                .id ==
                                                            9) {
                                                          tyresBottomSheet(
                                                              context);
                                                        } else if (controller
                                                                .otherList[i]
                                                                .id ==
                                                            10) {
                                                          batteryBottomSheet(
                                                              context);
                                                        } else if (controller
                                                                .otherList[i]
                                                                .id ==
                                                            11) {
                                                          carwashBottomShee(
                                                              context);
                                                        } else if (controller
                                                                .otherList[i]
                                                                .id ==
                                                            8) {
                                                          _showBottomSheet(
                                                              context);
                                                        } else if (controller
                                                                .otherList[i]
                                                                .id ==
                                                            17) {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          Insurance_Scr()));
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 80,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 15),
                                                        child: Column(
                                                          children: [
                                                            Image.network(
                                                              "${configModel?.baseUrls?.categoryImageUrl}/${controller.otherList[i].icon}",
                                                              height: 60,
                                                              errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                "assets/rescue.png",
                                                                height: 60,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Text(
                                                              "${controller.otherList[i].name}",
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        89,
                                                                        89,
                                                                        89,
                                                                        1),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  })),

                                          // Category section
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 10),
                                            child: Container(
                                              height: 20,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20),
                                              // child: Column(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.spaceBetween,
                                              //   children: [
                                              //     Row(
                                              //       mainAxisAlignment:
                                              //           MainAxisAlignment.spaceBetween,
                                              //       children: [
                                              //         InkWell(
                                              //           onTap: () {
                                              //             Navigator.push(
                                              //                 context,
                                              //                 MaterialPageRoute(
                                              //                     builder: (context) =>
                                              //                         const RescueMe()));
                                              //           },
                                              //           child: Container(
                                              //             child: Column(
                                              //               children: [
                                              //                 Image.asset(
                                              //                   "assets/rescue.png",
                                              //                   height: 60,
                                              //                 ),
                                              //                 const SizedBox(height: 10),
                                              //                 const Text(
                                              //                   "Rescue Me",
                                              //                   style: TextStyle(
                                              //                     color: Color.fromRGBO(
                                              //                         89, 89, 89, 1),
                                              //                   ),
                                              //                 )
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ),
                                              //         InkWell(
                                              //           onTap: () {
                                              //             _showBottomSheet(context);
                                              //           },
                                              //           child: Container(
                                              //             child: Column(
                                              //               children: [
                                              //                 Image.asset(
                                              //                   "assets/dummy.png",
                                              //                   height: 60,
                                              //                 ),
                                              //                 const SizedBox(height: 10),
                                              //                 const Text(
                                              //                   "Car Service",
                                              //                   style: TextStyle(
                                              //                     color: Color.fromRGBO(
                                              //                         89, 89, 89, 1),
                                              //                   ),
                                              //                 )
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ),
                                              //         InkWell(
                                              //           onTap: () {
                                              //             Navigator.push(
                                              //                 context,
                                              //                 MaterialPageRoute(
                                              //                     builder: (context) =>
                                              //                         const Insurance_Scr()));
                                              //           },
                                              //           child: Container(
                                              //             child: Column(
                                              //               children: [
                                              //                 Image.asset(
                                              //                   "assets/insurance.png",
                                              //                   height: 60,
                                              //                 ),
                                              //                 const SizedBox(height: 10),
                                              //                 const Text(
                                              //                   "Insurance",
                                              //                   style: TextStyle(
                                              //                     color: Color.fromRGBO(
                                              //                         89, 89, 89, 1),
                                              //                   ),
                                              //                 )
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //     Row(
                                              //       mainAxisAlignment:
                                              //           MainAxisAlignment.spaceBetween,
                                              //       children: [
                                              //         InkWell(
                                              //           onTap: () {
                                              //             tyresBottomSheet(context);
                                              //           },
                                              //           child: Container(
                                              //             child: Column(
                                              //               children: [
                                              //                 Image.asset(
                                              //                   "assets/tyres.png",
                                              //                   height: 60,
                                              //                 ),
                                              //                 const SizedBox(height: 10),
                                              //                 const Text(
                                              //                   "Tyres",
                                              //                   style: TextStyle(
                                              //                     color: Color.fromRGBO(
                                              //                         89, 89, 89, 1),
                                              //                   ),
                                              //                 )
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ),
                                              //         InkWell(
                                              //           onTap: () {
                                              //             batteryBottomSheet(context);
                                              //           },
                                              //           child: Container(
                                              //             child: Column(
                                              //               children: [
                                              //                 Image.asset(
                                              //                   "assets/insurance.png",
                                              //                   height: 60,
                                              //                 ),
                                              //                 const SizedBox(height: 10),
                                              //                 const Text(
                                              //                   "Battery",
                                              //                   style: TextStyle(
                                              //                     color: Color.fromRGBO(
                                              //                         89, 89, 89, 1),
                                              //                   ),
                                              //                 )
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ),
                                              //         InkWell(
                                              //           onTap: () {
                                              //             carwashBottomShee(context);
                                              //           },
                                              //           child: Container(
                                              //             child: Column(
                                              //               children: [
                                              //                 Image.asset(
                                              //                   "assets/carwash.png",
                                              //                   height: 60,
                                              //                 ),
                                              //                 const SizedBox(height: 10),
                                              //                 const Text(
                                              //                   "Car Wash",
                                              //                   style: TextStyle(
                                              //                     color: Color.fromRGBO(
                                              //                         89, 89, 89, 1),
                                              //                   ),
                                              //                 )
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //   ],
                                              // ),
                                            ),
                                          ),

                                          const Row(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Image.asset("assets/server-down.jpg",
                              width: 200, height: 200),
                        ),
                        const SizedBox(height: 80),
                        const Text(
                          'No Internet Connection',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'No internet connection found. Check your \n connection or try again!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  );
          });
        });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap your content in SingleChildScrollView
          child: Container(
            padding: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Enter Your Vehicle Number',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GetBuilder<CarServiceController>(
                        init: CarServiceController(),
                        builder: (carserviceController) {
                          return DropdownButton<VehicleData>(
                            hint: const Text('Vehicle Type'),
                            value: carserviceController.selectedVehicle.value,
                            underline: Container(),
                            isExpanded: true,
                            onChanged: (VehicleData? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  carserviceController.selectedVehicle.value =
                                      newValue;
                                });
                              }
                            },
                            items: carserviceController.vehicleList!
                                .map<DropdownMenuItem<VehicleData>>(
                                    (VehicleData value) {
                              return DropdownMenuItem<VehicleData>(
                                value: value,
                                child: Text(value.name.toString()),
                              );
                            }).toList(),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.black12, width: 2)),
                    child: const MyHintTextField(
                      hintText: Text(
                        "Vehicle Number",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CarService()));

                      // Add your onTap logic here
                    },
                    child: Container(
                      child: const MyButton(
                        text: "Submit",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void tyresBottomSheet(BuildContext context) {
    TextEditingController tyreSizeController = TextEditingController();
    final _formKeyReset = GlobalKey<FormState>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return GetBuilder<CarServiceController>(
            init: CarServiceController(),
            builder: (carServiceController) {
              return SingleChildScrollView(
                // Wrap your content in SingleChildScrollView
                child: Container(
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKeyReset,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Select a Tyres For your Vehicle',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 55,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: colors.black12, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Obx(() => DropdownButton<VehicleData>(
                                    hint: Text(
                                        'Select Vehicle Manufacture Type'.tr),
                                    value: carServiceController
                                        .selectedVehicleManufacture.value,
                                    underline: Container(),
                                    isExpanded: true,
                                    onChanged: (VehicleData? newValue) {
                                      if (newValue != null) {
                                        carServiceController
                                            .selectedVehicleManufacture
                                            .value = newValue;
                                        otherCategory.vehicleType =
                                            newValue.id.toString();
                                        carServiceController.getVehicleModel(
                                            newValue.id.toString());
                                        setState(() {});
                                      }
                                    },
                                    items: carServiceController.vehicleList!
                                        .map<DropdownMenuItem<VehicleData>>(
                                            (VehicleData value) {
                                      return DropdownMenuItem<VehicleData>(
                                        value: value,
                                        child: Text(value.name.toString()),
                                      );
                                    }).toList(),
                                  ))
                              // DropdownButton<String>(
                              //   hint: const Text('Select Vehicle Manufacture Type'),
                              //   value: selectedVehicleManufacture,
                              //   underline: Container(),
                              //   isExpanded: true,
                              //   onChanged: (String? newValue) {
                              //     if (newValue != null) {
                              //       // otherCategory.vehicleType = newValue.
                              //       setState(() {
                              //         selectedVehicleManufacture = newValue;
                              //       });
                              //     }
                              //   },
                              //   items: vehicles
                              //       .map<DropdownMenuItem<String>>((String value) {
                              //     return DropdownMenuItem<String>(
                              //       value: value,
                              //       child: Text(value),
                              //     );
                              //   }).toList(),
                              // ),
                              ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 55,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: colors.black12, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: carServiceController
                                        .vehicleModelList!.isNotEmpty &&
                                    carServiceController.selectedService !=
                                        null &&
                                    carServiceController
                                            .selectedService.value !=
                                        null
                                ? Obx(() => DropdownButton<VehicleModelData>(
                                      hint: Text('Select Model'.tr),
                                      value: carServiceController
                                          .selectedService.value,
                                      underline: Container(),
                                      isExpanded: true,
                                      onChanged: (VehicleModelData? newValue) {
                                        if (newValue != null) {
                                          otherCategory.vehicleModel =
                                              newValue.id.toString();
                                          carServiceController
                                              .selectedService.value = newValue;
                                          // setState(() { });
                                        }
                                      },
                                      items: carServiceController
                                          .vehicleModelList!
                                          .map<
                                                  DropdownMenuItem<
                                                      VehicleModelData>>(
                                              (VehicleModelData value) {
                                        return DropdownMenuItem<
                                            VehicleModelData>(
                                          value: value,
                                          child: Text(value.name.toString()),
                                        );
                                      }).toList(),
                                    ))
                                : Container(),
                            // DropdownButton<String>(
                            //   hint: const Text('Select Model'),
                            //   value: selectModel,
                            //   underline: Container(),
                            //   isExpanded: true,
                            //   onChanged: (String? newValue) {
                            //     if (newValue != null) {
                            //       setState(() {
                            //         selectModel = newValue;
                            //       });
                            //     }
                            //   },
                            //   items: vehicles
                            //       .map<DropdownMenuItem<String>>((String value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: Text(value),
                            //     );
                            //   }).toList(),
                            // ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: colors.black12, width: 2)),
                            child: MyTextField(
                              labelText: Text(
                                "Tyre Size",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              validator: (value) => Validator.validateWithhint(
                                  value, "Tyre Size"),
                              isAmount: true,
                              controller: tyreSizeController,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              if (_formKeyReset!.currentState!.validate()) {
                                otherCategory.tyreSize =
                                    tyreSizeController.text.toString();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TyresScreen(
                                              page: 1,
                                            )));
                              }

                              // Add your onTap logic here
                            },
                            child: Container(
                              child: const MyButton(
                                text: "Continue",
                              ),
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

  void batteryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap your content in SingleChildScrollView
          child: Container(
            padding: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Select a Tyres For your Vehicle',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      hint: const Text('Select Vehicle Manufacture Type'),
                      value: selectedVehicleManufacture,
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedVehicleManufacture = newValue;
                          });
                        }
                      },
                      items: vehicles
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      hint: const Text('Select Model'),
                      value: selectModel,
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectModel = newValue;
                          });
                        }
                      },
                      items: vehicles
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TyresScreen(
                                    page: 2,
                                  )));

                      // Add your onTap logic here
                    },
                    child: Container(
                      child: const MyButton(
                        text: "Submit",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 280,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: colors.primary.withOpacity(.2),
                    ),
                    child: const Icon(
                      Icons.book_online_sharp,
                      color: colors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'On of our agents will connect',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Text(
                    'you shortly',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const MyButton(
                      text: "Back to home",
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void carwashBottomShee(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap your content in SingleChildScrollView
          child: Container(
            padding: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Select Car Type',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GetBuilder<CarServiceController>(
                        init: CarServiceController(),
                        builder: (carController) {
                          return DropdownButton<VehicleData>(
                            hint: const Text('Select Your Vehicle Type'),
                            value: carController.selectedVehicle!.value,
                            underline: Container(),
                            isExpanded: true,
                            onChanged: (VehicleData? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  carController.selectedVehicle!.value =
                                      newValue;
                                });
                              }
                            },
                            items: carController.vehicleList!
                                .map<DropdownMenuItem<VehicleData>>(
                                    (VehicleData value) {
                              return DropdownMenuItem<VehicleData>(
                                value: value,
                                child: Text(value.name.toString()),
                              );
                            }).toList(),
                          );
                        }),
                  ),
                  // SizedBox(height: 10,),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(color: colors.black12,width: 2 )
                  //   ),
                  //   child: MyHintTextField(
                  //     hintText: Text(
                  //       "Vehicle Number",
                  //       style: TextStyle(
                  //         color: Colors.grey,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TyresScreen(
                                    page: 3,
                                    title: "carWash",
                                  )));

                      // Add your onTap logic here
                    },
                    child: Container(
                      child: const MyButton(
                        text: "Book Now",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<bool> _selections = [true, true, false, false];

  void genesetMaintenance(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, genesetState) {
            return GetBuilder<HomeController>(
                init: HomeController(),
                builder: (homeController) {
                  return SingleChildScrollView(
                    // Wrap your content in SingleChildScrollView
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Genset Maintenance'.tr,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: colors.greyTemp.withOpacity(.1)),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                  'lorem lpsum is simply dummy text of the printing and typesetting industry'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() => ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: homeController
                                          .servicesDetailModel
                                          .value
                                          .products!
                                          .length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            genesetState(() {
                                              homeController
                                                      .servicesDetailModel
                                                      .value
                                                      .products![index]
                                                      .selections =
                                                  !homeController
                                                      .servicesDetailModel
                                                      .value
                                                      .products![index]
                                                      .selections!;
                                            });
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            padding: const EdgeInsets.all(15.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: homeController
                                                        .servicesDetailModel
                                                        .value
                                                        .products![index]
                                                        .selections!
                                                    ? colors.greenTemp
                                                    : colors.greyTemp
                                                        .withOpacity(0.5),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  _getServiceText(index),
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                                if (homeController
                                                    .servicesDetailModel
                                                    .value
                                                    .products![index]
                                                    .selections!)
                                                  const Icon(
                                                      Icons
                                                          .check_circle_outline_rounded,
                                                      color: colors.greenTemp),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )),
                                // ListView.builder(
                                //   shrinkWrap: true,
                                //   physics: NeverScrollableScrollPhysics(),
                                //   itemCount: _selections.length,
                                //   itemBuilder: (context, index) {
                                //     return GestureDetector(
                                //       onTap: () {
                                //         genesetState(() {
                                //           _selections[index] = !_selections[index];
                                //         });
                                //       },
                                //       child: Container(
                                //         margin:
                                //             const EdgeInsets.symmetric(vertical: 8.0),
                                //         padding: const EdgeInsets.all(15.0),
                                //         decoration: BoxDecoration(
                                //           border: Border.all(
                                //             color: _selections[index]
                                //                 ? colors.greenTemp
                                //                 : colors.greyTemp.withOpacity(0.5),
                                //             width: 2.0,
                                //           ),
                                //           borderRadius: BorderRadius.circular(8.0),
                                //         ),
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             Text(
                                //               _getServiceText(index),
                                //               style: const TextStyle(fontSize: 18),
                                //             ),
                                //             if (_selections[index])
                                //               const Icon(
                                //                   Icons.check_circle_outline_rounded,
                                //                   color: colors.greenTemp),
                                //           ],
                                //         ),
                                //       ),
                                //     );
                                //   },
                                // ),

                                const SizedBox(
                                  height: 50,
                                ),
                                GetBuilder<CartController>(
                                    init: CartController(),
                                    builder: (cartcontroller) {
                                      return InkWell(
                                        onTap: () {
                                          List<String> ListItem = [];

                                          homeController.servicesDetailModel
                                              .value.products!
                                              .forEach((element) {
                                            if (element.selections == true) {
                                              ListItem.add(
                                                  element.id.toString());
                                            }
                                          });

                                          if (ListItem.length == 0) {
                                            Fluttertoast.showToast(
                                                msg: "Please select Category");
                                            return;
                                          }

                                          cartcontroller.AddTocart(
                                                  ListItem.join(","))
                                              .then((value) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SelectNewAddress(
                                                          isFromFGenSet: true,
                                                        )));
                                          });

                                          // _showBottomSheet(context);
                                        },
                                        child: MyButton(
                                          text: "Next".tr,
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        );
      },
    );
  }

  String _getServiceText(int index) {
    switch (index) {
      case 0:
        return 'Engine Oil and Filter';
      case 1:
        return 'Periodic Service';
      case 2:
        return 'Full Service';
      case 3:
        return 'Others';
      default:
        return '';
    }
  }

  final _formKeyReset = GlobalKey<FormState>();
  TextEditingController monthcontroller = TextEditingController();
  TextEditingController noofassetcontroller = TextEditingController();
  TextEditingController fuelConpcontroller = TextEditingController();
  void fuelManagmentServices(BuildContext context, String id) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return SingleChildScrollView(
                // Wrap your content in SingleChildScrollView
                child: Container(
                  padding: EdgeInsets.zero,
                  child: Form(
                    key: _formKeyReset,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Fuel Management Services'.tr,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: colors.greyTemp.withOpacity(.1)),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                                'lorem lpsum is simply dummy text of the printing and typesetting industry'),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                MyTextField(
                                  labelText: Text("Monthly Consumption".tr),
                                  controller: monthcontroller,
                                  validator: (value) =>
                                      Validator.validateName(value),
                                ),
                                // Container(
                                //   padding: const EdgeInsetsDirectional.symmetric(
                                //       horizontal: 10, vertical: 10),
                                //   height: 50,
                                //   width: MediaQuery.sizeOf(context).width,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(10),
                                //       border:
                                //           Border.all(color: colors.greyTemp, width: 2)),
                                //   child: const Text(
                                //     'Monthly Consumption',
                                //     style: TextStyle(
                                //         color: colors.greyTemp,
                                //         fontWeight: FontWeight.bold),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 20,
                                ),
                                MyTextField(
                                  labelText: Text("Number of assets".tr),
                                  controller: noofassetcontroller,
                                  isAmount: true,
                                  validator: (value) =>
                                      Validator.validateName(value),
                                ),
                                // Container(
                                //   padding: const EdgeInsetsDirectional.symmetric(
                                //       horizontal: 10, vertical: 10),
                                //   height: 50,
                                //   width: MediaQuery.sizeOf(context).width,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(10),
                                //       border:
                                //           Border.all(color: colors.greyTemp, width: 2)),
                                //   child: const Text(
                                //     'Number of assets',
                                //     style: TextStyle(
                                //         color: colors.greyTemp,
                                //         fontWeight: FontWeight.bold),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 20,
                                ),
                                MyTextField(
                                  labelText: Text("Fuel Consumption".tr),
                                  controller: fuelConpcontroller,
                                  validator: (value) =>
                                      Validator.validateName(value),
                                ),
                                // Container(
                                //   padding: const EdgeInsetsDirectional.symmetric(
                                //       horizontal: 10, vertical: 10),
                                //   height: 50,
                                //   width: MediaQuery.sizeOf(context).width,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(10),
                                //       border:
                                //           Border.all(color: colors.greyTemp, width: 2)),
                                //   child: const Text(
                                //     'Fuel Consumption',
                                //     style: TextStyle(
                                //         color: colors.greyTemp,
                                //         fontWeight: FontWeight.bold),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Obx(() => controller.isLoading.value == true
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          if (_formKeyReset.currentState!
                                              .validate()) {
                                            controller
                                                .getEnquiry(
                                                    id,
                                                    monthcontroller.text
                                                        .toString(),
                                                    noofassetcontroller.text
                                                        .toString(),
                                                    fuelConpcontroller.text
                                                        .toString())
                                                .then((value) {
                                              if (value['status'] == true)
                                                Get.back();
                                              showReviewDialog(context);
                                            });
                                          }

                                          // _showBottomSheet(context);
                                        },
                                        child: MyButton(
                                          text: "Next".tr,
                                        ),
                                      )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }

  void initUI() {
    // controller.getBanner();
    // controller.getHomeList();
  }
}

// products tileF

Widget productTile() {
  return Container(
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        const SizedBox(width: 4),
        Container(
          height: 92,
          width: 92,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "My Fuels Product",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Order Now",
                style: TextStyle(
                  color: Color.fromRGBO(255, 138, 13, 1),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
