import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/home.dart';
import 'package:test_prj/home_page.dart';

import '../data/model/verify_otp_model.dart';

class RegisterComplete extends StatelessWidget {
  const RegisterComplete({super.key});

  @override
  Widget build(BuildContext context) {
    final List<VerifyData> receivedList = Get.arguments;

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          )),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromRGBO(138, 180, 2, 1),
                Color.fromRGBO(138, 180, 2, 1),
                Color.fromRGBO(138, 180, 2, 1),
                Color.fromRGBO(59, 120, 31, 1),
                Color.fromRGBO(59, 120, 31, 1)
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(),
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Congratulations',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Your My Fuels Card is Ready',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 90),
              Container(
                height: 200,
                width: 335,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(20, 20, 20, 1),
                      Color.fromRGBO(30, 30, 30, 1),
                      Color.fromRGBO(43, 43, 43, 1),
                      Color.fromRGBO(82, 82, 82, 1),
                    ],
                  ),
                  borderRadius:
                      BorderRadius.circular(20), // Add circular border
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Align text to the left
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/login-logo.png",
                            height: 40,
                          ),
                          const Text(
                            'Every Drop Matters',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            '123 123 123 123',
                            style: TextStyle(
                              fontSize: 27,
                              color: Color.fromRGBO(253, 225, 64, 1),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Rajat malakar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '  Member Since',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '02 jan 2024',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 170,
              ),
              Container(
                height: 40,
                width: 320,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(253, 225, 64, 1),
                        Color.fromRGBO(222, 167, 0, 1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.only(left: 10),
                child: const Row(
                  mainAxisSize: MainAxisSize
                      .min, // Adjust the row size to fit the content
                  children: [
                    Icon(Icons.info_outline,
                        color: Colors.black), // Add your prefix icon here
                    SizedBox(
                        width:
                            8), // Add some space between the icon and the text
                    Text(
                      'Card added to your profile',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(width: 80),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
