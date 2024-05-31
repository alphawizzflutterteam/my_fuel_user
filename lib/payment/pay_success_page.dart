import 'package:flutter/material.dart';
import 'package:test_prj/home.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({super.key});

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home())),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(138, 180, 2, 1),
                Color.fromRGBO(59, 120, 31, 1),
                Color.fromRGBO(59, 120, 31, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: Container(
                    child: Image.asset(
                      "assets/checkbox.png",
                      height: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    height: 200,
                    width: 350,
                    alignment: Alignment.center,
                    color: Colors
                        .transparent, // Optional overlay color with transparency
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Order Placed Successfully",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5), // Spacing between texts
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Row(children: [
                            Image.asset("assets/goldcoin.png", height: 20),
                            Text(
                              "300 Points added to your",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                        SizedBox(height: 5), // Spacing between texts
                        Text(
                          "My Fuels Card",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
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
