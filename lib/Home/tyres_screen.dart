import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/Home/car_wish_list.dart';
import 'package:test_prj/Home/checkout_car_service.dart';
import 'package:test_prj/Home/tyres_listing_scr.dart';
import 'package:test_prj/controller/carservice_controller.dart';
import 'package:test_prj/helper/colors.dart';

import '../components/my_button.dart';
import '../components/my_button2.dart';
import '../helper/utils/validator_all.dart';
import '../home_page.dart';
import '../summary_page.dart';
import 'battery_listing.dart';
// import 'CartItemSamples.dart';
// import 'MyButtan.dart';

class TyresScreen extends StatefulWidget {
  int page;
  final String? title;
  TyresScreen({super.key, required this.page, this.title});
  @override
  State<TyresScreen> createState() => _TyresScreenState();
}

class _TyresScreenState extends State<TyresScreen> {
  DateTime? selectedDate;
  int selectIndex = 1;

  TextEditingController dateController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  final _formKeyReset = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initUI();
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text(widget.page == 1
            ? 'Tyres'
            : widget.page == 1
                ? 'Battery'
                : widget.title == "carWash"
                    ? "Schedule Day"
                    : 'Battery'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: GetBuilder<CarServiceController>(builder: (carServiceController) {
        return SingleChildScrollView(
          child: Form(
            key: _formKeyReset,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 48,
                          width: 160,
                          child: InkWell(
                              onTap: () {
                                selectIndex = 1;
                                setState(() {});
                              },
                              child: selectIndex == 1
                                  ? MyButton(text: "Door Step ")
                                  : DisButton(text: "Door Step"))),
                      InkWell(
                        onTap: () {
                          selectIndex = 2;
                          setState(() {});
                        },
                        child: SizedBox(
                            height: 48,
                            width: 160,
                            child: selectIndex == 2
                                ? MyButton(
                                    text: widget.title == "carWash"
                                        ? "Self Service"
                                        : "Outlet")
                                : DisButton(
                                    text: widget.title == "carWash"
                                        ? "Self Service"
                                        : "Outlet")),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 190),
                        child: Text(
                          "Select Date & Slot",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                            controller: dateController,
                            validator: (value) => Validator.validateWithhint(
                                value, "Select Date"),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                              // labelText: 'Schedule date and timing',
                              hintText: 'Schedule date ',
                              //filled: true,
                              suffixIcon: const Icon(Icons.calendar_today),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colors.lightgray),
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectDate(context);
                            }),
                      ),
                      SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(right: 280),
                        child: Text(
                          "Slots",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() => GridView.builder(
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
                                  carServiceController.selectTimeSlot.value =
                                      index;
                                  otherCategory.timeSlotId =
                                      carServiceController
                                          .timeSlotModel.value.data![index].id
                                          .toString();
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
                                            color: Colors.grey.withOpacity(0.1),
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
                                                        .selectTimeSlot.value ==
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
                      //             // color: Colors.grey.withOpacity(0.1),
                      //             border: Border.all(
                      //               color: Colors.orange,
                      //             )),
                      //         height: 35,
                      //         width: 160,
                      //         child: Padding(
                      //           padding:
                      //               const EdgeInsets.only(top: 7, left: 15),
                      //           child: Text(
                      //             '1:00 PM - 1:30 PM',
                      //             style: TextStyle(
                      //                 fontSize: 15, color: Colors.orange),
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
                      //           padding:
                      //               const EdgeInsets.only(top: 7, left: 15),
                      //           child: Text(
                      //             '2:00 PM - 2:30 PM',
                      //             style: TextStyle(
                      //                 fontSize: 15, color: Colors.black54),
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
                      //           padding:
                      //               const EdgeInsets.only(top: 7, left: 15),
                      //           child: Text(
                      //             '2:30 PM - 3:00 PM',
                      //             style: TextStyle(
                      //                 fontSize: 15, color: Colors.black54),
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
                      //           padding:
                      //               const EdgeInsets.only(top: 7, left: 15),
                      //           child: Text(
                      //             '3:00 PM - 3:30 PM',
                      //             style: TextStyle(
                      //                 fontSize: 15, color: Colors.black54),
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 140),
                        child: Text(
                          "Note to service provider",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          height: 150,
                          // width: 340,
                          color: Colors.white,
                          child: TextFormField(
                            controller: noteController,
                            validator: (value) => Validator.validateWithhint(
                                value, "Select Note"),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: colors.lightgray),
                                    borderRadius: BorderRadius.circular(16))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          //selectIndex == 1 ?  MyButton(text: "Door Step ") : DisButton(text: "Door Step")

                          if (_formKeyReset.currentState!.validate()) {
                            otherCategory.service =
                                selectIndex == 1 ? "Door Step" : "Door Step";
                            otherCategory.notes =
                                noteController.text.toString();
                            otherCategory.timeSlotId = "1";
                            otherCategory.date = dateController.text.toString();
                            if (widget.page == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TyresListing(
                                            index: selectIndex,
                                          )));
                            } else if (widget.page == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BatteryListing(
                                            index: selectIndex,
                                          )));
                            } else if (selectIndex == 2 &&
                                widget.title == 'carWash') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CarWashList()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Summary1()));
                            }
                          }
                        },
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: 330,
                          child: MyButton(text: 'Continue'.tr),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2027),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        //   selectedDate = picked;
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  void initUI() {
    CarServiceController carServiceController = Get.find();

    carServiceController.getSlots();
  }
}
