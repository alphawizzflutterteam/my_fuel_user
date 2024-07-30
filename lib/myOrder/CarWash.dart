import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/carwash_vendordet.dart';
import 'package:test_prj/myOrder/CarWash.dart';
import 'package:test_prj/myOrder/myOrder.dart';

import '../splashScreen.dart';

class CarWash extends StatefulWidget {
  const CarWash({super.key});

  @override
  State<CarWash> createState() => _CarWashState();
}

class _CarWashState extends State<CarWash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/mingcute_location-fill.png",
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ward 35",
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
                          Image.asset(
                            "assets/Group 2979.png",
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Image.asset(
                            "assets/Notification.png",
                            height: 24,
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 28),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text(
                                'My Order',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 25, left: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 55,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            prefixIcon: Image.asset(
                                              "assets/Search.png",
                                              scale: 20,
                                            ),
                                            fillColor: const Color.fromRGBO(
                                                245, 245, 245, 1),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                            hintText: "Search"),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 8), // Added spacing
                                  const Icon(Icons.format_align_right_rounded)
                                ],
                              ),
                            ),
                            //  const SizedBox(height: 16),
                            CategoryPage(),
                            Container(
                              height: 110,
                              margin: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Image.asset("assets/indianoil.png",
                                        height: 94),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Star Car Wash",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            " Lorem Ipsum is simply dumm",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Rs.350',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color: Colors.amber),
                                                child: Center(
                                                    child: Text(
                                                  'Pick up',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                                        builder: (context) =>
                                            VenderDetails3()));
                              },
                              child: Container(
                                height: 110,
                                margin: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/indianoil.png",
                                          height: 94),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Speed Petrol",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              " Lorem Ipsum is simply dumm",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Rs.350',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 50,
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      color: Colors.green),
                                                  child: Center(
                                                      child: Text(
                                                    'Completed',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 110,
                              margin: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Image.asset("assets/indianoil.png",
                                        height: 94),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Diesel",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            " Lorem Ipsum is simply dumm",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Rs.350',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color: Colors.blue),
                                                child: Center(
                                                    child: Text(
                                                  'Schedule',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryProducts extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final bool isSelected;

  const CategoryProducts({
    Key? key,
    required this.text,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: 5,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? Colors.orange : Colors.grey,
              // width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.orange : Colors.grey,
              ),
            )),
          ),
        ),
      ),
    );
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            //onTap: () => ,
            child: CategoryProducts(
              text: 'Fuels',
              press: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrder()),
                );
              },
              isSelected: selectedIndex == 0,
            ),
          ),
          CategoryProducts(
            text: 'Car Wash',
            press: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            isSelected: selectedIndex == 1,
          ),
          CategoryProducts(
            text: 'Rescue fuel',
            press: () {
              setState(() {
                selectedIndex = 2;
              });
            },
            isSelected: selectedIndex == 2,
          ),
          CategoryProducts(
            text: 'Tyres',
            press: () {
              setState(() {
                selectedIndex = 3;
              });
            },
            isSelected: selectedIndex == 3,
          ),
        ],
      ),
    );
  }
}
