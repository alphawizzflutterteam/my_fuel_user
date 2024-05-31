import 'package:flutter/material.dart';
import 'package:test_prj/home_page.dart';

import '../components/my_button.dart';
import '../helper/colors.dart';
import '../orderfuel/EV/checkout_page.dart';
import '../orderfuel/doorStepDelivery/checkout_page1.dart';
import '../orderfuel/doorStepDelivery/vendors_page.dart';
import 'checkout_car_service.dart';
class Insurance_Scr extends StatefulWidget {
  const Insurance_Scr({super.key});

  @override
  State<Insurance_Scr> createState() => _Insurance_ScrState();
}

class _Insurance_ScrState extends State<Insurance_Scr> {
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
        title: Text('Insurance'),
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
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10,vertical: 10),
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colors.greyTemp,width: 2)
              ),
              child  :Text('Vehicle No.',style: TextStyle(color: colors.greyTemp,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10,vertical: 10),
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colors.greyTemp,width: 2)
              ),
              child  :Text('Full Name',style: TextStyle(color: colors.greyTemp,fontWeight: FontWeight.bold),),
            )    ,
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10,vertical: 10),
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colors.greyTemp,width: 2)
              ),
              child  :Text('Email',style: TextStyle(color: colors.greyTemp,fontWeight: FontWeight.bold),),
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
              child  :Text('Mobile No.',style: TextStyle(color: colors.greyTemp,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 200,),


            InkWell(
              onTap: (){
                showReviewDialog(context);
              },
              child: const MyButton(
                text: "Submit",
              ),
            ),

          ],
        ),
      ),
    );
  }

  void showReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 280,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(26),
                    color: colors.primary.withOpacity(.2),),
                    child: Icon(Icons.book_online_sharp,color: colors.primary,),
                  ),
                  SizedBox(height: 20,),


                  Text('On of our agents will connect',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Text('you shortly',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                  Navigator.pop(context);
                    },
                    child: const MyButton(
                      text: "Back to home",
                    ),
                  )


                ],
              ),
            ),
          ),
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
