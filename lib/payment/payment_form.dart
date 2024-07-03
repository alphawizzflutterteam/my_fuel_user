import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_hinttext_field.dart';
import 'package:test_prj/orderfuel/EV/AddMoneyplaced.dart';
import 'package:test_prj/payment/pay_success_page.dart';

class PaymentForm extends StatelessWidget {
 bool? isAdd;
  final bool? isFromFuelOnTap;

  PaymentForm({super.key, this.isFromFuelOnTap, this.isAdd});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MyAppbar(title: "Payment"),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 260),
                  child: Column(
                    children: [
                      MyHintTextField(
                          hintText: Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w600),
                        ) ,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(8)),
                            hintText: "Card Number",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade500),
                            prefixIcon: Icon(
                              Icons.credit_card_rounded,
                              color: Colors.grey.shade500,
                            ),
                            enabled: true),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyHintTextField(
                          hintText: Text(
                        "Expiry Date",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w600),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      MyHintTextField(
                          hintText: Text(
                        "CVV",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w600),
                      )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () =>
                  isAdd == true ?
                  Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => AddMoneyplaced(),
                         ),
                      ):
                      Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => OrderPlaced(
                          isFromFuelOnTap: isFromFuelOnTap,
                          ),
                        ),
                      ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: const MyButton(
                      text: "Pay Now",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
