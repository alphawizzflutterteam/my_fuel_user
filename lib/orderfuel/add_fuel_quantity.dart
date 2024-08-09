import 'package:flutter/material.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_hinttext_field.dart';
import 'package:test_prj/orderfuel/bottom_sheet.dart';

class AddFuelQuantity extends StatefulWidget {
  const AddFuelQuantity({super.key});

  @override
  State<AddFuelQuantity> createState() => _AddFuelQuantityState();
}

class _AddFuelQuantityState extends State<AddFuelQuantity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              'Add Fuel Quantity AAAA',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            MyHintTextField(
                hintText: Text(
              "Add Fuel Quantity AAAA",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            )),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                // if()

                showModalBottomSheet(
                  context: context,
                  builder: (context) => BottamSheet(),
                );
              },
              child: Container(
                child: MyButton(
                  text: "Add Quantity AAA",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
