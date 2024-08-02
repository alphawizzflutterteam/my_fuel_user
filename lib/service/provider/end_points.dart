class ApiConstants {
  static const String userRegister = '/api/v1/auth/register';
  static const String login = '/api/v1/auth/login';
  static const String getSettingUri = '/api/v1/config';
  static const String getProfile = '/api/v1/customer/info';
  static const String banners = '/api/v1/banners';
  static const String checkPhone = '/api/v1/auth/check-phone';
  static const String veriFyPhone = '/api/v1/auth/verify-phone';
  static const String homeServices = '/api/v1/services';
  static const String forgetpassword = '/api/v1/auth/forgot-password';
  static const String updatepassword = '/api/v1/customer/update-password';
  static const String verifyOtp = '/api/v1/auth/verify-otp';
  static const String resetPassword = '/api/v1/auth/reset-password';
  static const String offers = '/api/v1/coupon/list';
  static const String addAddress = '/api/v1/customer/address/add';
  static const String addList = '/api/v1/customer/address/list';
  static const String serviceDetail = '/api/v1/products/filter';
  static const String Enquiry = '/api/v1/customer/order/generate-enquiry';
  static const String walletTransactionHistory =
      '/api/v1/customer/wallet/list?offset=0&limit=10&transaction_type=all';
  static const String addAsset = '/api/v1/customer/order/asset-store';
  static const String updateAsset = '/api/v1/customer/order/asset-update';
  static const String assetsList = '/api/v1/customer/order/asset-list';
  static const String deleteAsset = '/api/v1/customer/order/asset-delete/';
  static const String insuranceSubmit =
      '/api/v1/customer/order/insurance-store';
  static const String addToCart = '/api/v1/cart/add';
  static const String MANAGECART = '/api/v1/cart?address_id=';
  static const String UPDATEPROFILE = '/api/v1/customer/update-profile';
  static const String VENDORCHEKOUT = '/api/v1/customer/order/vendor-checkout';
  static const String addWallet = '/api/v1/customer/add_wallet';
  static const String ConfirmPlaceOrder =
      '/api/v1/customer/order/confirm-vendor-service';
  static const String ORDERLIST =
      '/api/v1/customer/order/list?limit=10&offset=0';
  static const String AllORDERLIST = '/api/v1/customer/bookings';
  static const String UPDATEORDERAPI =
      '/api/v1/customer/order/update-booking-status';

  ///2&category_id=1
  static const String PLACEORDER =
      '/api/v1/customer/order/place?billing_address_id=';

  ///2&payment_method=cash_on_delivery&order_note=ABC Status
  ///
  static const String VEHICLETYPE = '/api/v1/customer/order/vehicle-type';
  static const String VENDORSERVICE = '/api/v1/customer/order/service-vendor';
  static const String VEHICLEMODEL = '/api/v1/customer/order/vehicle-model';
  static const String TIMESLOTS = '/api/v1/customer/order/time-slots';

  static const String NOTIFICATIONS = '/api/v1/notifications';



  ///gopal
  static const String SUBMITREVIEW = '/api/v1/products/reviews/submit';
}
