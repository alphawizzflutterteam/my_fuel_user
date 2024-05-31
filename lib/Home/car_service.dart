import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../helper/colors.dart';
import '../orderfuel/EV/checkout_page.dart';
import '../orderfuel/doorStepDelivery/checkout_page1.dart';
import '../orderfuel/doorStepDelivery/vendors_page.dart';
import 'checkout_car_service.dart';

class CarService extends StatefulWidget {
  const CarService({super.key});

  @override
  State<CarService> createState() => _CarServiceState();
}

class _CarServiceState extends State<CarService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_outlined),
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
        title: Text('Car Service'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colors.greenTemp,width: 2)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Engine Oil and Filter',style: TextStyle(color: colors.greyTemp,fontWeight: FontWeight.bold),),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colors.greenTemp)
                    ),
                    child: Center(child: Icon(Icons.check,color: colors.greenTemp,)),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colors.greenTemp,width: 2)
              ),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Periodic Service',style: TextStyle(color: colors.greyTemp,fontWeight: FontWeight.bold),),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: colors.greenTemp)
                    ),
                    child: Center(child: Icon(Icons.check,color: colors.greenTemp,)),
                  )
                ],
              ),
            )   ,
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10,vertical: 10),
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colors.greyTemp,width: 2)
              ),
              child  :Text('Full Service',style: TextStyle(color: colors.greyTemp,fontWeight: FontWeight.bold),),
            )   ,
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10,vertical: 10),
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colors.greyTemp,width: 2)
              ),
              child  :Text('Others',style: TextStyle(color: colors.greyTemp,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 200,),


            InkWell(
              onTap: (){
                _showBottomSheet(context);
              },
              child: const MyButton(
                text: "Schedule Car Service",
              ),
            ),

          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet can scroll
      builder: (BuildContext context) {
        return SingleChildScrollView( // Wrap your content in SingleChildScrollView
          child:SizedBox(
            height: 400,
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
                    child: Text(
                      "Schedule data and timing",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                      controller: dateController,
                      decoration: InputDecoration(

                        // labelText: 'Schedule date and timing',
                        hintText: 'Schedule date and timing',
                        //filled: true,
                        suffixIcon: const Icon(Icons.calendar_today),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: colors.greyTemp),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDate(context);
                      }),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(right: 290),
                  child: Text(
                    "Slots",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colors.primary.withOpacity(0.1),
                          border: Border.all(color:colors.primary)
                        ),
                        height: 35,
                        width: 160,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 15),
                          child: Text(
                            '1:00 PM - 1:30 PM',
                            style: TextStyle(fontSize: 15, color:colors.primary),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
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
                      padding: const EdgeInsets.only(left: 10),
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
                SizedBox(height: 30),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 330,
                  child: GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Checkout_Car_Service())),
                      child: MyButton(text: 'Book Now')),
                ),
              ],
            ),
          )
        );
      },
    );
  }
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        //   selectedDate = picked;
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
