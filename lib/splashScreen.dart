import 'package:flutter/material.dart';
import 'package:test_prj/authPages/language_page.dart';
import 'package:test_prj/helper/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LanguagePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: colors.splashColor , //Color.fromRGBO(27, 27, 27, 1),// Set your desired background color
      body: Center(
        child: Image.asset(
          'assets/splash_gif.gif',
          //height: 73,
        ),
      ),
    );
  }
}
