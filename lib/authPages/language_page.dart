import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_prj/authPages/login_page.dart';
import 'package:test_prj/controller/language_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/language/language_global_var.dart';

import '../helper/utils/shared_preference.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: LanguageController(),
        builder: (controller) {
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
                    padding:
                        const EdgeInsets.only(top: 45.0, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LanguageGlobalVar.Choose_Language.tr,
                          style: const TextStyle(
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
                      GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.9),
                        itemCount: controller.languageList.length,
                        itemBuilder: (context, index) {
                          var item = controller.languageList[index];
                          return InkWell(
                            onTap: () async {
                              controller.languageList.forEach((element) {
                                element.isSelected = false;
                              });
                              SharedPreferencesService? instance =
                                  await SharedPreferencesService.getInstance();
                              item.isSelected = true;

                              if (index == 0) {
                                instance.saveData(
                                    SharedPreferencesService.kLanguageKey, "1");
                                controller.changeLanguage('hi', 'IN');
                                // controller
                                //     .setLanguage(const Locale('hi', 'IN'));
                              } else if (index == 1) {
                                instance.saveData(
                                    SharedPreferencesService.kLanguageKey, "2");
                                controller.changeLanguage('en', 'US');
                              } else if (index == 2) {
                                instance.saveData(
                                    SharedPreferencesService.kLanguageKey, "3");
                                controller.changeLanguage('te', 'IN');
                              } else if (index == 3) {
                                instance.saveData(
                                    SharedPreferencesService.kLanguageKey, "4");
                                controller.changeLanguage('ml', 'IN');
                              } else if (index == 4) {
                                instance.saveData(
                                    SharedPreferencesService.kLanguageKey, "5");
                                controller.changeLanguage('kn', 'IN');
                              } else if (index == 5) {
                                instance.saveData(
                                    SharedPreferencesService.kLanguageKey, "6");
                                controller.changeLanguage('bn', 'IN');
                              } else {
                                instance.saveData(
                                    SharedPreferencesService.kLanguageKey, "7");
                                controller.changeLanguage('en', 'US');
                              }
                            },
                            child: Container(
                              width: 150,
                              height: 155,
                              decoration: BoxDecoration(
                                  color: colors.whiteTemp,
                                  border: Border.all(
                                      color: item.isSelected ?? false
                                          ? colors.primary
                                          : Colors.yellow),
                                  boxShadow: [
                                    BoxShadow(
                                        color: item.isSelected ?? false
                                            ? colors.greyTemp.withOpacity(0.5)
                                            : colors.cardColor,
                                        spreadRadius: 2,
                                        blurRadius: 5)
                                  ],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    item.image ?? '',
                                    height: 100,
                                    width: 100,
                                    scale: index != 0 && index != 1 ? 2 : 1,
                                  ),
                                  Text(
                                    item.title ?? '',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  const Text(
                                    "",
                                    style: TextStyle(fontSize: 24),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                      /*Row(
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
                                const Text(
                                  "Hindi",
                                  style: TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                          ),

                          //english
                          InkWell(
                            onTap: () {},
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
                                  const Text(
                                    "English",
                                    style: TextStyle(fontSize: 24),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
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
                                  "Malayalam",
                                  style: TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
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
                      ),*/
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
