import 'package:flutter/material.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/profile/notification1.dart';


class OffersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> offers = [
    {
      'color':colors.greenTemp,
      'text': 'DISCOUNT',
      'icon': Icons.local_offer,
      'title': 'Lorem Ipsum is simply',
      'description': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'offer': '50% off',
      'expiry': '30 Jul 2019'
    },
    {
      'color': colors.primary,
      'text': 'DISCOUNT',
      'icon': Icons.local_offer,
      'title': 'Lorem Ipsum is simply',
      'description': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'offer': '50% off',
      'expiry': '30 Jul 2019'
    },
    {
      'color': colors.greenTemp,
      'text': 'DISCOUNT',
      'icon': Icons.local_offer,
      'title': 'Lorem Ipsum is simply',
      'description': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'offer': '50% off',
      'expiry': '30 Jul 2019'
    },
  ];

   OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(child: Container(decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(252, 130, 59, 1),
            Color.fromRGBO(252, 130, 59, 1),
            Color.fromRGBO(211, 83, 7, 1),
          ],
        ),
      ),
      padding:const EdgeInsets.only(top: 48),
        child: Column(children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),

            // Top App bar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/mingcute_location-fill.png",
                      // scale: 20,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ward 35",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Ratan Lok Colony Indore",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    // Image.asset(
                    //   "assets/Group 2979.png",
                    //   height: 24,
                    // ),
                    const Icon(Icons.search,color: Colors.white,size: 30,),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Notification1(),)),
                      child: Image.asset(
                        "assets/Notification.png",
                        height: 24,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            padding: const EdgeInsets.only(top: 10),
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
              child: bodyWidget(),

            ),
          )
        ],),
      ),),
    );
  }

  Widget bodyWidget(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 27),
          const Text(
            'Best Offers',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            padding: EdgeInsets.zero,

            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: offers.length,
            itemBuilder: (context, index) {
              return OfferCard(
                color: offers[index]['color'],
                text: offers[index]['text'],
                icon: offers[index]['icon'],
                title: offers[index]['title'],
                description: offers[index]['description'],
                offer: offers[index]['offer'],
                expiry: offers[index]['expiry'],
              );
            },
          ),
        ],
      ),
    ) ;
  }
}

class OfferCard extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final String title;
  final String description;
  final String offer;
  final String expiry;

  OfferCard({
    required this.color,
    required this.text,
    required this.icon,
    required this.title,
    required this.description,
    required this.offer,
    required this.expiry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 150,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    text,
                    style: const TextStyle(color: colors.blackTemp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const ImageIcon(AssetImage('assets/offer_icon.png')),

              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Text(
                          'Offer',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '$offer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )

                      ],),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expires',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '$expiry',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


