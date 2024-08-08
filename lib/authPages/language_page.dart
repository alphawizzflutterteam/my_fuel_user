import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_prj/authPages/login_page.dart';
import 'package:test_prj/components/my_appbar.dart';
import 'package:test_prj/controller/language_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/language/language_global_var.dart';
import 'package:test_prj/routes/app_routes.dart';

import '../components/my_button.dart';
import '../helper/utils/shared_preference.dart';

class LanguageScreen extends StatefulWidget {
  final bool? isLogin;
  LanguageScreen({super.key, this.isLogin = false});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: LanguageController(),
        builder: (controller) {
          return Scaffold(
            appBar: MyAppFinalbar(
              title: LanguageGlobalVar.Choose_Language.tr,
            ),
            body: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Stack(
                    //   children: [
                    //     Container(
                    //       height: 105,
                    //       decoration: BoxDecoration(
                    //         gradient: LinearGradient(
                    //           begin: Alignment.centerLeft,
                    //           end: Alignment.centerRight,
                    //           colors: [
                    //             Color.fromRGBO(252, 130, 59, 1),
                    //             Color.fromRGBO(252, 130, 59, 1),
                    //             Color.fromRGBO(211, 83, 7, 1),
                    //           ],
                    //         ),
                    //         borderRadius: BorderRadius.only(
                    //           bottomLeft: Radius.circular(23),
                    //           bottomRight: Radius.circular(23),
                    //         ),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(
                    //             top: 45.0, left: 20, right: 20),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               LanguageGlobalVar.Choose_Language.tr,
                    //               style: const TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.w400,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     widget.isLogin == true
                    //         ? Positioned(
                    //             left: 0,
                    //             child: Padding(
                    //               padding: EdgeInsets.only(top: 60.0, left: 20),
                    //               child: InkWell(
                    //                 onTap: () {
                    //                   Get.back();
                    //                 },
                    //                 child: Icon(
                    //                   Icons.arrow_back_ios_new,
                    //                   color: Colors.white,
                    //                 ),
                    //               ),
                    //             ),
                    //           )
                    //         : Container(),
                    //   ],
                    // ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 28),
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

                                  item.isSelected = true;

                                  setState(() {});
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
                                                ? colors.greyTemp
                                                    .withOpacity(0.5)
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
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () async {
                    SharedPreferencesService? instance =
                        await SharedPreferencesService.getInstance();
                    for (int index = 0;
                        index < controller.languageList.length;
                        index++) {
                      if (index == 0 &&
                          controller.languageList[index].isSelected == true) {
                        instance.saveData(
                            SharedPreferencesService.kLanguageKey, "1");
                        controller.changeLanguage('hi', 'IN');
                        // controller
                        //     .setLanguage(const Locale('hi', 'IN'));
                      } else if (index == 1 &&
                          controller.languageList[index].isSelected == true) {
                        instance.saveData(
                            SharedPreferencesService.kLanguageKey, "2");
                        controller.changeLanguage('en', 'US');
                      } else if (index == 2 &&
                          controller.languageList[index].isSelected == true) {
                        instance.saveData(
                            SharedPreferencesService.kLanguageKey, "3");
                        controller.changeLanguage('te', 'IN');
                      } else if (index == 3 &&
                          controller.languageList[index].isSelected == true) {
                        instance.saveData(
                            SharedPreferencesService.kLanguageKey, "4");
                        controller.changeLanguage('ml', 'IN');
                      } else if (index == 4 &&
                          controller.languageList[index].isSelected == true) {
                        instance.saveData(
                            SharedPreferencesService.kLanguageKey, "5");
                        controller.changeLanguage('kn', 'IN');
                      } else if (index == 5 &&
                          controller.languageList[index].isSelected == true) {
                        instance.saveData(
                            SharedPreferencesService.kLanguageKey, "6");
                        controller.changeLanguage('bn', 'IN');
                      } else {
                        instance.saveData(
                            SharedPreferencesService.kLanguageKey, "7");
                        controller.changeLanguage('en', 'US');
                      }

                      Future.delayed(
                        Duration(seconds: 1),
                        () => {
                          if (widget.isLogin == true)
                            {Get.back()}
                          else
                            {Get.toNamed(Routes.LOGIN)}
                        },
                      );
                    }
                  },
                  child: MyButton(text: 'Submit'.tr)),
            ),
          );
        });
  }
}
