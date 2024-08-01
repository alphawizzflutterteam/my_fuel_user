import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/controller/notification_controller.dart';

class Notification1 extends StatefulWidget {
  const Notification1({Key? key})
      : super(key: key); // Use Key? key instead of super.key

  @override
  State<Notification1> createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<NotificationController>(
            init: NotificationController(),
            builder: (notificationController) {
              return Column(
                children: [
                  const MyAppbar(title: "Notification"),
                  Expanded(
                      child: Obx(
                    () => notificationController.isLoading.value == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: notificationController.list.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Image.asset(
                                  'assets/shopping.png',
                                  height: 24,
                                ), // Use Image.asset to load asset image
                                title: Padding(
                                  padding: EdgeInsets.only(right: 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${notificationController.list[index].title}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Text(
                                      //   '02 Mar 2023',
                                      //   style:
                                      //       TextStyle(fontSize: 10, color: Colors.black54),
                                      // ),
                                      //  anjalijkjjkdcikjcdjidjjc
                                    ],
                                  ),
                                ), // Corrected name for consistency

                                subtitle: Text(
                                  '${notificationController.list[index].description}',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              );
                            },
                          ),
                  )),
                ],
              );
            }),
      ),
    );
  }
}
