import 'package:flutter/material.dart';
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
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = [
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
          const BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/Home.png"),
                height: 24,
              ),
              label: "Home"),
          const BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/login-logo.png"),
                height: 24,
              ),
              label: "My Orders"),
          const BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/offers.png"),
                height: 24,
              ),
              label: "Offers"),
          const BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/2 User.png"),
                height: 24,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
