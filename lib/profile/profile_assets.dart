import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_button2.dart';

class ProfileAssets extends StatefulWidget {
  const ProfileAssets({super.key});

  @override
  State<ProfileAssets> createState() => _ProfileAssetsState();
}

class _ProfileAssetsState extends State<ProfileAssets> {
  bool _index = true;

  void toggle() {
    setState(() {
      _index = !_index;
    });
  }
 int selectIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const MyAppbar(
            title: "My Assets",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 48,
                        width: 160,
                        child: InkWell(
                            onTap: () {
                              selectIndex=1;
                              setState(() {

                              });
                              // showModalBottomSheet(
                              //   context: context,
                              //   builder: (context) => const AddFuelQuantity(),
                              // );
                            },
                            child:  selectIndex == 1 ?  MyButton(text: "Door Step Delivery") : DisButton(text: "Door Step Delivery") )),
                     InkWell(
                      onTap: (){
                        selectIndex=2;
                        setState(() {

                        });
                      },
                       child: SizedBox(
                          height: 48,
                          width: 160,
                          child: selectIndex == 2 ?  MyButton(text: "Fuel to Go") : DisButton(text: "Fuel to Go")),
                     ),
                  ],
                ),

                // assets card
                selectIndex == 1 ?   ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                return   Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Genset",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Asset Name",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              const Text(
                                "genset 1",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Asset Capacity/Power",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              const Text(
                                "120kva",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fuel capacity",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const Text(
                            "200 ltrs",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                );
              },)  :   ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return   Container(
                      margin: const EdgeInsets.only(top: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Four Wheeler",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Vehicles Registration Number",
                                    style: TextStyle(color: Colors.grey.shade600),
                                  ),
                                  const Text(
                                    "ACD123456",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          const SizedBox(height: 8),
                        ],
                      ),
                    );
                  },)


              ],
            ),
          ),
        ],
      ),
    );
  }
}
