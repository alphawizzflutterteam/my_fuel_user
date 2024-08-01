import 'package:flutter/material.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_prj/language/language_transtation.dart';
import 'package:test_prj/orderfuel/repository/order_fuel_repository.dart';
import 'package:test_prj/routes/app_pages.dart';
import 'package:test_prj/routes/bindings/inial_binding.dart';
import 'package:test_prj/service/provider/lavavel_provider.dart';

import 'helper/common/NoInternetScreen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
String tokenKey = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      ),
    );
  }
}
