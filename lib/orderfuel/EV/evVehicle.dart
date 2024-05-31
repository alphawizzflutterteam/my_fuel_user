import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/orderfuel/EV/cartPage.dart';
import 'package:test_prj/components/my_button.dart';

class EvVehicle extends StatefulWidget {
  const EvVehicle({super.key});

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
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Color.fromRGBO(211, 83, 7, 1),
                    Color.fromRGBO(252, 130, 59, 1),
                    Color.fromRGBO(252, 130, 59, 1),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
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
                    padding: const EdgeInsets.only(top: 45.0, left: 100),
                    child: Text(
                      'Vendors',
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
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 3.0,
                mainAxisExtent: 160,
                crossAxisCount: 2,
              ),
              itemBuilder: (_, index) {
                final item = gridMap[index];
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      )),
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
    );
  }
}
