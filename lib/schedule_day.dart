import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'CartItemSamples.dart';
// import 'MyButtan.dart';

class ScheduleDay extends StatefulWidget {
  @override
  State<ScheduleDay> createState() => _ScheduleDayState();
}

class _ScheduleDayState extends State<ScheduleDay> {
  DateTime? selectedDate;

  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 120,
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
                Padding(
                  padding: const EdgeInsets.only(top: 45.0, left: 20),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45.0, left: 65),
                  child: Text(
                    'Schedule Day',
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
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 120, // Set a fixed height for the list
                  child: ListView(
                    padding: EdgeInsets.zero, // Remove top padding
                    children: [
                      Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        elevation: 0, // Remove the shadow effect
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.only(right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10), // Ensure the image corners are rounded
                                  child: Image.network(
                                    'https://media.istockphoto.com/id/1330589502/photo/electric-vehicle-charging-station.jpg?s=1024x1024&w=is&k=20&c=gwve61BLBc9djE8P9Qp-2KSxS-ehZtvlcTW6AKy4DOA=',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sunfuel - Radisson Blu..",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on),
                                          SizedBox(width: 5),
                                          Text(
                                            "12, Ring Road",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Text(
                                              "300",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 10,
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  CupertinoIcons.star_fill,
                                                  size: 18,
                                                  color: Colors.orange,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '2.2',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 235), // Adjust bottom padding
                  child: Text(
                    "Select Type",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10,),

                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left:12),
                         child: Container(

                          alignment: Alignment.bottomCenter,
                          width: 160,
                                           height: 45,
                          // child:MyButton(text: 'Drop Step',),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 15),
                         child: Container(

                           alignment: Alignment.bottomCenter,
                           width: 160,
                           height: 45,
                           child:Container(
                             height: 56,
                             decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                               borderRadius: BorderRadius.circular(12),
                             ),
                             alignment: Alignment.center,
                             child: Text(
                               'Self Service',
                               style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                             ),
                           )
                         ),
                       ),

                     ],
                   ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right:190),
                  child: Text("Select Date & Slot",style:TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold) ,),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(

                      controller: dateController,
                      decoration: InputDecoration(
                        // labelText: 'Schedule date and timing',
                        hintText: 'Schedule date ',
                        //filled: true,
                        suffixIcon: const Icon(Icons.calendar_today),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      readOnly: true,
                      onTap: (){
                        _selectDate(context);}

                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(right: 280),
                  child: Text(
                    "Slots",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.orange,
                          )
                        ),
                        height: 35,
                        width: 160,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 15),
                          child: Text(
                            '1:00 PM - 1:30 PM',
                            style: TextStyle(fontSize: 15, color: Colors.orange),
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
                        height: 35,
                        width: 160,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 15),
                          child: Text(
                            '2:00 PM - 2:30 PM',
                            style: TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: Container(

                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          //color: Colors.grey.withOpacity(0.0),

                        ),
                        height: 35,
                        width: 160,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 15),
                          child: Text(
                            '2:30 PM - 3:00 PM',
                            style: TextStyle(fontSize: 15, color: Colors.black54),
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
                        height: 35,
                        width: 160,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 15),
                          child: Text(
                            '3:00 PM - 3:30 PM',
                            style: TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 140),
                  child: Text("Note to service provider",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16,),),
                ),
                SizedBox(height: 5,),
                Container(

                  height: 90,
                  width: 340,
                  color: Colors.white,
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 330,
                  // child: MyButton(text: 'Book Now'),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        //   selectedDate = picked;
        dateController.text=picked.toString().split(" ")[0];
      });
    }
  }
}