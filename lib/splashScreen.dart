import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_prj/authPages/language_page.dart';
import 'package:test_prj/controller/splash_controller.dart';
import 'package:test_prj/helper/colors.dart';
import 'package:test_prj/language/language_global_var.dart';

import 'data/model/response/setting_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

SettingModel? configModel;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          // controller.getSettingAPi();
          return Scaffold(
            backgroundColor: colors
                .splashColor, //Color.fromRGBO(27, 27, 27, 1),// Set your desired background color
            body: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/splash_gif.gif',
                    //height: 73,
                  ),
                ),
                Text(
                  LanguageGlobalVar.HELLO_WORLD.tr,
                )
              ],
            ),
          );
        });
  }
}
