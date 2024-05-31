

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_button2.dart';
import 'package:test_prj/orderfuel/add_fuel_quantity.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/vendors_page.dart';

import '../../Home/FullAssets.dart';
import 'forLooking.dart';
import 'my_assets.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MyAppbar(
              title: "Assets",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search Assets',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                onChanged: (value) {
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  InkWell(

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VendorsPage()),
                        );
                      },
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(

                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MyAssets()),
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: 148,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.edit_outlined),
                                      Text(
                                        "Edit Assets",
                                        style:
                                            TextStyle(fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(context: context, builder: (context) => Dialog(
                                    child: Container(
                                      height: 292,
                                      decoration: BoxDecoration(
                                          color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 32),
                                            CircleAvatar(
                                              radius: 40,
                                              backgroundColor: Color(0xFFFFF7EF),
                                              child: Icon(
                                                Icons.delete,
                                                size: 44,
                                                color: Colors.red,
                                              )
                                            ),
                                            SizedBox(height: 20),
                                            Text(
                                              "Are you Sure you want to",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "delete",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(height: 24),
                                            Container(
                                              height: 48,
                                              padding: EdgeInsets.symmetric(horizontal: 24),
                                              child: GestureDetector(
                                                onTap: (){},
                                                child: Container(
                                                  height: 56,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [Color(0xFFF3B781F),Color(0xFF8AB402)],
                                                      stops: [0, 1],
                                                      begin: AlignmentDirectional(0.94, -1),
                                                      end: AlignmentDirectional(-0.94, 1),
                                                    ),
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child:  InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => const MyFullAssets()),
                                                      );
                                                    },
                                                    child: Text(
                                                      "Done",
                                                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),);
                                },
                                child: Container(
                                  height: 40,
                                  width: 148,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.delete_outline),
                                      Text(
                                        "Delete Assets",
                                        style: TextStyle(fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LookingForCompany()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 380),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                              height: 48,
                              width: 160,
                              child: DisButton(text: "Add Asset")),
                          SizedBox(
                              height: 48,
                              width: 160,
                              child:
                              InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => const AddFuelQuantity(),
                                    );
                                  },
                                  child: const MyButton(text: "Order")
                              )
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
