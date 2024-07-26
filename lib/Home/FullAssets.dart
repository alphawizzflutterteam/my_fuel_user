import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/controller/asset_controller.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/assets_page.dart';

import '../data/model/assetlist_model.dart';

class MyFullAssets extends StatefulWidget {
  AssetData? data;
  bool? update;
  MyFullAssets({super.key, this.data, this.update});

  @override
  State<MyFullAssets> createState() => _AssetsState();
}

class _AssetsState extends State<MyFullAssets> {
  int selectedValue = 1;

  Widget customRadio(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedValue = index;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: (selectedValue == index) ? Colors.black : Colors.blueGrey,
            ),
          ),
          Radio<int>(
            value: index,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
            activeColor: Colors.orange,
          ),
        ],
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(280, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        side: BorderSide(
          color: (selectedValue == index) ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  final _formKeyReset = GlobalKey<FormState>();

  TextEditingController nameControiller = TextEditingController();
  TextEditingController capacityControiller = TextEditingController();
  TextEditingController fuelcapacityControiller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initUI();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssetController>(
        init: AssetController(),
        builder: (asetController) {
          return Scaffold(
            appBar: MyAppFinalbar(
              title: "Assets",
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _formKeyReset,
                child: Column(
                  children: [
                    // Container(
                    //   height: 130,
                    //   decoration: const BoxDecoration(
                    //     gradient: LinearGradient(
                    //       begin: Alignment.topCenter,
                    //       end: Alignment.center,
                    //       colors: [
                    //         Color.fromRGBO(211, 83, 7, 1),
                    //         Color.fromRGBO(252, 130, 59, 1),
                    //         Color.fromRGBO(252, 130, 59, 1),
                    //       ],
                    //     ),
                    //     borderRadius: BorderRadius.only(
                    //       bottomLeft: Radius.circular(23),
                    //       bottomRight: Radius.circular(23),
                    //     ),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       InkWell(
                    //         onTap: () {
                    //           Navigator.pop(context);
                    //         },
                    //         child: Padding(
                    //           padding: EdgeInsets.only(top: 45.0, left: 20),
                    //           child: Icon(
                    //             Icons.arrow_back,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.only(top: 45.0, left: 100),
                    //         child: Text(
                    //           'Assets',
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.w500,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          customRadio("Genset", 1),
                          const SizedBox(
                            height: 10,
                          ),
                          customRadio("Heavy Machinery", 2),
                          const SizedBox(
                            height: 10,
                          ),
                          customRadio("Equipments", 3),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 219),
                      child: Text(
                        'Add Details',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 73,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: nameControiller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Asset Name (eg: genset1)',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 73,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: capacityControiller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Asset Capacity/Power (eg: 120kva)',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 73,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: fuelcapacityControiller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Fuel capacity(eg: 200 litres)',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AssetsPage(),)),
                            child: InkWell(
                                onTap: () {
                                  if (_formKeyReset.currentState!.validate()) {
                                    if (widget.update == true) {
                                      asetController
                                          .updateA(
                                              widget.data!.id.toString(),
                                              selectedValue == 1
                                                  ? "Genset"
                                                  : selectedValue == 2
                                                      ? "Heavy Machinery"
                                                      : "Equipments",
                                              nameControiller.text,
                                              capacityControiller.text,
                                              fuelcapacityControiller.text)
                                          .then((value) {
                                        Fluttertoast.showToast(
                                            msg: "${value['message']}");
                                        if (value['status'] == true) {
                                          Fluttertoast.showToast(
                                              msg: "${value['message']}");
                                          Get.back(result: "hello");
                                        }
                                      });
                                    } else {
                                      asetController
                                          .createAst(
                                              selectedValue == 1
                                                  ? "Genset"
                                                  : selectedValue == 2
                                                      ? "Heavy Machinery"
                                                      : "Equipments",
                                              nameControiller.text,
                                              capacityControiller.text,
                                              fuelcapacityControiller.text)
                                          .then((value) {
                                        Fluttertoast.showToast(
                                            msg: "${value['message']}");
                                        if (value['status'] == true) {
                                          Fluttertoast.showToast(
                                              msg: "${value['message']}");
                                          Get.back(result: "hello");
                                        }
                                      });
                                    }
                                  }
                                },
                                child: const MyButton(text: 'Add Asset type'))),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void initUI() {
    if (widget.update == true) {
      if (widget.data!.assetType.toString().toLowerCase() ==
          "Genset".toString().toLowerCase()) {
        selectedValue = 1;
      } else if (widget.data!.assetType.toString().toLowerCase() ==
          "Heavy Machinery".toString().toLowerCase()) {
        selectedValue = 2;
      } else if (widget.data!.assetType.toString().toLowerCase() ==
          "Equipments".toString().toLowerCase()) {
        selectedValue = 3;
      }

      nameControiller.text = widget.data!.name!.toString();
      capacityControiller.text = widget.data!.capacity!.toString();
      fuelcapacityControiller.text = widget.data!.fuelCapacity!.toString();
      setState(() {});
    }
  }
}
