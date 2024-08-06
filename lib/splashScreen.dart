import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
String categoryId = "";
String? address;
String? fName;
String? Phone;
String? latitude;
String? longitude;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _determinePosition();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    print("object position $position");
    print("object position ${position.toJson()}");
    List<Placemark> placemark = await placemarkFromCoordinates(
        double.parse(position.latitude!.toString()),
        double.parse(position.longitude!.toString()),
        localeIdentifier: "en");

    latitude = position.latitude!.toString();
    longitude = position.longitude!.toString();
    placemark.toList(growable: true);

    Placemark place = placemark[0];

    setState(() {
      address =
          "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
    });
    print(
        "placemark.toList(growable: true); ${placemark.toList(growable: true)}");
    // final coordinates = new Coordinates(position.latitude, position.longitude);
    // var addresses =
    //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
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
              body: Center(
                child: Image.asset(
                  'assets/splash_gif.gif',
                  //height: 73,
                ),
              )
              // Column(
              //   children: [
              //     Center(
              //       child: Image.asset(
              //         'assets/splash_gif.gif',
              //         //height: 73,
              //       ),
              //     ),
              //     Text(
              //       LanguageGlobalVar.HELLO_WORLD.tr,
              //     )
              //   ],
              // ),
              );
        });
  }
}
