class UserInfoModel {
  int? id;
  String? name;
  String? fName;
  String? lName;
  String? phone;
  String? image;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? streetAddress;
  String? country;
  String? city;
  String? zip;
  String? houseNo;
  String? apartmentNo;
  String? cmFirebaseToken;
  int? isActive;
  String? paymentCardLastFour;
  String? paymentCardBrand;
  String? paymentCardFawryToken;
  String? loginMedium;
  String? socialId;
  String? isPhoneVerified;
  String? temporaryToken;
  String? isEmailVerified;
  String? walletBalance;
  String? loyaltyPoint;
  String? loginHitCount;
  String? isTempBlocked;
  String? tempBlockTime;
  String? referralCode;
  String? referredBy;
  String? appLanguage;
  String? address;
  String? pan;
  String? msme;
  String? profile;
  String? gst;
  String? walletId;
  String? referralUserCount;
  String? ordersCount;
  String? wallet_id;

  UserInfoModel(
      {this.id,
      this.name,
      this.fName,
      this.lName,
      this.phone,
      this.image,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.streetAddress,
      this.country,
      this.city,
      this.zip,
      this.houseNo,
      this.apartmentNo,
      this.cmFirebaseToken,
      this.isActive,
      this.paymentCardLastFour,
      this.paymentCardBrand,
      this.paymentCardFawryToken,
      this.loginMedium,
      this.socialId,
      this.isPhoneVerified,
      this.temporaryToken,
      this.isEmailVerified,
      this.walletBalance,
      this.loyaltyPoint,
      this.loginHitCount,
      this.isTempBlocked,
      this.tempBlockTime,
      this.referralCode,
      this.referredBy,
      this.appLanguage,
      this.address,
      this.pan,
      this.msme,
      this.profile,
      this.gst,
      this.walletId,
      this.referralUserCount,
      this.wallet_id,
      this.ordersCount});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    image = json['image'];
    email = json['email'];
    wallet_id = json['wallet_id'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    streetAddress = json['street_address'];
    country = json['country'];
    city = json['city'];
    zip = json['zip'];
    houseNo = json['house_no'];
    apartmentNo = json['apartment_no'];
    cmFirebaseToken = json['cm_firebase_token'];
    isActive = json['is_active'];
    paymentCardLastFour = json['payment_card_last_four'];
    paymentCardBrand = json['payment_card_brand'];
    paymentCardFawryToken = json['payment_card_fawry_token'];
    loginMedium = json['login_medium'];
    socialId = json['social_id'];
    isPhoneVerified = json['is_phone_verified'].toString();
    temporaryToken = json['temporary_token'].toString();
    isEmailVerified = json['is_email_verified'].toString();
    walletBalance = json['wallet_balance'].toString();
    loyaltyPoint = json['loyalty_point'].toString();
    loginHitCount = json['login_hit_count'].toString();
    isTempBlocked = json['is_temp_blocked'].toString();
    tempBlockTime = json['temp_block_time'].toString();
    referralCode = json['referral_code'].toString();
    referredBy = json['referred_by'].toString();
    appLanguage = json['app_language'].toString();
    address = json['address'];
    pan = json['pan'];
    msme = json['msme'];
    profile = json['profile'];
    gst = json['gst'].toString();
    walletId = json['wallet_id'].toString();
    referralUserCount = json['referral_user_count'].toString();
    ordersCount = json['orders_count'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['email'] = this.email;
    data['wallet_id'] = this.wallet_id;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['street_address'] = this.streetAddress;
    data['country'] = this.country;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['house_no'] = this.houseNo;
    data['apartment_no'] = this.apartmentNo;
    data['cm_firebase_token'] = this.cmFirebaseToken;
    data['is_active'] = this.isActive;
    data['payment_card_last_four'] = this.paymentCardLastFour;
    data['payment_card_brand'] = this.paymentCardBrand;
    data['payment_card_fawry_token'] = this.paymentCardFawryToken;
    data['login_medium'] = this.loginMedium;
    data['social_id'] = this.socialId;
    data['is_phone_verified'] = this.isPhoneVerified;
    data['temporary_token'] = this.temporaryToken;
    data['is_email_verified'] = this.isEmailVerified;
    data['wallet_balance'] = this.walletBalance;
    data['loyalty_point'] = this.loyaltyPoint;
    data['login_hit_count'] = this.loginHitCount;
    data['is_temp_blocked'] = this.isTempBlocked;
    data['temp_block_time'] = this.tempBlockTime;
    data['referral_code'] = this.referralCode;
    data['referred_by'] = this.referredBy;
    data['app_language'] = this.appLanguage;
    data['address'] = this.address;
    data['pan'] = this.pan;
    data['msme'] = this.msme;
    data['profile'] = this.profile;
    data['gst'] = this.gst;
    data['wallet_id'] = this.walletId;
    data['referral_user_count'] = this.referralUserCount;
    data['orders_count'] = this.ordersCount;
    return data;
  }
}

//   int? id;
//   String? name;
//   String? fName;
//   String? lName;
//   String? phone;
//   String? image;
//   String? email;
//   String? emailVerifiedAt;
//   String? createdAt;
//   String? updatedAt;
//   String? streetAddress;
//   String? country;
//   String? city;
//   String? zip;
//   String? pan;
//   String? houseNo;
//   String? apartmentNo;
//   String? cmFirebaseToken;
//   int? isActive;
//   String? paymentCardLastFour;
//   String? paymentCardBrand;
//   String? paymentCardFawryToken;
//   String? loginMedium;
//   String? socialId;
//   String? isPhoneVerified;
//   String? temporaryToken;
//   int? isEmailVerified;
//   String? walletBalance;
//   String? loyaltyPoint;
//   String? loginHitCount;
//   String? isTempBlocked;
//   String? tempBlockTime;
//   String? referralCode;
//   String? referredBy;
//   String? appLanguage;
//   String? gst;
//   String? referralUserCount;
//   String? ordersCount;
//
//   UserInfoModel(
//       {this.id,
//       this.name,
//       this.fName,
//       this.lName,
//       this.phone,
//       this.image,
//       this.email,
//       this.emailVerifiedAt,
//       this.createdAt,
//       this.updatedAt,
//       this.streetAddress,
//       this.country,
//       this.city,
//       this.zip,
//       this.pan,
//       this.houseNo,
//       this.apartmentNo,
//       this.cmFirebaseToken,
//       this.isActive,
//       this.paymentCardLastFour,
//       this.paymentCardBrand,
//       this.paymentCardFawryToken,
//       this.loginMedium,
//       this.socialId,
//       this.isPhoneVerified,
//       this.temporaryToken,
//       this.isEmailVerified,
//       this.walletBalance,
//       this.loyaltyPoint,
//       this.loginHitCount,
//       this.isTempBlocked,
//       this.tempBlockTime,
//       this.referralCode,
//       this.referredBy,
//       this.appLanguage,
//       this.gst,
//       this.referralUserCount,
//       this.ordersCount});
//
//   UserInfoModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     fName = json['f_name'];
//     lName = json['l_name'];
//     phone = json['phone'];
//     image = json['image'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     streetAddress = json['street_address'];
//     country = json['country'];
//     city = json['city'];
//     zip = json['zip'];
//     pan = json['pan'];
//     houseNo = json['house_no'];
//     apartmentNo = json['apartment_no'];
//     cmFirebaseToken = json['cm_firebase_token'];
//     isActive = json['is_active'];
//     paymentCardLastFour = json['payment_card_last_four'];
//     paymentCardBrand = json['payment_card_brand'];
//     paymentCardFawryToken = json['payment_card_fawry_token'];
//     loginMedium = json['login_medium'];
//     socialId = json['social_id'];
//     isPhoneVerified = json['is_phone_verified'].toString();
//     temporaryToken = json['temporary_token'];
//     isEmailVerified = json['is_email_verified'];
//     walletBalance = json['wallet_balance'].toString();
//     loyaltyPoint = json['loyalty_point'].toString();
//     loginHitCount = json['login_hit_count'].toString();
//     isTempBlocked = json['is_temp_blocked'].toString();
//     tempBlockTime = json['temp_block_time'].toString();
//     referralCode = json['referral_code'].toString();
//     referredBy = json['referred_by'].toString();
//     appLanguage = json['app_language'].toString();
//     gst = json['gst'].toString();
//     referralUserCount = json['referral_user_count'].toString();
//     ordersCount = json['orders_count'].toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['f_name'] = this.fName;
//     data['l_name'] = this.lName;
//     data['phone'] = this.phone;
//     data['image'] = this.image;
//     data['email'] = this.email;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['street_address'] = this.streetAddress;
//     data['country'] = this.country;
//     data['city'] = this.city;
//     data['zip'] = this.zip;
//     data['house_no'] = this.houseNo;
//     data['apartment_no'] = this.apartmentNo;
//     data['cm_firebase_token'] = this.cmFirebaseToken;
//     data['is_active'] = this.isActive;
//     data['payment_card_last_four'] = this.paymentCardLastFour;
//     data['payment_card_brand'] = this.paymentCardBrand;
//     data['payment_card_fawry_token'] = this.paymentCardFawryToken;
//     data['login_medium'] = this.loginMedium;
//     data['social_id'] = this.socialId;
//     data['is_phone_verified'] = this.isPhoneVerified;
//     data['temporary_token'] = this.temporaryToken;
//     data['is_email_verified'] = this.isEmailVerified;
//     data['wallet_balance'] = this.walletBalance;
//     data['loyalty_point'] = this.loyaltyPoint;
//     data['login_hit_count'] = this.loginHitCount;
//     data['is_temp_blocked'] = this.isTempBlocked;
//     data['temp_block_time'] = this.tempBlockTime;
//     data['referral_code'] = this.referralCode;
//     data['referred_by'] = this.referredBy;
//     data['app_language'] = this.appLanguage;
//     data['gst'] = this.gst;
//     data['referral_user_count'] = this.referralUserCount;
//     data['orders_count'] = this.ordersCount;
//     return data;
//   }
// }
