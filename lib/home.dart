import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/home_page.dart';
import 'package:test_prj/myOrder/myOrder.dart';
import 'package:test_prj/offer_screen.dart';
import 'package:test_prj/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    _selectedIndex = index;
    print("object _sele Index ${_selectedIndex}");
    setState(() {});
  }

  List<BottomNavigationBarItem> bottomItem = [];
  List<Widget> pages = [
    HomePage(),
    MyOrder(),
    OffersScreen(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],

      // navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        fixedColor: Color.fromRGBO(237, 111, 37, 1),
        items: [
          BottomNavigationBarItem(
              icon: Image(
                image: _selectedIndex == 0
                    ? AssetImage("assets/Home.png")
                    : AssetImage("assets/HomeUnselect.png"),
                height: 24,
              ),
              label: "Home".tr),
          BottomNavigationBarItem(
              icon: Image(
                image: _selectedIndex == 1
                    ? AssetImage("assets/Home.png")
                    : AssetImage("assets/login-logo.png"),
                height: 24,
              ),
              label: "My Orders".tr),
          BottomNavigationBarItem(
              icon: Image(
                image: _selectedIndex == 2
                    ? AssetImage("assets/offersselected.png")
                    : AssetImage("assets/offers.png"),
                height: 24,
              ),
              label: "Offers".tr),
          BottomNavigationBarItem(
              icon: Image(
                image: _selectedIndex == 3
                    ? AssetImage("assets/2 UserSeected.png")
                    : AssetImage("assets/2 User.png"),
                height: 24,
              ),
              label: 'Profile'.tr),
        ],
      ),
    );
  }
}
