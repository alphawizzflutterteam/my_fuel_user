import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../utils/colors.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * .65,
                child: Image.asset(
                  "assets/nonet.png",
                ),
              ),
              Text(
                "Ooops!".tr,
                style: const TextStyle(
                    fontSize: 32,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "No Internet Connection Found.\nCheck Your Connection".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.lightBlueAccent,
                ),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  "Try Again".tr,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
