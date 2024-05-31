import 'package:flutter/material.dart';

import '../helper/colors.dart';
import 'car_wish_list.dart';
class TyresListing extends StatefulWidget {
  const TyresListing({super.key});

  @override
  State<TyresListing> createState() => _TyresListingState();
}

class _TyresListingState extends State<TyresListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },

            child: Icon(Icons.arrow_back_ios_new_outlined)),
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
        title: Text('Tyres Listing'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CarWashList()));
            },
            child: Container(
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
                          'assets/tyre.png',
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
                        Text('Perfinza CLX1',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text('205/55R16 91V TL',style: TextStyle(color: colors.greyTemp),),
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
      },)
    );
  }
}
