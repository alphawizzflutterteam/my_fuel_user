import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/Home/Evdoorbottom.dart';
import 'package:test_prj/orderfuel/EV/cartPage.dart';
import 'package:test_prj/components/my_button.dart';
import '../../components/my_hinttext_field.dart';
import '../../vehicle_number.dart';
import '../bottom_sheet.dart';
import 'Fuelbottom.dart';

class EvVehicle extends StatefulWidget {
  final int selectedIndex;
  EvVehicle({super.key, required this.selectedIndex});

  @override
  State<EvVehicle> createState() => _EvVehicleState();
}

class _EvVehicleState extends State<EvVehicle> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "titel": "Tota Naxon EV",
      "image":
          "https://imgd-ct.aeplcdn.com/370x208/n/cw/ec/130591/fronx-exterior-right-front-three-quarter-109.jpeg?isig=0&q=80",
    },
    {
      "titel": " Tata Xpress-T EV",
      "image":
          "https://stimg.cardekho.com/images/car-images/930x620/Maruti/FRONX/9243/1674108902046/222_arctic-white_b7b9ba.jpg?impolicy=resize&imwidth=420",
    },
    {
      "titel": "Tato Nason Ev",
      "image":
          "https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Grand-i10-Nios-200120231541.jpg",
    },
    {
      "titel": "Tato Xpres-T EV",
      "image":
          "https://www.drivespark.com/car-image/640x480x100/car/22691773-hyundai_aura.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 130,
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
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 45.0, left: 20),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 100),
                    child: Text(
                      'EV Vehicle',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
                onChanged: (value) {},
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 3.0,
                mainAxisExtent: 160,
                crossAxisCount: 2,
              ),
              itemBuilder: (_, index) {
                final item = gridMap[index];
                return InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Enter Your Vehicle Number',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              MyHintTextField(
                                  hintText: Text(
                                "Vehicle Number",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              )),
                              const SizedBox(
                                height: 40,
                              ),
                              InkWell(
                                onTap: () {},
                                child: InkWell(
                                  child: InkWell(
                                    onTap: () {
                                      if (widget.selectedIndex == 0) {
                                        /*showModalBottomSheet(
                                          context: context,
                                          builder: (context) => Evdoorbottom(),
                                        );*/
                                      } else {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) => Fuelbottom(),
                                        );
                                      }

                                      // showModalBottomSheet(
                                      //   context: context,
                                      //   builder: (context) => Fuelbottom(),
                                      // );
                                    },
                                    child: Container(
                                      child: MyButton(
                                        text: "Submit",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 237, 237),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            // borderRadius: BorderRadius.circular(
                            //     // topLeft: Radius.circular(16),
                            //     // topRight: Radius.circular(16)),
                            child: Image.network(
                              item['image'],
                              height: 104,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 4,
                                ),
                                Center(
                                  child: Text(
                                    item['titel'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
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
              itemCount: gridMap.length,
            ),
          ],
        ),
      ),
      // bottomSheet: Container(
      //   color: Colors.white,
      //   child: Container(
      //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //     decoration: BoxDecoration(
      //         border: Border.all(color: Colors.black), color: Colors.white),
      //     child: TextFormField(
      //       readOnly: true,
      //       decoration: InputDecoration(
      //         contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      //         hintText: 'Add EV Vehicles for development',
      //         border: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(12),
      //           borderSide: BorderSide.none,
      //         ),
      //         filled: true,
      //         fillColor: Colors.white,
      //       ),
      //       onChanged: (value) {},
      //     ),
      //   ),
      // ),
    );
  }
}
