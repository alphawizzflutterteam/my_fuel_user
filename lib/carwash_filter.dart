import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:task/screen/MyButtan.dart';
// import 'package:task/screen/MyhintTextField.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Bottam sheet'),
        onPressed: (){
          showModalBottomSheet(context: context,
              builder:(BuildContext context){

                return SizedBox(
                  height: 400,
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
                          child: Text(
                            "Filter",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
SizedBox(height: 25,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.2),
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.01),
                                  )
                              ),
                              height: 40,
                              width: 140,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, left: 15),
                                child: Text(
                                  'Min',
                                  style: TextStyle(fontSize: 16, color: Colors.black54),
                                ),
                              ),
                            ),
                          ),
Padding(
  padding: const EdgeInsets.only(left:15),
  child: Text('to',style: TextStyle(color: Colors.black54,fontSize: 16),),
),
                          Padding(
                            padding: const EdgeInsets.only(left:15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              height: 40,
                              width: 140,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, left: 15),
                                child: Text(
                                  'Max',
                                  style: TextStyle(fontSize: 15, color: Colors.black54),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(right: 275),
                        child: Text(
                          "Rating",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              height: 30,
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, left: 10),
                                child: Text(
                                  '2.0 and above',
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.1),

                              ),
                              height: 30,
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, left: 10),
                                child: Text(
                                  '3.0 and above',
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              height: 30,
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, left: 10),
                                child: Text(
                                  '4.0 and above',
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.1),

                              ),
                              height: 30,
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, left: 10),
                                child: Text(
                                  '3.5 and above',
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.1),

                              ),
                              height: 30,
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, left: 10),
                                child: Text(
                                  '4.5 and above',
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                            padding: const EdgeInsets.only(left:12),
                            child: Container(

                                alignment: Alignment.bottomCenter,
                                width: 160,
                                height: 45,
                                child:Container(
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Cencel',
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                  ),
                                )
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(

                              alignment: Alignment.bottomCenter,
                              width: 160,
                              height: 45,
                              // child:MyButton(text: 'Apply',),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }


}