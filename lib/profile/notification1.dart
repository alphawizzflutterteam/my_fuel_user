import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';

class Notification1 extends StatefulWidget {
  const Notification1({Key? key})
      : super(key: key); // Use Key? key instead of super.key

  @override
  State<Notification1> createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const MyAppbar(title: "Notification"),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      'assets/shopping.png',
                      height: 24,
                    ), // Use Image.asset to load asset image
                    title: const Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Row(
                        children: [
                          Text(
                            'Your order had been ship..',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   '02 Mar 2023',
                          //   style:
                          //       TextStyle(fontSize: 10, color: Colors.black54),
                          // ),
                        ],
                      ),
                    ), // Corrected name for consistency

                    subtitle: const Text(
                      'Lorem lpsum is simply dyummy text of t...',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
