import 'package:flutter/material.dart';
import 'package:test_prj/authPages/login_page.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 105,
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
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Choose Language",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 28),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //hindi
                    Container(
                      width: 150,
                      height: 155,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/hindi.png",
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "Hindi",
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                    ),

                    //english
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      },
                      child: Container(
                        width: 150,
                        height: 155,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/english.png",
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              "English",
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //telugu
                    Container(
                      width: 150,
                      height: 155,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          SizedBox(height: 22),
                          Image.asset(
                            "assets/telugu.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(height: 24),
                          Text(
                            "Telugu",
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                    ),

                    //malyalam
                    Container(
                      width: 150,
                      height: 155,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Image.asset(
                            "assets/malyalam.png",
                            height: 70,
                            width: 70,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Malyalam",
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //kannada
                    Container(
                      width: 150,
                      height: 155,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          SizedBox(height: 22),
                          Image.asset(
                            "assets/kannada.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(height: 24),
                          Text(
                            "Kannada",
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                    ),

                    //bengali
                    Container(
                      width: 150,
                      height: 155,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Image.asset(
                            "assets/bengali.png",
                            height: 60,
                            width: 60,
                          ),
                          SizedBox(height: 22),
                          Text(
                            "Bengali",
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
