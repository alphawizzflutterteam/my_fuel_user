import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:test_prj/controller/language_controller.dart';
import 'package:test_prj/controller/splash_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => LanguageController());
    // Get.lazyPut(() => LoginController() );
    // Get.lazyPut(() => ForgotPasswordController() );
    // Get.lazyPut(() => OTPVerifyController() );
    // Get.lazyPut(() => SignupController() );
    // Get.lazyPut(() => DashboardController() );
    // Get.lazyPut(() => HomeController());
    //
  }
}
