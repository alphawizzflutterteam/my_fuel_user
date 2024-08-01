import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/Home/checkout_car_service.dart';
import 'package:test_prj/SelectNewAddress.dart';
import 'package:test_prj/controller/carservice_controller.dart';
import 'package:test_prj/home_page.dart';
import 'package:test_prj/splashScreen.dart';

import '../controller/home_controller.dart';
import '../helper/colors.dart';
import 'car_wish_list.dart';

class TyresListing extends StatefulWidget {
  final int? index;
  const TyresListing({super.key, this.index});

  @override
  State<TyresListing> createState() => _TyresListingState();
}

class _TyresListingState extends State<TyresListing> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initUI();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
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
                title: Text(otherCategory.categoryId == "9"
                    ? 'Tyres Listing'.tr
                    : otherCategory.categoryId == "10"
                        ? "Battery Listing"
                        : otherCategory.categoryId == "11"
                            ? "Car Wash"
                            : ""),
                centerTitle: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              body: Obx(() => homeController.productsList!.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: homeController
                          .servicesDetailModel.value.products!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              otherCategory.productId = homeController
                                  .servicesDetailModel.value.products![index].id
                                  .toString();
                              // otherCategory.productId = homeController
                              //     .servicesDetailModel.value.products![index].id
                              //     .toString();
                              if (widget.index == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SelectNewAddress()));
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             Checkout_Car_Service()));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CarWashList()));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colors.lightgray),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        // Add additional decoration properties here as needed
                                      ),
                                      width: 100,
                                      height: 100,
                                      child: ClipRRect(
                                        // Use ClipRRect to clip the image with the specified border radius
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "${configModel!.baseUrls!.productThumbnailUrl}/${homeController.servicesDetailModel.value.products![index].thumbnail}",
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/tyre.png',
                                              fit: BoxFit.cover,
                                            );
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
                                          '${homeController.servicesDetailModel.value.products![index].name}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${homeController.servicesDetailModel.value.products![index].slug}',
                                          style:
                                              TextStyle(color: colors.greyTemp),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            '₹ ${homeController.servicesDetailModel.value.products![index].unitPrice}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )));
        });
  }

  void initUI() {
    print("object ${otherCategory.categoryId}");
    HomeController controller = Get.find();
    controller
        .getServiceDetails(otherCategory.categoryId == null
            ? "9"
            : otherCategory.categoryId.toString())
        .then((value) {});
  }
}
