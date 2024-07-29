import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prj/language/language_transtation.dart';
import 'package:test_prj/routes/app_pages.dart';
import 'package:test_prj/service/provider/lavavel_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => LaravelApiClient().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: navigatorKey,
      title: "My Fuels User",
      translations: Languages(),
      locale: const Locale('en', 'US'),
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}
