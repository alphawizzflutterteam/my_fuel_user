import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/carservice_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/home_page.dart';
import 'package:test_prj/payment/paymentScreen.dart';
import 'package:test_prj/payment/payment_form.dart';

class Checkout_Car_Service extends StatefulWidget {
  const Checkout_Car_Service({super.key});

  @override
  State<Checkout_Car_Service> createState() => _Checkout_Car_ServiceState();
}

class _Checkout_Car_ServiceState extends State<Checkout_Car_Service> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUI();
  }

  void initUI() {
    CarServiceController controller = Get.find();
    controller.getVendorCheckOut(otherCategory);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarServiceController>(builder: (carController) {
      return Scaffold(
        appBar: MyAppbar(
          title: "Checkout".tr,
        ),
        body: Obx(() => carController.isLoading.value == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(245, 245, 245, 1),
                      ),
                      // height: 105,
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Delivery Address',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${carController.batterTyreCheckOut.value.data!.shippingAddressData!.contactPersonName},${carController.batterTyreCheckOut.value.data!.shippingAddressData!.zip}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Text(
                                      '${carController.batterTyreCheckOut.value.data!.shippingAddressData!.building} ${carController.batterTyreCheckOut.value.data!.shippingAddressData!.landmark},${carController.batterTyreCheckOut.value.data!.shippingAddressData!.city}..',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(118, 118, 128, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 24,
                                width: 57,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: colors.primary.withOpacity(.1),
                                    border: Border.all(color: colors.primary)),
                                child: const Center(
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: colors.primary,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: colors.blackTemp)),
                            child: Center(
                                child: Text(
                              'Change or add new address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: colors.lightgray,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 12, top: 8, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Scheduled Date and Time',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '11:00 to 12:00',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '13 jan 2024,Man',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, right: 225),
                          child: Text(
                            "Price Detail",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "MRP (1 item)",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                              Text(
                                "Rs ${carController.batterTyreCheckOut.value.data!.subtotal}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery free",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                              Text(
                                "80",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Divider(
                          // thickness: 2,
                          color: Colors.black26,
                          indent: 15,
                          endIndent: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Amount",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Rs.${carController.batterTyreCheckOut.value.data!.total}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          // thickness: 2,
                          color: Colors.black26,
                          indent: 15,
                          endIndent: 10,
                        ),
                        const SizedBox(height: 100),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              child: const MyButton(text: 'Checkout'),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PaymentScreenTree()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
      );
    });
  }
}
