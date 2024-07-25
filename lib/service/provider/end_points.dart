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
  static const String verifyOtp = '/api/v1/auth/verify-otp';
  static const String resetPassword = '/api/v1/auth/reset-password';
  static const String offers = '/api/v1/coupon/list';
  static const String addAddress = '/api/v1/customer/address/add';
  static const String addList = '/api/v1/customer/address/list';
  static const String walletTransactionHistory =
      '/api/v1/customer/wallet/list?offset=0&limit=10&transaction_type=all';
}
