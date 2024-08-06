import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget errorImage(double h, double w) {
  return Image.asset(
    'assets/login-logo.png',
    height: h,
    width: w,
  );
}

Widget Nodata() {
  return Center(
    child: Container(
      child: Text("No Service Found"),
    ),
  );
}

Widget isCircularLoading() {
  return Center(
    child: Container(
      child: CircularProgressIndicator(),
    ),
  );
}
