class AssetListModel {
  bool? status;
  String? message;
  List<AssetData>? data;

  AssetListModel({this.status, this.message, this.data});

  AssetListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AssetData>[];
      json['data'].forEach((v) {
        data!.add(new AssetData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class AssetData {
  int? id;
  String? assetType;
  String? name;
  String? capacity;
  String? fuelCapacity;
  String? userId;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  bool? selectedAsset = false;

  AssetData(
      {this.id,
      this.assetType,
      this.name,
      this.capacity,
      this.fuelCapacity,
      this.userId,
      this.status,
      this.createdAt,
      this.selectedAsset,
      this.updatedAt,
      this.user});

  AssetData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assetType = json['asset_type'];
    name = json['name'];
    capacity = json['capacity'];
    fuelCapacity = json['fuel_capacity'];
    userId = json['user_id'];
    status = json['status'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['asset_type'] = this.assetType;
    data['name'] = this.name;
    data['capacity'] = this.capacity;
    data['fuel_capacity'] = this.fuelCapacity;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
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
  bool? isActive;
  String? paymentCardLastFour;
  String? paymentCardBrand;
  String? paymentCardFawryToken;
  String? loginMedium;
  String? socialId;
  bool? isPhoneVerified;
  String? temporaryToken;
  bool? isEmailVerified;
  String? walletBalance;
  String? loyaltyPoint;
  String? loginHitCount;
  bool? isTempBlocked;
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

  User(
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
      this.walletId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    image = json['image'];
    email = json['email'];
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
    isPhoneVerified = json['is_phone_verified'];
    temporaryToken = json['temporary_token'];
    isEmailVerified = json['is_email_verified'];
    walletBalance = json['wallet_balance'].toString();
    loyaltyPoint = json['loyalty_point'].toString();
    loginHitCount = json['login_hit_count'].toString();
    isTempBlocked = json['is_temp_blocked'];
    tempBlockTime = json['temp_block_time'];
    referralCode = json['referral_code'];
    referredBy = json['referred_by'];
    appLanguage = json['app_language'];
    address = json['address'];
    pan = json['pan'];
    msme = json['msme'];
    profile = json['profile'];
    gst = json['gst'].toString();
    walletId = json['wallet_id'].toString();
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
    return data;
  }
}
