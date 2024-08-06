import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/authPages/login_page.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/forLooking.dart';
import 'package:test_prj/routes/app_routes.dart';
import '../components/my_button.dart';
import '../helper/utils/shared_preference.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/logout.png",
              color: Colors.black,
              height: 55,
              width: 55,
            ),
            // const SizedBox(height: 10),
            Text(
              "Logout".tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Are you sure , that you want to logout?".tr,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "Cancel".tr,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: GestureDetector(
                      onTap: () async {
                        SharedPreferencesService? instance =
                            await SharedPreferencesService.getInstance();

                        instance.clear();
                        // Get.offAll(Routes.LOGIN);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false,
                        );
                      },
                      child: MyButton(
                        text: "Logout".tr,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
