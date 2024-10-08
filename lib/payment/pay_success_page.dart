import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/home.dart';

class OrderPlaced extends StatefulWidget {
  final String? amount;
  final String? order_id;
  OrderPlaced({super.key, this.isFromFuelOnTap, this.amount, this.order_id});
  final bool? isFromFuelOnTap;

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initUI();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Get.offAll(Home());

          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => const Home()));
          // Perform actions when pop is prevented (optional)
        }
      },
      child: Scaffold(
        body: InkWell(
          onTap: () {
            if (widget.isFromFuelOnTap ?? false) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            seleted: 1,
                          )));
              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return RateDriverDialog();
              //   },
              // );
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            seleted: 1,
                          )));
            }
          },
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
                            "Order Placed Successfully".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Order Id -${widget.order_id}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          Image.asset("assets/goldcoin.png",
                              height: 20), // Spacing between texts
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width / 1.2,
                              child: Text(
                                maxLines: 2,
                                "${widget.amount.toString()}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(height: 5), // Spacing between texts
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> initUI() async {
    print("object AAAAAAA ${widget.amount}");
    await Future.delayed(const Duration(milliseconds: 3000), () async {
      Get.offAll(Home(
        seleted: 1,
      ));
    });
  }
}

class RateDriverDialog extends StatefulWidget {
  @override
  _RateDriverDialogState createState() => _RateDriverDialogState();
}

class _RateDriverDialogState extends State<RateDriverDialog> {
  int _rating = 3;
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Center(
              child: Text(
                'Rate Driver',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Review',
              style: TextStyle(
                  fontSize: 16.0,
                  color: colors.blackTemp,
                  fontWeight: FontWeight.w500),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(5, (index) {
                  return SizedBox(
                    width: 25,
                    child: IconButton(
                      icon: Icon(
                        index < _rating ? Icons.star : Icons.star_border,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = index + 1;
                        });
                      },
                    ),
                  );
                }),
              ),
            ),
            const Text(
              'Description',
              style: TextStyle(
                  fontSize: 16.0,
                  color: colors.blackTemp,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colors.greenTemp.withOpacity(0.2))),
                hintText: 'Write here...',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10.0),
            InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                },
                child: SizedBox(
                    height: 40, child: MyButton(text: 'Submit Review'.tr)))
          ],
        ),
      ),
    );
  }
}
