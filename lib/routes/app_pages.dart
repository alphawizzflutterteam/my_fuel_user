import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_prj/authPages/create_password.dart';
import 'package:test_prj/authPages/language_page.dart';
import 'package:test_prj/authPages/login_page.dart';
import 'package:test_prj/authPages/otpScreen1.dart';
import 'package:test_prj/authPages/otpScreen2.dart';
import 'package:test_prj/authPages/sign_up.dart';
import 'package:test_prj/home.dart';
import 'package:test_prj/routes/app_routes.dart';
import 'package:test_prj/routes/bindings/inial_binding.dart';
import 'package:test_prj/splashScreen.dart';

import '../Home/Genset_checkOut.dart';
import '../Home/fuel_ontab_checkout.dart';
import '../authPages/register_complete.dart';

class AppPages {
  static const INITIAL = Routes.ROOT;
  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => const SplashScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.LANGUAGE,
      page: () => const LanguageScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const SignUp(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const Home(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.PHONE_VERIFICATION,
      page: () => const OTPScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.GENSET_CHECKOUT,
      page: () => const GetSetCheckoutScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.FUEL_CHECKOUT,
      page: () => FuelOnTabCheckoutScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.MEMBERCARD,
      page: () => const RegisterComplete(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.PASSWORD_VERIFICATION,
      page: () => OTPScreen2(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.CREATEPASSWORD,
      page: () => CreatePasswordPage(),
      binding: InitialBinding(),
    ),
//     GetPage(name: Routes.ROOT, page: () => RootView(), binding: RootBinding(), middlewares: [AuthMiddleware(), SalonOwnerMiddleware()]),
//     GetPage(name: Routes.CHAT, page: () => ChatsView(), binding: RootBinding(), middlewares: [AuthMiddleware(), SalonOwnerMiddleware()]),
//     GetPage(name: Routes.SETTINGS, page: () => SettingsView(), binding: SettingsBinding()),
//     GetPage(name: Routes.SETTINGS_THEME_MODE, page: () => ThemeModeView(), binding: SettingsBinding()),
//     GetPage(name: Routes.SETTINGS_LANGUAGE, page: () => LanguageView(), binding: SettingsBinding()),
//     GetPage(name: Routes.PROFILE, page: () => ProfileView(), binding: ProfileBinding()),
//     GetPage(name: Routes.LOGIN, page: () => LoginView(), binding: AuthBinding()),
//     GetPage(name: Routes.REGISTER, page: () => RegisterView(), binding: AuthBinding()),
//     GetPage(name: Routes.FORGOT_PASSWORD, page: () => ForgotPasswordView(), binding: AuthBinding()),
//     GetPage(name: Routes.PHONE_VERIFICATION, page: () => PhoneVerificationView(), binding: AuthBinding()),
//     GetPage(name: Routes.E_SERVICE, page: () => EServiceView(), binding: EServicesBinding(), transition: Transition.downToUp, middlewares: [AuthMiddleware()]),
//     GetPage(name: Routes.E_SERVICE_FORM, page: () => EServiceFormView(), binding: EServicesBinding(), middlewares: [AuthMiddleware()]),
//     GetPage(name: Routes.OPTIONS_FORM, page: () => OptionsFormView(), binding: EServicesBinding(), middlewares: [AuthMiddleware()]),
//     GetPage(name: Routes.E_SERVICES, page: () => EServicesView(), binding: EServicesBinding(), middlewares: [AuthMiddleware()]),
//     GetPage(name: Routes.SEARCH, page: () => SearchView(), binding: RootBinding(), transition: Transition.downToUp),
//     GetPage(name: Routes.NOTIFICATIONS, page: () => NotificationsView(), binding: NotificationsBinding()),
//     GetPage(name: Routes.PRIVACY, page: () => PrivacyView(), binding: HelpPrivacyBinding()),
//     GetPage(name: Routes.HELP, page: () => HelpView(), binding: HelpPrivacyBinding()),
//     GetPage(name: Routes.CUSTOM_PAGES, page: () => CustomPagesView(), binding: CustomPagesBinding()),
//     GetPage(name: Routes.REVIEW, page: () => ReviewView(), binding: RootBinding(), middlewares: [AuthMiddleware(), SalonOwnerMiddleware()]),
//     GetPage(name: Routes.BOOKING, page: () => BookingView(), binding: RootBinding(), middlewares: [AuthMiddleware(), SalonOwnerMiddleware()]),
//     GetPage(name: Routes.GALLERY, page: () => GalleryView(), binding: GalleryBinding(), transition: Transition.fadeIn),
//     // Salons
//     GetPage(name: Routes.SALON, page: () => SalonView(), binding: SalonBinding(), middlewares: [AuthMiddleware()]),
//     GetPage(name: Routes.SALON_E_SERVICES, page: () => SalonEServicesView(), binding: SalonBinding(), middlewares: [AuthMiddleware()]),
//     GetPage(name: Routes.SALONS, page: () => SalonsView(), binding: SalonsBinding(), middlewares: [AuthMiddleware()]),
//     GetPage(name: Routes.SALON_FORM, page: () => SalonFormView(), binding: SalonBinding(), middlewares: [AuthMiddleware()]),
//     GetPage(name: Routes.SALON_ADDRESSES_FORM, page: () => SalonAddressesFormView(), binding: SalonBinding(), middlewares: [AuthMiddleware()]),
//     GetPage(name: Routes.SALON_ADDRESS_PICKER, page: () => AddressPickerView(), binding: SalonBinding(), middlewares: [AuthMiddleware()]),
//     GetPage(name: Routes.SALON_AVAILABILITY_FORM, page: () => SalonAvailabilityFormView(), binding: SalonBinding(), middlewares: [AuthMiddleware()]),
// /*    GetPage(name: Routes.AWARD_FORM, page: () => AwardFormView(), binding: SalonBinding(),middlewares: [AuthMiddleware()]),
//     GetPage(name: Routes.EXPERIENCE_FORM, page: () => ExperienceFormView(), binding: SalonBinding(),middlewares: [AuthMiddleware()]),
//
//     */
//     // Subscription Module
//     GetPage(name: Routes.PACKAGES, page: () => PackagesView(), binding: SubscriptionBinding()),
//     GetPage(name: Routes.SUBSCRIPTIONS, page: () => SubscriptionsView(), binding: SubscriptionBinding()),
//     GetPage(name: Routes.CHECKOUT, page: () => CheckoutView(), binding: CheckoutBinding()),
//     GetPage(name: Routes.CONFIRMATION, page: () => ConfirmationView(), binding: CheckoutBinding()),
//     GetPage(name: Routes.PAYPAL, page: () => PayPalViewWidget(), binding: CheckoutBinding()),
//     GetPage(name: Routes.RAZORPAY, page: () => RazorPayViewWidget(), binding: CheckoutBinding()),
//     GetPage(name: Routes.STRIPE, page: () => StripeViewWidget(), binding: CheckoutBinding()),
//     GetPage(name: Routes.STRIPE_FPX, page: () => StripeFPXViewWidget(), binding: CheckoutBinding()),
//     GetPage(name: Routes.PAYSTACK, page: () => PayStackViewWidget(), binding: CheckoutBinding()),
//     GetPage(name: Routes.PAYMONGO, page: () => PayMongoViewWidget(), binding: CheckoutBinding()),
//     GetPage(name: Routes.FLUTTERWAVE, page: () => FlutterWaveViewWidget(), binding: CheckoutBinding()),
//     GetPage(name: Routes.CASH, page: () => CashViewWidget(), binding: CheckoutBinding()),
//     GetPage(name: Routes.WALLET, page: () => WalletViewWidget(), binding: CheckoutBinding()),
//     GetPage(name: Routes.WALLETS, page: () => WalletsView(), binding: WalletsBinding()),
//     GetPage(name: Routes.WALLET_FORM, page: () => WalletFormView(), binding: WalletsBinding()),
  ];
}
