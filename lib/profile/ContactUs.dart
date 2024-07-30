import 'package:flutter/material.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/splashScreen.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Contact Us'),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.call),
                          SizedBox(
                            width: 10,
                          ),
                          Text("${configModel!.companyPhone.toString()}")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(
                            width: 10,
                          ),
                          Text("${configModel!.companyEmail.toString()}")
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
