import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_hinttext_field.dart';
import 'package:test_prj/helper/utils/extentions.dart';
import 'package:test_prj/orderfuel/bottom_sheet.dart';

import '../orderfuel/fuelToGo/vendors_page2.dart';

class FueladdQuantity extends StatefulWidget {
  const FueladdQuantity({super.key, required this.controller, this.ontab});

  final VoidCallback? ontab;
  final TextEditingController controller;

  @override
  State<FueladdQuantity> createState() => _FueladdQuantityState();
}

class _FueladdQuantityState extends State<FueladdQuantity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Text(
              'Add Fuel Quantity'.tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                controller: widget.controller,
                decoration: CustomInputDecoration.inputDecoration(
                    'Add Fuel Quantity'.tr)),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              // onTap: () {
              //   showModalBottomSheet(
              //     context: context,
              //     builder: (context) => BottamSheet(),
              //   );
              // },
              child: InkWell(
                onTap: widget.ontab,
                child: Container(
                  child: MyButton(
                    text: "Add Quantity".tr,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
