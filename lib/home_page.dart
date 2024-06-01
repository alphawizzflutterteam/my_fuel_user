import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/components/home_slider.dart';
import 'package:test_prj/profile/notification1.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/forLooking.dart';
import 'package:test_prj/schedule_day.dart';
import 'Home/car_service.dart';
import 'Home/fuel_on_tab.dart';
import 'Home/insurance_scr.dart';
import 'Home/rescue_me_src.dart';
import 'Home/tyres_screen.dart';
import 'SelectNewAddress.dart';
import 'components/my_button.dart';
import 'components/my_hinttext_field.dart';
import 'helper/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> vehicles = ['Two Wheeler', 'Four Wheeler ,Heavy Vehicle'];
  List<String> productsAndServices = [
    'Genset Maintenance',
    'Fuel Management Services ',
    'Fuel on Tap',
    'My Fuels Jerry...'
  ];
  String? selectedVehicle;
  String? selectedVehicleManufacture;
  String? selectModel;

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                Color.fromRGBO(252, 130, 59, 1),
                Color.fromRGBO(211, 83, 7, 1),
                Color.fromRGBO(211, 83, 7, 1),
                Color.fromRGBO(211, 83, 7, 1),
              ])),
          child: Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),

                  // Top App bar
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/mingcute_location-fill.png",
                            // scale: 20,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          const Column(
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
                                "Ratan Lok Colony Indore",
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
                          // Image.asset(
                          //   "assets/Group 2979.png",
                          //   height: 24,
                          // ),
                          const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Notification1(),
                                )),
                            child: Image.asset(
                              "assets/Notification.png",
                              height: 24,
                            ),
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
                          const SizedBox(height: 27),

                          // search bar
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 16.0),
                          //   child: SizedBox(
                          //     height: 55,
                          //     child: TextFormField(
                          //       decoration: InputDecoration(
                          //           prefixIcon: Image.asset(
                          //             "assets/Search.png",
                          //             scale: 20,
                          //           ),
                          //           fillColor: Color.fromRGBO(245, 245, 245, 1),
                          //           filled: true,
                          //           enabledBorder: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(12),
                          //             borderSide: BorderSide.none,
                          //           ),
                          //           // enabled: true,
                          //           hintText: "Search"),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: 16),

                          // Order fuel section
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LookingForCompany()),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                height: 59,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(138, 180, 2, 200),
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(138, 180, 2, 10),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/login-logo.png",
                                        height: 36),
                                    const SizedBox(width: 13),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Order Fuel",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Door Step Delivery",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Color.fromRGBO(89, 89, 89, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 124),
                                    GestureDetector(
                                      // onTap: () => Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           const LookingForCompany(),
                                      //     )),
                                      child: Image.asset(
                                        "assets/Arrow - Down 2.png",
                                        height: 24,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 20.0),
                          //   child: Divider(
                          //     color: Color.fromRGBO(138, 180, 2, 100),
                          //     thickness: 2,
                          //   ),
                          // ),
                          const SizedBox(height: 24),

                          // slider
                          const SliderHome(),
                          const SizedBox(height: 30),

                          // Products & Services
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 243, 236, 1)),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 28),
                                const Text(
                                  "Products & Services",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),

                                GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    primary: false,
                                    padding: const EdgeInsets.all(10),
                                    itemCount: productsAndServices.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 95 / 120,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10.0,
                                    ),
                                    itemBuilder: (BuildContext context, int i) {
                                      return Stack(children: [
                                        InkWell(
                                          child: Container(
                                            // child: Image.asset('assets/fuel.png',fit: BoxFit.cover,),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/fuel.png'),
                                                    fit: BoxFit.cover)),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2.4,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.4,
                                          ),
                                          onTap: () {
                                            if (i == 0) {
                                              genesetMaintenance(context);
                                            } else if (i == 1) {
                                              fuelManagmentServices(context);
                                            } else if (i == 2) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const FuelOnTabScreen(),
                                                  ));
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const FuelOnTabScreen(
                                                            title:
                                                                "My Fuel Jerry Can"),
                                                  ));
                                            }
                                          },
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          left: 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: Text(
                                                  productsAndServices[i],
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                              ),
                                              i % 4 == 2 || i % 4 == 3
                                                  ? const Text(
                                                      '0.5 kl/LK/2KI',
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                      overflow:
                                                          TextOverflow.visible,
                                                    )
                                                  : const SizedBox()
                                            ],
                                          ),
                                        ),
                                      ]);
                                    }),

                                // const SizedBox(height: 20),
                                // productTile(),
                                // const SizedBox(height: 12),
                                // productTile(),
                                // const SizedBox(height: 12),
                                // productTile(),
                                // const SizedBox(height: 50),
                              ],
                            ),
                          ),

                          // Category section
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Container(
                              height: 240,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RescueMe()));
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/rescue.png",
                                                height: 60,
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                "Rescue Me",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      89, 89, 89, 1),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _showBottomSheet(context);
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/dummy.png",
                                                height: 60,
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                "Car Service",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      89, 89, 89, 1),
                                                ),
                                              )
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
                                                      const Insurance_Scr()));
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/insurance.png",
                                                height: 60,
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                "Insurance",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      89, 89, 89, 1),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          tyresBottomSheet(context);
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/tyres.png",
                                                height: 60,
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                "Tyres",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      89, 89, 89, 1),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          batteryBottomSheet(context);
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/insurance.png",
                                                height: 60,
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                "Battery",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      89, 89, 89, 1),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          carwashBottomShee(context);
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/carwash.png",
                                                height: 60,
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                "Car Wash",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      89, 89, 89, 1),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const Row(),
                        ],
                      ),
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap your content in SingleChildScrollView
          child: Container(
            padding: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Enter Your Vehicle Number',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      hint: const Text('Vehicle Type'),
                      value: selectedVehicle,
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedVehicle = newValue;
                          });
                        }
                      },
                      items: vehicles
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.black12, width: 2)),
                    child: const MyHintTextField(
                      hintText: Text(
                        "Vehicle Number",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CarService()));

                      // Add your onTap logic here
                    },
                    child: Container(
                      child: const MyButton(
                        text: "Submit",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void tyresBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap your content in SingleChildScrollView
          child: Container(
            padding: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Select a Tyres For your Vehicle',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      hint: const Text('Select Vehicle Manufacture Type'),
                      value: selectedVehicleManufacture,
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedVehicleManufacture = newValue;
                          });
                        }
                      },
                      items: vehicles
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      hint: const Text('Select Model'),
                      value: selectModel,
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectModel = newValue;
                          });
                        }
                      },
                      items: vehicles
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.black12, width: 2)),
                    child: const MyHintTextField(
                      hintText: Text(
                        "Tyre Size",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TyresScreen(
                                    page: 1,
                                  )));

                      // Add your onTap logic here
                    },
                    child: Container(
                      child: const MyButton(
                        text: "Continue",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void batteryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap your content in SingleChildScrollView
          child: Container(
            padding: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Select a Tyres For your Vehicle',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      hint: const Text('Select Vehicle Manufacture Type'),
                      value: selectedVehicleManufacture,
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedVehicleManufacture = newValue;
                          });
                        }
                      },
                      items: vehicles
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      hint: const Text('Select Model'),
                      value: selectModel,
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectModel = newValue;
                          });
                        }
                      },
                      items: vehicles
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TyresScreen(
                                    page: 2,
                                  )));

                      // Add your onTap logic here
                    },
                    child: Container(
                      child: const MyButton(
                        text: "Submit",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 280,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: colors.primary.withOpacity(.2),
                    ),
                    child: const Icon(
                      Icons.book_online_sharp,
                      color: colors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'On of our agents will connect',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Text(
                    'you shortly',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const MyButton(
                      text: "Back to home",
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void carwashBottomShee(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap your content in SingleChildScrollView
          child: Container(
            padding: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Select Car Type',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      hint: const Text('Select Your Vehicle Type'),
                      value: selectedVehicle,
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedVehicle = newValue;
                          });
                        }
                      },
                      items: vehicles
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  // SizedBox(height: 10,),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(color: colors.black12,width: 2 )
                  //   ),
                  //   child: MyHintTextField(
                  //     hintText: Text(
                  //       "Vehicle Number",
                  //       style: TextStyle(
                  //         color: Colors.grey,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TyresScreen(
                                    page: 3,title: "carWash",
                                  )));

                      // Add your onTap logic here
                    },
                    child: Container(
                      child: const MyButton(
                        text: "Book Now",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<bool> _selections = [true, true, false, false];

  void genesetMaintenance(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, genesetState) {
            return SingleChildScrollView(
              // Wrap your content in SingleChildScrollView
              child: Container(
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Genset Maintenance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      decoration:
                          BoxDecoration(color: colors.greyTemp.withOpacity(.1)),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                            'lorem lpsum is simply dummy text of the printing and typesetting industry'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _selections.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  genesetState(() {
                                    _selections[index] = !_selections[index];
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _selections[index]
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
                                        _getServiceText(index),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      if (_selections[index])
                                        const Icon(
                                            Icons.check_circle_outline_rounded,
                                            color: colors.greenTemp),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SelectNewAddress(
                                            isFromFGenSet: true,
                                          )));
                              // _showBottomSheet(context);
                            },
                            child: const MyButton(
                              text: "Next",
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
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

  void fuelManagmentServices(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap your content in SingleChildScrollView
          child: Container(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Fuel Management Services',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  decoration:
                      BoxDecoration(color: colors.greyTemp.withOpacity(.1)),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                        'lorem lpsum is simply dummy text of the printing and typesetting industry'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 10, vertical: 10),
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: colors.greyTemp, width: 2)),
                        child: const Text(
                          'Monthly Consumption',
                          style: TextStyle(
                              color: colors.greyTemp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 10, vertical: 10),
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: colors.greyTemp, width: 2)),
                        child: const Text(
                          'Number of assets',
                          style: TextStyle(
                              color: colors.greyTemp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 10, vertical: 10),
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: colors.greyTemp, width: 2)),
                        child: const Text(
                          'Number of Locations',
                          style: TextStyle(
                              color: colors.greyTemp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          showReviewDialog(context);
                          // _showBottomSheet(context);
                        },
                        child: const MyButton(
                          text: "Next",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// products tileF

Widget productTile() {
  return Container(
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        const SizedBox(width: 4),
        Container(
          height: 92,
          width: 92,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "My Fuels Product",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Order Now",
                style: TextStyle(
                  color: Color.fromRGBO(255, 138, 13, 1),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
