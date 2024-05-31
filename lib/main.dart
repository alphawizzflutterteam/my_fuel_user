import 'package:flutter/material.dart';
import 'package:test_prj/home.dart';
import 'package:test_prj/home_page.dart';
import 'package:test_prj/profile_page.dart';
import 'package:test_prj/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Fuels User",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
