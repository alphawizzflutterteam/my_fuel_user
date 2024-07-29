import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/payment/payment_form.dart';

class PaymentScreen extends StatefulWidget {
  bool? isAddoMoney;
  PaymentScreen({super.key, this.isAddoMoney});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _type = 1;

  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(msg: "Payment successfully");
    // addWallet();
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment cancelled by user");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(252, 130, 59, 1),
                    Color.fromRGBO(252, 130, 59, 1),
                    Color.fromRGBO(211, 83, 7, 1),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 45.0, left: 20),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 45.0, left: 80),
                    child: Text(
                      'Payment Type',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 100),
              child: Text(
                'Select payment method',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                  width: 325,
                  height: 55,
                  decoration: BoxDecoration(
                      border: _type == 1
                          ? Border.all(width: 1, color: Colors.black)
                          : Border.all(width: 0.3, color: Colors.grey)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Image.asset(
                            "assets/visa.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Visa",
                            style: _type == 1
                                ? TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)
                                : TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 140),
                        child: Radio(
                          value: 1,
                          groupValue: _type,
                          onChanged: _handleRadio,
                          activeColor: Colors.orange,
                        ),
                      ),
                    ],
                  ))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                  width: 325,
                  height: 55,
                  decoration: BoxDecoration(
                      border: _type == 2
                          ? Border.all(width: 1, color: Colors.black)
                          : Border.all(width: 0.3, color: Colors.grey)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Image.asset(
                            "assets/phonepy.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Phone Pay",
                            style: _type == 2
                                ? TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)
                                : TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 110),
                        child: Radio(
                          value: 2,
                          groupValue: _type,
                          onChanged: _handleRadio,
                          activeColor: Colors.orange,
                        ),
                      ),
                    ],
                  ))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                  width: 325,
                  height: 55,
                  decoration: BoxDecoration(
                      border: _type == 2
                          ? Border.all(width: 1, color: Colors.black)
                          : Border.all(width: 0.3, color: Colors.grey)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Image.asset(
                            "assets/upi.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("UPI Payment",
                            style: _type == 2
                                ? TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)
                                : TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 110),
                        child: Radio(
                          value: 2,
                          groupValue: _type,
                          onChanged: _handleRadio,
                          activeColor: Colors.orange,
                        ),
                      ),
                    ],
                  ))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                  width: 325,
                  height: 55,
                  decoration: BoxDecoration(
                      border: _type == 2
                          ? Border.all(width: 1, color: Colors.black)
                          : Border.all(width: 0.3, color: Colors.grey)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Image.asset(
                            "assets/googlepy.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Google Pay",
                            style: _type == 2
                                ? TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)
                                : TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 110),
                        child: Radio(
                          value: 2,
                          groupValue: _type,
                          onChanged: _handleRadio,
                          activeColor: Colors.orange,
                        ),
                      ),
                    ],
                  ))),
            ),
            // Padding(
            //     padding: EdgeInsets.only(top: 15),
            //     child: Container(
            //       width: 325,
            //       height: 55,
            //       decoration: BoxDecoration(
            //           border: _type == 5
            //               ? Border.all(width: 1, color: Colors.black)
            //               : Border.all(width: 0.3, color: Colors.grey)),
            //       child: Center(
            //           child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 5),
            //                 child: Image.asset(
            //                   "assets/pay_station.jpg",
            //                   height: 40,
            //                   width: 40,
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 20),
            //                 child: Text("Pay at Station",
            //                     style: _type == 5
            //                         ? TextStyle(
            //                             fontSize: 17,
            //                             fontWeight: FontWeight.w500,
            //                             color: Colors.black)
            //                         : TextStyle(
            //                             fontSize: 15,
            //                             fontWeight: FontWeight.w500,
            //                             color: Colors.grey,
            //                           )),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 100),
            //                 child: Radio(
            //                   value: 5,
            //                   groupValue: _type,
            //                   onChanged: _handleRadio,
            //                   activeColor: Colors.orange,
            //                 ),
            //               ),
            //             ],
            //           )
            //         ],
            //       )),
            //     )),
            // Padding(
            //     padding: EdgeInsets.only(top: 15),
            //     child: Container(
            //       width: 325,
            //       height: 55,
            //       decoration: BoxDecoration(
            //           border: _type == 6
            //               ? Border.all(width: 1, color: Colors.black)
            //               : Border.all(width: 0.3, color: Colors.grey)),
            //       child: Center(
            //           child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 5),
            //                 child: Image.asset(
            //                   "assets/pay_station.jpg",
            //                   height: 40,
            //                   width: 40,
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 20),
            //                 child: Text("Pay by wallet",
            //                     style: _type == 6
            //                         ? TextStyle(
            //                             fontSize: 17,
            //                             fontWeight: FontWeight.w500,
            //                             color: Colors.black)
            //                         : TextStyle(
            //                             fontSize: 15,
            //                             fontWeight: FontWeight.w500,
            //                             color: Colors.grey,
            //                           )),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 100),
            //                 child: Radio(
            //                   value: 6,
            //                   groupValue: _type,
            //                   onChanged: _handleRadio,
            //                   activeColor: Colors.orange,
            //                 ),
            //               ),
            //             ],
            //           )
            //         ],
            //       )),
            //     )),
            // Padding(
            //     padding: EdgeInsets.only(top: 15),
            //     child: Container(
            //       width: 325,
            //       height: 55,
            //       decoration: BoxDecoration(
            //           border: _type == 2
            //               ? Border.all(width: 0, color: Colors.black)
            //               : Border.all(width: 0.3, color: Colors.grey)),
            //       child: Center(
            //           child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 5),
            //                 child: Image.asset(
            //                   "assets/pay_station.jpg",
            //                   height: 40,
            //                   width: 40,
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 20),
            //                 child: Text("Pay by My fuels card",
            //                     style: _type == 7
            //                         ? TextStyle(
            //                             fontSize: 17,
            //                             fontWeight: FontWeight.w500,
            //                             color: Colors.black)
            //                         : TextStyle(
            //                             fontSize: 15,
            //                             fontWeight: FontWeight.w500,
            //                             color: Colors.grey,
            //                           )),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 40),
            //                 child: Radio(
            //                   value: 7,
            //                   groupValue: _type,
            //                   onChanged: _handleRadio,
            //                   activeColor: Colors.orange,
            //                 ),
            //               ),
            //             ],
            //           )
            //         ],
            //       )),
            //     )),
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: 330,
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PaymentForm(isAdd: widget.isAddoMoney))),
                child: const MyButton(
                  text: 'Continue',
                ),
              ),
            ),
            SizedBox(width: 80),
          ],
        ),
      ),
    );
  }
}
