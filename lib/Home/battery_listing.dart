import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../helper/colors.dart';
import 'car_wish_list.dart';
import 'checkout_battery.dart';
import 'checkout_car_service.dart';

class BatteryListing extends StatefulWidget {
  final int? index ;
  const BatteryListing({super.key,this.index});

  @override
  State<BatteryListing> createState() => _BatteryListingState();
}

class _BatteryListingState extends State<BatteryListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
        foregroundColor: Colors.white,
        flexibleSpace: Container(
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
        ),
        title: Text('Battery Listing'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    InkWell(
                      onTap: (){
                        if(widget.index == 1){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkout_Car_Service()));

                        }else {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CarWashList()));
                        }
                      },
                      child:  Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: colors.lightgray),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // Add additional decoration properties here as needed
                                ),
                                width: 100,
                                height: 100,
                                child: ClipRRect( // Use ClipRRect to clip the image with the specified border radius
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/insurance.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                              ,
                              SizedBox(width: 20,),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5,),
                                  Text('Luminous 150 Ah Red ch....',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                  Text('12 V/150 Ah',style: TextStyle(color: colors.greyTemp),),
                                  SizedBox(height: 5,),
                                  Text('₹ 9170',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))

                                ],
                              )


                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 400,
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(top: 20, left: 30, right: 20),
                    child: Text(
                      "Filter",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(right: 290),
                  child: Text(
                    "Price",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey.withOpacity(0.2),
                            border: Border.all(color:  colors.greyTemp)),
                        height: 40,
                        width: 140,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 15),
                          child: Text(
                            'Min',
                            style:
                            TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'to',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color:  colors.greyTemp),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        height: 40,
                        width: 140,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 15),
                          child: Text(
                            'Max',
                            style:
                            TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(right: 275),
                  child: Text(
                    "Rating",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color:  colors.greyTemp),
                        ),
                        height: 30,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child: Text(
                            '2.0 and above',
                            style:
                            TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color:  colors.greyTemp),
                        ),
                        height: 30,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child: Text(
                            '3.0 and above',
                            style:
                            TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color:  colors.greyTemp),
                        ),
                        height: 30,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child: Text(
                            '4.0 and above',
                            style:
                            TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color:  colors.greyTemp),
                        ),
                        height: 30,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child: Text(
                            '3.5 and above',
                            style:
                            TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color:  colors.greyTemp),
                        ),
                        height: 30,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child: Text(
                            '4.5 and above',
                            style:
                            TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          width: 160,
                          height: 45,
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              border: Border.all(color:  colors.greyTemp),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Cencel',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 160,
                        height: 45,
                        child:MyButton(text: 'Apply',),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
