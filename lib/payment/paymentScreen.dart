import 'package:flutter/material.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/payment/payment_form.dart';

class PaymentScreenTree extends StatefulWidget {
  final bool? isFromFuelOnTap;

  const PaymentScreenTree({super.key, this.isFromFuelOnTap});

  @override
  State<PaymentScreenTree> createState() => _PaymentScreenTreeState();
}

class _PaymentScreenTreeState extends State<PaymentScreenTree> {
  int _type = 1;

  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_outlined),
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                Color.fromRGBO(211, 83, 7, 1),
                Color.fromRGBO(252, 130, 59, 1),
                Color.fromRGBO(252, 130, 59, 1),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
          ),
        ),
        title: const Text('Payment Type'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Container(
              //   height: 100,
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
              //         padding: const EdgeInsets.only(top: 45.0, left: 80),
              //         child: Text(
              //           'Payment Type',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 20,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'Select payment method',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () => _handleRadio(2),
                  child: Container(
                      width: 325,
                      height: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: _type == 1
                              ? Border.all(width: 1, color: Colors.grey)
                              : Border.all(width: 0.3, color: Colors.grey)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pay by My fuels card',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Available balance',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Rs.1000',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text("",
                                style: _type == 1
                                    ? const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)
                                    : const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      )),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 60),
                                child: Radio(
                                  value: 1,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Colors.orange,
                                ),
                              ),
                              const Text(
                                'Add Money',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Container(
                  //     width: 325,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: _type == 2
                          ? Border.all(width: 1, color: Colors.black)
                          : Border.all(width: 0.3, color: Colors.grey)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/visa.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text("Visa",
                                textAlign: TextAlign.start,
                                style: _type == 2
                                    ? const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)
                                    : const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      )),
                          ),
                          Radio(
                            value: 2,
                            groupValue: _type,
                            onChanged: _handleRadio,
                            activeColor: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Container(
                    // width: 325,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: _type == 3
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/phonepy.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text("PhonePe",
                                textAlign: TextAlign.start,
                                style: _type == 3
                                    ? const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)
                                    : const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      )),
                          ),
                          Radio(
                            value: 3,
                            groupValue: _type,
                            onChanged: _handleRadio,
                            activeColor: Colors.orange,
                          ),
                        ],
                      ),
                    ))),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Container(
                    // width: 325,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: _type == 4
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/upi.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text("UPI Payment",
                                textAlign: TextAlign.start,
                                style: _type == 4
                                    ? const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)
                                    : const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      )),
                          ),
                          Radio(
                            value: 4,
                            groupValue: _type,
                            onChanged: _handleRadio,
                            activeColor: Colors.orange,
                          ),
                        ],
                      ),
                    )),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Container(
                    //   width: 325,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: _type == 5
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/googlepy.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text("Google Pay",
                                textAlign: TextAlign.start,
                                style: _type == 5
                                    ? const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)
                                    : const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      )),
                          ),
                          Radio(
                            value: 5,
                            groupValue: _type,
                            onChanged: _handleRadio,
                            activeColor: Colors.orange,
                          ),
                        ],
                      ),
                    )),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: GestureDetector(
                  onTap: () => _handleRadio,
                  child: Container(
                    //   width: 325,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: _type == 6
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/paystation.png",
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text("Pay at Station",
                                  textAlign: TextAlign.start,
                                  style: _type == 6
                                      ? const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)
                                      : const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        )),
                            ),
                            Radio(
                              value: 6,
                              groupValue: _type,
                              onChanged: _handleRadio,
                              activeColor: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: GestureDetector(
                  onTap: () => _handleRadio,
                  child: Container(
                    //       width: 325,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: _type == 7
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/paystation.png",
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text("Buy now pay later",
                                  textAlign: TextAlign.start,
                                  style: _type == 7
                                      ? const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)
                                      : const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        )),
                            ),
                            Radio(
                              value: 7,
                              groupValue: _type,
                              onChanged: _handleRadio,
                              activeColor: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 56,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentForm(
                                isFromFuelOnTap: widget.isFromFuelOnTap,
                              )));
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: 330,
                  child: const MyButton(
                    text: 'Continue',
                  ),
                ),
              ),
              const SizedBox(width: 80),
            ],
          ),
        ),
      ),
    );
  }
}
