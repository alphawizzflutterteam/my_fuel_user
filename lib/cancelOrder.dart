import 'package:flutter/material.dart';
import 'package:test_prj/components/my_button.dart';

import 'order_details.dart';

class CancelOrder extends StatefulWidget {
  const CancelOrder({super.key});

  @override
  State<CancelOrder> createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {
  int selectedValue = 1;

  String cancelReason='';

  Widget customRadio(String text, int value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedValue = value;
        });
      },
      child: Row(
        children: [
          Radio<int>(
            value: value,
            groupValue: selectedValue,
            onChanged: (int? newValue) {
              setState(() {
                selectedValue = newValue!;
                cancelReason=text;
              });
            },
            activeColor: Colors.red,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight:
                  selectedValue == value ? FontWeight.bold : FontWeight.normal,
              color: selectedValue == value ? Colors.black : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 120,
            //   decoration: BoxDecoration(
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
            //       Padding(
            //         padding: const EdgeInsets.only(top: 45.0, left: 20),
            //         child: Icon(
            //           Icons.arrow_back,
            //           color: Colors.white,
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(top: 45.0, left: 60),
            //         child: Text(
            //           'Cancel Order Reasons',
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
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Text(
                'Cancel Order Reason',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 23.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customRadio("Changed My Mind", 1),
                  customRadio("Found a Better Deal", 2),
                  customRadio("Delay in Delivery", 3),
                  customRadio("No Longer Need the Item", 4),
                  customRadio("Technical Issues", 5),
                  customRadio("Personal Emergency", 6),
                ],
              ),
            ),
            SizedBox(
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: ((context) => OrderDetails())));
                },
                child: MyButton(text: 'Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}