import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/offers_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/profile/notification1.dart';
import 'package:test_prj/splashScreen.dart';

import 'controller/internet_controller.dart';
import 'helper/utils/shared_preference.dart';

class OffersScreen extends StatefulWidget {
  OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final List<Map<String, dynamic>> offers = [
    {
      'color': colors.greenTemp,
      'text': 'DISCOUNT',
      'icon': Icons.local_offer,
      'title': 'Lorem Ipsum is simply',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'offer': '50% off',
      'expiry': '30 Jul 2019'
    },
    {
      'color': colors.primary,
      'text': 'DISCOUNT',
      'icon': Icons.local_offer,
      'title': 'Lorem Ipsum is simply',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'offer': '50% off',
      'expiry': '30 Jul 2019'
    },
    {
      'color': colors.greenTemp,
      'text': 'DISCOUNT',
      'icon': Icons.local_offer,
      'title': 'Lorem Ipsum is simply',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'offer': '50% off',
      'expiry': '30 Jul 2019'
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initToken();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InternetController>(
        init: InternetController(),
        builder: (connectivityController) {
          print(
              "_checkConnectivity offer ${connectivityController.isConnected.value}");
          return Obx(() => connectivityController.isConnected.value == true
              ? Scaffold(
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
                    padding: const EdgeInsets.only(top: 48),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8),

                          // Top App bar
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/mingcute_location-fill.png",
                                    // scale: 20,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                              ),
                            ),
                            child: bodyWidget(),
                          ),
                        )
                      ],
                    ),
                  ),
                )
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
                      GetBuilder<OfferController>(builder: (controller) {
                        return GestureDetector(
                            onTap: () {
                              controller.getOffers();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: MyButton(text: "Try Again "),
                            ));
                      }),
                      const SizedBox(height: 50),
                    ],
                  ),
                ));
        });
  }

  Widget bodyWidget() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.748,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<OfferController>(
              init: OfferController(),
              builder: (controller) {
                controller.getOffers();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 27),
                    Text(
                      'Best Offers'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() => controller.isLoading.value == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : controller.offerInfoModel.value.coupons!.length == 0
                            ? Center(
                                child: Text("No data Found"),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller
                                    .offerInfoModel.value.coupons!.length,
                                itemBuilder: (context, index) {
                                  return OfferCard(
                                    color: offers[0]['color'],
                                    text: controller.offerInfoModel.value
                                        .coupons![index].title
                                        .toString(),
                                    icon: offers[0]['icon'],
                                    title: controller.offerInfoModel.value
                                        .coupons![index].title
                                        .toString(),
                                    description:
                                        "${controller.offerInfoModel.value.coupons![index].discount.toString()} ${controller.offerInfoModel.value.coupons![index].discountType.toString()} for code ${controller.offerInfoModel.value.coupons![index].code.toString()}",
                                    offer:
                                        "${controller.offerInfoModel.value.coupons![index].discount.toString()} ${controller.offerInfoModel.value.coupons![index].discountType.toString()}",
                                    expiry: controller.offerInfoModel.value
                                        .coupons![index].plainExpireDate
                                        .toString(),
                                  );
                                },
                              )),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Future<void> initToken() async {
    SharedPreferencesService? instance =
        await SharedPreferencesService.getInstance();

    String token = instance.getData(SharedPreferencesService.kTokenKey);
    print("Toke $token");
  }
}

class OfferCard extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final String title;
  final String description;
  final String offer;
  final String expiry;

  OfferCard({
    required this.color,
    required this.text,
    required this.icon,
    required this.title,
    required this.description,
    required this.offer,
    required this.expiry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 150,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: colors.blackTemp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(height: 5),
                const ImageIcon(AssetImage('assets/offer_icon.png')),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Offer',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '$offer',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expires',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '$expiry',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
