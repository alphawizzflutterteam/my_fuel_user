import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_prj/language/language_transtation.dart';
import 'package:test_prj/orderfuel/repository/order_fuel_repository.dart';
import 'package:test_prj/routes/app_pages.dart';
import 'package:test_prj/routes/bindings/inial_binding.dart';
import 'package:test_prj/service/NotificationServices.dart';
import 'package:test_prj/service/provider/lavavel_provider.dart';

import 'helper/common/NoInternetScreen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
String tokenKey = '';
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAuHeYAh95Xrywgs9A4kBD_DxCuqFYOiOY',
    appId: "1:559417201906:android:26a1850de9b3c202166c6b",
    messagingSenderId: '559417201906',
    projectId: "myfuels-in",
    storageBucket: "myfuels-in.appspot.com",
  ));
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  LocalNotificationService.initialize();
  String? token = await FirebaseMessaging.instance.getToken();
  print('${token}_______________token');

  //await Get.putAsync(() => AuthService().init());
  await GetStorage.init();
  //GetStorage box = GetStorage();
  //tokenKey = box.read('token');
  await Get.putAsync(() => LaravelApiClient().init());
  await Get.putAsync(() => OrderFuelRepo().init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InternetWidget(
      offline: const FullScreenWidget(child: NoInternetScreen()),
      online: GetMaterialApp(
        key: navigatorKey,
        title: "My Fuels User",
        translations: Languages(),
        locale: const Locale('en', 'US'),
        initialRoute: AppPages.INITIAL,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: 'Nexa',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily: 'Nexa'),
            bodyMedium: TextStyle(fontFamily: 'Nexa'),
            bodySmall: TextStyle(fontFamily: 'Nexa'),
            displayLarge: TextStyle(fontFamily: 'Nexa'),
            displayMedium: TextStyle(fontFamily: 'Nexa'),
            displaySmall: TextStyle(fontFamily: 'Nexa'),
          ),
        ),
      ),
    );
  }
}
