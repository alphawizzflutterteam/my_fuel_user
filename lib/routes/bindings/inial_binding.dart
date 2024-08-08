import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:test_prj/controller/home_controller.dart';
import 'package:test_prj/controller/language_controller.dart';
import 'package:test_prj/controller/login_controller.dart';
import 'package:test_prj/controller/otp_controller.dart';
import 'package:test_prj/controller/profile_controller.dart';
import 'package:test_prj/controller/singup_controller.dart';
import 'package:test_prj/controller/splash_controller.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/orde_fuel_checkout_controller.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/controller/vendor_controller.dart';
import 'package:test_prj/orderfuel/doorStepDelivery/order_fuel_checkout.dart';

import '../../controller/address_controller.dart';
import '../../controller/asset_controller.dart';
import '../../controller/carservice_controller.dart';
import '../../controller/cart_controller.dart';
import '../../controller/forget_controller.dart';
import '../../controller/internet_controller.dart';
import '../../controller/offers_controller.dart';
import '../../controller/otherservice_controller.dart';
import '../../controller/paymnet_screen_controller.dart';
import '../../controller/wallet_controller.dart';
import '../../orderfuel/doorStepDelivery/controller/order_fuel_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => LanguageController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => CarServiceController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => OtpController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ForgetPasswordController());
    Get.lazyPut(() => OfferController());
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => InternetController());
    Get.lazyPut(() => AssetController());
    Get.lazyPut(() => OtherServiceController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => PaymentScreenController());
    // Get.lazyPut(() => OrderFuelController());
    // Get.lazyPut(() => VendorController());
    // Get.lazyPut(() => OrderFuelCheckoutController());

    // Get.lazyPut(() => LoginController() );
    // Get.lazyPut(() => ForgotPasswordController() );
    // Get.lazyPut(() => OTPVerifyController() );
    // Get.lazyPut(() => SignupController() );
    // Get.lazyPut(() => DashboardController() );
    // Get.lazyPut(() => HomeController());
    //
  }
}
