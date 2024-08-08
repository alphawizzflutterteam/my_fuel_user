import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/SelectNewAddress.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/helper/utils/validator_all.dart';
import '../components/my_button.dart';
import '../controller/carservice_controller.dart';
import '../controller/home_controller.dart';
import '../helper/colors.dart';
import '../home_page.dart';
import '../orderfuel/EV/checkout_page.dart';
import '../orderfuel/doorStepDelivery/order_fuel_checkout.dart';
import '../orderfuel/doorStepDelivery/vendors_page.dart';
import 'checkout_car_service.dart';

class CarService extends StatefulWidget {
  const CarService({super.key});

  @override
  State<CarService> createState() => _CarServiceState();
}

class _CarServiceState extends State<CarService> {
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
    CarServiceController carServiceController = Get.put(CarServiceController());

    carServiceController.getSlots();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: "Car Service".tr,
      ),
      // AppBar(
      //   leading: Icon(Icons.arrow_back_ios_new_outlined),
      //   foregroundColor: Colors.white,
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.centerLeft,
      //         end: Alignment.centerRight,
      //         colors: [
      //           Color.fromRGBO(252, 130, 59, 1),
      //           Color.fromRGBO(252, 130, 59, 1),
      //           Color.fromRGBO(211, 83, 7, 1),
      //         ],
      //       ),
      //       borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(23),
      //         bottomRight: Radius.circular(23),
      //       ),
      //     ),
      //   ),
      //   title: Text('Car Service'),
      //   centerTitle: true,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(20),
      //       bottomRight: Radius.circular(20),
      //     ),
      //   ),),
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (homeController) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Container(
                  //   padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                  //   height: 50,
                  //   width: MediaQuery.sizeOf(context).width,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(color: colors.greenTemp, width: 2)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Engine Oil and Filter',
                  //         style: TextStyle(
                  //             color: colors.greyTemp,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //       Container(
                  //         height: 25,
                  //         width: 25,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(16),
                  //             border: Border.all(color: colors.greenTemp)),
                  //         child: Center(
                  //             child: Icon(
                  //           Icons.check,
                  //           color: colors.greenTemp,
                  //         )),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() => homeController.servicesDetailModel.value == null ||
                          homeController.servicesDetailModel.value.products ==
                              null ||
                          homeController
                                  .servicesDetailModel.value.products!.length ==
                              0
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: homeController
                              .servicesDetailModel.value.products!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  // otherCategory.productId = homeController
                                  //     .servicesDetailModel
                                  //     .value
                                  //     .products![index]
                                  //     .id
                                  //     .toString();
                                  // homeController
                                  //     .servicesDetailModel.value.products!
                                  //     .forEach((element) {
                                  //   element.selections = false;
                                  // });
                                  // homeController.servicesDetailModel.value
                                  //     .products![index].selections = true;
                                  homeController.servicesDetailModel.value
                                          .products![index].selections =
                                      !homeController.servicesDetailModel.value
                                          .products![index].selections!;
                                });
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: homeController.servicesDetailModel
                                            .value.products![index].selections!
                                        ? colors.greenTemp
                                        : colors.greyTemp.withOpacity(0.5),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      // _getServiceText(index),
                                      homeController.servicesDetailModel.value
                                          .products![index].name
                                          .toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    if (homeController.servicesDetailModel.value
                                        .products![index].selections!)
                                      const Icon(
                                          Icons.check_circle_outline_rounded,
                                          color: colors.greenTemp),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),

                  // Container(
                  //   padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                  //   height: 50,
                  //   width: MediaQuery.sizeOf(context).width,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(color: colors.greenTemp, width: 2)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Periodic Service',
                  //         style: TextStyle(
                  //             color: colors.greyTemp, fontWeight: FontWeight.bold),
                  //       ),
                  //       Container(
                  //         height: 25,
                  //         width: 25,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(16),
                  //             border: Border.all(color: colors.greenTemp)),
                  //         child: Center(
                  //             child: Icon(
                  //           Icons.check,
                  //           color: colors.greenTemp,
                  //         )),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   padding:
                  //       EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
                  //   height: 50,
                  //   width: MediaQuery.sizeOf(context).width,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(color: colors.greyTemp, width: 2)),
                  //   child: Text(
                  //     'Full Service',
                  //     style: TextStyle(
                  //         color: colors.greyTemp, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   padding:
                  //       EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
                  //   height: 50,
                  //   width: MediaQuery.sizeOf(context).width,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(color: colors.greyTemp, width: 2)),
                  //   child: Text(
                  //     'Others',
                  //     style: TextStyle(
                  //         color: colors.greyTemp, fontWeight: FontWeight.bold),
                  //   ),
                  // ),

                  Spacer(),
                  // SizedBox(
                  //   height: 200,
                  // ),
                  InkWell(
                    onTap: () {
                      List<String> data = [];
                      homeController.servicesDetailModel.value.products!
                          .forEach((element) {
                        if (element.selections == true)
                          data.add(element.id.toString());
                      });
                      if (data.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please select one service".tr);
                        return;
                      }
                      CarServiceController carServiceController = Get.find();
                      carServiceController.updateSlotId(99);

                      otherCategory.productId = data.join(",");
                      otherCategory.service = "At Your Station";
                      _showBottomSheet(context);
                    },
                    child: MyButton(
                      text: "Schedule Car Service".tr,
                    ),
                  ),
                ],
              ),
            );
          }),
      // floatingActionButton: ,
    );
  }

  void _showBottomSheet(BuildContext context) {
    final _formKeyReset = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, schedule) {
          return SingleChildScrollView(
              // Wrap your content in SingleChildScrollView
              child: SizedBox(
            height: 400,
            child: Form(
              key: _formKeyReset,
              child: GetBuilder<CarServiceController>(
                  init: CarServiceController(),
                  builder: (carServiceController) {
                    return Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 30, right: 20),
                            child: Text(
                              "Schedule data and timing".tr,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                              controller: dateController,
                              validator: (value) => Validator.validateWithhint(
                                  value, "Select Date".tr),
                              decoration: InputDecoration(
                                // labelText: 'Schedule date and timing',
                                hintText: 'Schedule date and timing'.tr,
                                //filled: true,
                                suffixIcon: const Icon(Icons.calendar_today),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: colors.greyTemp),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                              ),
                              readOnly: true,
                              onTap: () {
                                _selectDate(context);
                              }),
                        ),
                        SizedBox(height: 7),
                        Padding(
                          padding: EdgeInsets.only(right: 290),
                          child: Text(
                            "Slots".tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() => carServiceController.tileList!.isEmpty
                            ? CircularProgressIndicator()
                            : GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                padding: const EdgeInsets.all(10),
                                itemCount: carServiceController
                                    .timeSlotModel.value.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 4.5,
                                  // crossAxisSpacing: 10,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      carServiceController
                                          .selectTimeSlot.value = index;
                                      otherCategory.timeSlotId =
                                          carServiceController.timeSlotModel
                                              .value.data![index].id
                                              .toString();
                                      schedule(() {});
                                      print(
                                          "object Vali ${carServiceController.selectTimeSlot.value}");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Container(
                                        decoration: carServiceController
                                                    .selectTimeSlot.value ==
                                                index
                                            ? BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // color: Colors.grey.withOpacity(0.1),
                                                border: Border.all(
                                                  color: Colors.orange,
                                                ))
                                            : BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                              ),
                                        height: 35,
                                        // width: 160,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 7, left: 15),
                                          child: Text(
                                            '${carServiceController.timeSlotModel.value.data![index].title}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: carServiceController
                                                            .selectTimeSlot
                                                            .value ==
                                                        index
                                                    ? Colors.orange
                                                    : Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
                        // Row(
                        //   children: [
                        //     Padding(
                        //       padding: const EdgeInsets.only(left: 15),
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(10),
                        //             color: colors.primary.withOpacity(0.1),
                        //             border: Border.all(color: colors.primary)),
                        //         height: 35,
                        //         width: 160,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(top: 7, left: 15),
                        //           child: Text(
                        //             '1:00 PM - 1:30 PM',
                        //             style:
                        //                 TextStyle(fontSize: 15, color: colors.primary),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     Padding(
                        //       padding: const EdgeInsets.only(left: 10),
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(10),
                        //           color: Colors.grey.withOpacity(0.1),
                        //         ),
                        //         height: 35,
                        //         width: 160,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(top: 7, left: 15),
                        //           child: Text(
                        //             '2:00 PM - 2:30 PM',
                        //             style:
                        //                 TextStyle(fontSize: 15, color: Colors.black54),
                        //           ),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Row(
                        //   children: [
                        //     Padding(
                        //       padding: const EdgeInsets.only(left: 15),
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           color: Colors.grey.withOpacity(0.1),
                        //           borderRadius: BorderRadius.circular(10),
                        //           //color: Colors.grey.withOpacity(0.0),
                        //         ),
                        //         height: 35,
                        //         width: 160,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(top: 7, left: 15),
                        //           child: Text(
                        //             '2:30 PM - 3:00 PM',
                        //             style:
                        //                 TextStyle(fontSize: 15, color: Colors.black54),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     Padding(
                        //       padding: const EdgeInsets.only(left: 10),
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(10),
                        //           color: Colors.grey.withOpacity(0.1),
                        //         ),
                        //         height: 35,
                        //         width: 160,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(top: 7, left: 15),
                        //           child: Text(
                        //             '3:00 PM - 3:30 PM',
                        //             style:
                        //                 TextStyle(fontSize: 15, color: Colors.black54),
                        //           ),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        SizedBox(height: 30),
                        Container(
                          alignment: Alignment.bottomCenter,
                          width: 330,
                          child: GestureDetector(
                              onTap: () {
                                if (carServiceController.selectTimeSlot.value ==
                                        99 ||
                                    otherCategory.timeSlotId!.isEmpty ||
                                    otherCategory.timeSlotId == "") {
                                  Fluttertoast.showToast(
                                      msg: "Please select Slot".tr);
                                  return;
                                }
                                if (_formKeyReset.currentState!.validate()) {
                                  otherCategory.date =
                                      dateController.text.toString();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              SelectNewAddress())));
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             Checkout_Car_Service()));
                                }
                              },
                              child: MyButton(text: 'Book Now'.tr)),
                        ),
                      ],
                    );
                  }),
            ),
          ));
        });
      },
    );
  }

  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        //   selectedDate = picked;
        dateController.text = picked.toString().split(" ")[0];
      });
    }
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
}
