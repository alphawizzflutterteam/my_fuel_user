import 'package:flutter/material.dart';
import 'package:test_prj/authPages/login_page.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/forLooking.dart';
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
            const Text(
              "Logout",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Are you sure , that you want to logout?",
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
                      child: const Text(
                        "Cancel",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: const MyButton(
                        text: "Logout",
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
