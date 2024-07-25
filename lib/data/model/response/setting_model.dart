class SettingModel {
  String? brandSetting;
  String? digitalProductSetting;
  int? systemDefaultCurrency;
  bool? digitalPayment;
  bool? cashOnDelivery;
  String? sellerRegistration;
  String? posActive;
  String? companyPhone;
  String? companyEmail;
  String? companyLogo;
  String? companyCoverImage;
  String? companyName;
  String? companyFavIcon;
  dynamic deliveryCountryRestriction;
  dynamic deliveryZipCodeAreaRestriction;
  BaseUrls? baseUrls;
  StaticUrls? staticUrls;
  String? aboutUs;
  String? privacyPolicy;
  String? termsConditions;

  String? vendorAboutUs;
  String? vendorPrivacyPolicy;
  String? vendorTermsConditions;
  List<VendorFaq>? vendorFaq;
  RefundPolicy? refundPolicy;
  RefundPolicy? returnPolicy;
  RefundPolicy? cancellationPolicy;
  List<CurrencyList>? currencyList;
  String? currencySymbolPosition;
  String? businessMode;
  bool? maintenanceMode;
  List<Language>? language;
  List<Colors>? colors;
  List<String>? unit;
  String? shippingMethod;
  bool? emailVerification;
  bool? phoneVerification;
  String? countryCode;
  List<SocialLogin>? socialLogin;
  String? currencyModel;
  String? forgotPasswordVerification;
  Announcement? announcement;
  dynamic pixelAnalytics;
  String? softwareVersion;
  int? decimalPointSettings;
  String? inhouseSelectedShippingType;
  int? billingInputByCustomer;
  int? minimumOrderLimit;
  int? walletStatus;
  int? loyaltyPointStatus;
  int? loyaltyPointExchangeRate;
  int? loyaltyPointMinimumPoint;

  dynamic offlinePayment;
  String? paymentMethodImagePath;
  String? refEarningStatus;
  String? activeTheme;

  int? guestCheckout;
  dynamic uploadPictureOnDelivery;
  UserAppVersionControl? userAppVersionControl;
  UserAppVersionControl? sellerAppVersionControl;
  UserAppVersionControl? deliveryManAppVersionControl;
  int? addFundsToWallet;
  int? minimumAddFundAmount;
  int? maximumAddFundAmount;
  InhouseTemporaryClose? inhouseTemporaryClose;
  InhouseVacationAdd? inhouseVacationAdd;
  int? freeDeliveryStatus;
  int? freeDeliveryOverAmount;
  String? freeDeliveryResponsibility;
  int? freeDeliveryOverAmountSeller;
  int? minimumOrderAmountStatus;
  int? minimumOrderAmount;
  int? minimumOrderAmountBySeller;
  int? orderVerification;
  String? referralCustomerSignupUrl;
  String? systemTimezone;
  String? refundDayLimit;
  String? mapApiStatus;
  DefaultLocation? defaultLocation;
  List<Slots>? slots;
  List<String>? days;
  List<SellerServices>? sellerServices;

  SettingModel(
      {this.brandSetting,
      this.digitalProductSetting,
      this.systemDefaultCurrency,
      this.digitalPayment,
      this.cashOnDelivery,
      this.sellerRegistration,
      this.posActive,
      this.companyPhone,
      this.companyEmail,
      this.companyLogo,
      this.companyCoverImage,
      this.companyName,
      this.companyFavIcon,
      this.deliveryCountryRestriction,
      this.deliveryZipCodeAreaRestriction,
      this.baseUrls,
      this.staticUrls,
      this.aboutUs,
      this.privacyPolicy,
      this.termsConditions,
      this.vendorAboutUs,
      this.vendorPrivacyPolicy,
      this.vendorTermsConditions,
      this.vendorFaq,
      this.refundPolicy,
      this.returnPolicy,
      this.cancellationPolicy,
      this.currencyList,
      this.currencySymbolPosition,
      this.businessMode,
      this.maintenanceMode,
      this.language,
      this.colors,
      this.unit,
      this.shippingMethod,
      this.emailVerification,
      this.phoneVerification,
      this.countryCode,
      this.socialLogin,
      this.currencyModel,
      this.forgotPasswordVerification,
      this.announcement,
      this.pixelAnalytics,
      this.softwareVersion,
      this.decimalPointSettings,
      this.inhouseSelectedShippingType,
      this.billingInputByCustomer,
      this.minimumOrderLimit,
      this.walletStatus,
      this.loyaltyPointStatus,
      this.loyaltyPointExchangeRate,
      this.loyaltyPointMinimumPoint,
      this.offlinePayment,
      this.paymentMethodImagePath,
      this.refEarningStatus,
      this.activeTheme,
      this.guestCheckout,
      this.uploadPictureOnDelivery,
      this.userAppVersionControl,
      this.sellerAppVersionControl,
      this.deliveryManAppVersionControl,
      this.addFundsToWallet,
      this.minimumAddFundAmount,
      this.maximumAddFundAmount,
      this.inhouseTemporaryClose,
      this.inhouseVacationAdd,
      this.freeDeliveryStatus,
      this.freeDeliveryOverAmount,
      this.freeDeliveryResponsibility,
      this.freeDeliveryOverAmountSeller,
      this.minimumOrderAmountStatus,
      this.minimumOrderAmount,
      this.minimumOrderAmountBySeller,
      this.orderVerification,
      this.referralCustomerSignupUrl,
      this.systemTimezone,
      this.refundDayLimit,
      this.mapApiStatus,
      this.defaultLocation,
      this.slots,
      this.days,
      this.sellerServices});

  SettingModel.fromJson(Map<String, dynamic> json) {
    brandSetting = json['brand_setting'];
    digitalProductSetting = json['digital_product_setting'];
    systemDefaultCurrency = json['system_default_currency'];
    digitalPayment = json['digital_payment'];
    cashOnDelivery = json['cash_on_delivery'];
    sellerRegistration = json['seller_registration'];
    posActive = json['pos_active'];
    companyPhone = json['company_phone'].toString();
    companyEmail = json['company_email'];
    companyLogo = json['company_logo'];
    companyCoverImage = json['company_cover_image'];
    companyName = json['company_name'];
    companyFavIcon = json['company_fav_icon'];
    deliveryCountryRestriction = json['delivery_country_restriction'];
    deliveryZipCodeAreaRestriction = json['delivery_zip_code_area_restriction'];
    baseUrls =
        json['base_urls'] != null ? BaseUrls.fromJson(json['base_urls']) : null;
    staticUrls = json['static_urls'] != null
        ? StaticUrls.fromJson(json['static_urls'])
        : null;
    aboutUs = json['about_us'];
    privacyPolicy = json['privacy_policy'];
    termsConditions = json['terms_&_conditions'];

    vendorAboutUs = json['vendor_about_us'];
    vendorPrivacyPolicy = json['vendor_privacy_policy'];
    vendorTermsConditions = json['vendor_terms_&_conditions'];
    if (json['vendor_faq'] != null) {
      vendorFaq = <VendorFaq>[];
      json['vendor_faq'].forEach((v) {
        vendorFaq!.add(VendorFaq.fromJson(v));
      });
    }
    refundPolicy = json['refund_policy'] != null
        ? RefundPolicy.fromJson(json['refund_policy'])
        : null;
    returnPolicy = json['return_policy'] != null
        ? RefundPolicy.fromJson(json['return_policy'])
        : null;
    cancellationPolicy = json['cancellation_policy'] != null
        ? RefundPolicy.fromJson(json['cancellation_policy'])
        : null;
    if (json['currency_list'] != null) {
      currencyList = <CurrencyList>[];
      json['currency_list'].forEach((v) {
        currencyList!.add(CurrencyList.fromJson(v));
      });
    }
    currencySymbolPosition = json['currency_symbol_position'];
    businessMode = json['business_mode'];
    maintenanceMode = json['maintenance_mode'];
    if (json['language'] != null) {
      language = <Language>[];
      json['language'].forEach((v) {
        language!.add(Language.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <Colors>[];
      json['colors'].forEach((v) {
        colors!.add(Colors.fromJson(v));
      });
    }
    unit = json['unit'].cast<String>();
    shippingMethod = json['shipping_method'];
    emailVerification = json['email_verification'];
    phoneVerification = json['phone_verification'];
    countryCode = json['country_code'];
    if (json['social_login'] != null) {
      socialLogin = <SocialLogin>[];
      json['social_login'].forEach((v) {
        socialLogin!.add(SocialLogin.fromJson(v));
      });
    }
    currencyModel = json['currency_model'];
    forgotPasswordVerification = json['forgot_password_verification'];
    announcement = json['announcement'] != null
        ? Announcement.fromJson(json['announcement'])
        : null;
    pixelAnalytics = json['pixel_analytics'];
    softwareVersion = json['software_version'];
    decimalPointSettings = json['decimal_point_settings'];
    inhouseSelectedShippingType = json['inhouse_selected_shipping_type'];
    billingInputByCustomer = json['billing_input_by_customer'];
    minimumOrderLimit = json['minimum_order_limit'];
    walletStatus = json['wallet_status'];
    loyaltyPointStatus = json['loyalty_point_status'];
    loyaltyPointExchangeRate = json['loyalty_point_exchange_rate'];
    loyaltyPointMinimumPoint = json['loyalty_point_minimum_point'];

    offlinePayment = json['offline_payment'];
    paymentMethodImagePath = json['payment_method_image_path'];
    refEarningStatus = json['ref_earning_status'];
    activeTheme = json['active_theme'];

    guestCheckout = json['guest_checkout'];
    uploadPictureOnDelivery = json['upload_picture_on_delivery'];
    userAppVersionControl = json['user_app_version_control'] != null
        ? UserAppVersionControl.fromJson(json['user_app_version_control'])
        : null;
    sellerAppVersionControl = json['seller_app_version_control'] != null
        ? UserAppVersionControl.fromJson(json['seller_app_version_control'])
        : null;
    deliveryManAppVersionControl =
        json['delivery_man_app_version_control'] != null
            ? UserAppVersionControl.fromJson(
                json['delivery_man_app_version_control'])
            : null;
    addFundsToWallet = json['add_funds_to_wallet'];
    minimumAddFundAmount = json['minimum_add_fund_amount'];
    maximumAddFundAmount = json['maximum_add_fund_amount'];
    inhouseTemporaryClose = json['inhouse_temporary_close'] != null
        ? InhouseTemporaryClose.fromJson(json['inhouse_temporary_close'])
        : null;
    inhouseVacationAdd = json['inhouse_vacation_add'] != null
        ? InhouseVacationAdd.fromJson(json['inhouse_vacation_add'])
        : null;
    freeDeliveryStatus = json['free_delivery_status'];
    freeDeliveryOverAmount = json['free_delivery_over_amount'];
    freeDeliveryResponsibility = json['free_delivery_responsibility'];
    freeDeliveryOverAmountSeller = json['free_delivery_over_amount_seller'];
    minimumOrderAmountStatus = json['minimum_order_amount_status'];
    minimumOrderAmount = json['minimum_order_amount'];
    minimumOrderAmountBySeller = json['minimum_order_amount_by_seller'];
    orderVerification = json['order_verification'];
    referralCustomerSignupUrl = json['referral_customer_signup_url'];
    systemTimezone = json['system_timezone'];
    refundDayLimit = json['refund_day_limit'].toString();
    mapApiStatus = json['map_api_status'].toString();
    defaultLocation = json['default_location'] != null
        ? DefaultLocation.fromJson(json['default_location'])
        : null;
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(Slots.fromJson(v));
      });
    }
    if (json['days'] != null) days = json['days'].cast<String>();

    if (json['seller_services'] != null) {
      sellerServices = <SellerServices>[];
      json['seller_services'].forEach((v) {
        sellerServices!.add(SellerServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand_setting'] = brandSetting;
    data['digital_product_setting'] = digitalProductSetting;
    data['system_default_currency'] = systemDefaultCurrency;
    data['digital_payment'] = digitalPayment;
    data['cash_on_delivery'] = cashOnDelivery;
    data['seller_registration'] = sellerRegistration;
    data['pos_active'] = posActive;
    data['company_phone'] = companyPhone;
    data['company_email'] = companyEmail;
    data['company_logo'] = companyLogo;
    data['company_cover_image'] = companyCoverImage;
    data['company_name'] = companyName;
    data['company_fav_icon'] = companyFavIcon;
    data['delivery_country_restriction'] = deliveryCountryRestriction;
    data['delivery_zip_code_area_restriction'] = deliveryZipCodeAreaRestriction;
    if (baseUrls != null) {
      data['base_urls'] = baseUrls!.toJson();
    }
    if (staticUrls != null) {
      data['static_urls'] = staticUrls!.toJson();
    }
    data['about_us'] = aboutUs;
    data['privacy_policy'] = privacyPolicy;
    data['terms_&_conditions'] = termsConditions;
    // if (faq != null) {
    //   data['faq'] = faq!.map((v) => v.toJson()).toList();
    // }
    data['vendor_about_us'] = vendorAboutUs;
    data['vendor_privacy_policy'] = vendorPrivacyPolicy;
    data['vendor_terms_&_conditions'] = vendorTermsConditions;
    if (vendorFaq != null) {
      data['vendor_faq'] = vendorFaq!.map((v) => v.toJson()).toList();
    }
    if (refundPolicy != null) {
      data['refund_policy'] = refundPolicy!.toJson();
    }
    if (returnPolicy != null) {
      data['return_policy'] = returnPolicy!.toJson();
    }
    if (cancellationPolicy != null) {
      data['cancellation_policy'] = cancellationPolicy!.toJson();
    }
    if (currencyList != null) {
      data['currency_list'] = currencyList!.map((v) => v.toJson()).toList();
    }
    data['currency_symbol_position'] = currencySymbolPosition;
    data['business_mode'] = businessMode;
    data['maintenance_mode'] = maintenanceMode;
    if (language != null) {
      data['language'] = language!.map((v) => v.toJson()).toList();
    }
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    data['unit'] = unit;
    data['shipping_method'] = shippingMethod;
    data['email_verification'] = emailVerification;
    data['phone_verification'] = phoneVerification;
    data['country_code'] = countryCode;
    if (socialLogin != null) {
      data['social_login'] = socialLogin!.map((v) => v.toJson()).toList();
    }
    data['currency_model'] = currencyModel;
    data['forgot_password_verification'] = forgotPasswordVerification;
    if (announcement != null) {
      data['announcement'] = announcement!.toJson();
    }
    data['pixel_analytics'] = pixelAnalytics;
    data['software_version'] = softwareVersion;
    data['decimal_point_settings'] = decimalPointSettings;
    data['inhouse_selected_shipping_type'] = inhouseSelectedShippingType;
    data['billing_input_by_customer'] = billingInputByCustomer;
    data['minimum_order_limit'] = minimumOrderLimit;
    data['wallet_status'] = walletStatus;
    data['loyalty_point_status'] = loyaltyPointStatus;
    data['loyalty_point_exchange_rate'] = loyaltyPointExchangeRate;
    data['loyalty_point_minimum_point'] = loyaltyPointMinimumPoint;
    // if (paymentMethods != null) {
    //   data['payment_methods'] =
    //       paymentMethods!.map((v) => v.toJson()).toList();
    // }
    data['offline_payment'] = offlinePayment;
    data['payment_method_image_path'] = paymentMethodImagePath;
    data['ref_earning_status'] = refEarningStatus;
    data['active_theme'] = activeTheme;
    // if (popularTags != null) {
    //   data['popular_tags'] = popularTags!.map((v) => v.toJson()).toList();
    // }
    data['guest_checkout'] = guestCheckout;
    data['upload_picture_on_delivery'] = uploadPictureOnDelivery;
    if (userAppVersionControl != null) {
      data['user_app_version_control'] = userAppVersionControl!.toJson();
    }
    if (sellerAppVersionControl != null) {
      data['seller_app_version_control'] = sellerAppVersionControl!.toJson();
    }
    if (deliveryManAppVersionControl != null) {
      data['delivery_man_app_version_control'] =
          deliveryManAppVersionControl!.toJson();
    }
    data['add_funds_to_wallet'] = addFundsToWallet;
    data['minimum_add_fund_amount'] = minimumAddFundAmount;
    data['maximum_add_fund_amount'] = maximumAddFundAmount;
    if (inhouseTemporaryClose != null) {
      data['inhouse_temporary_close'] = inhouseTemporaryClose!.toJson();
    }
    if (inhouseVacationAdd != null) {
      data['inhouse_vacation_add'] = inhouseVacationAdd!.toJson();
    }
    data['free_delivery_status'] = freeDeliveryStatus;
    data['free_delivery_over_amount'] = freeDeliveryOverAmount;
    data['free_delivery_responsibility'] = freeDeliveryResponsibility;
    data['free_delivery_over_amount_seller'] = freeDeliveryOverAmountSeller;
    data['minimum_order_amount_status'] = minimumOrderAmountStatus;
    data['minimum_order_amount'] = minimumOrderAmount;
    data['minimum_order_amount_by_seller'] = minimumOrderAmountBySeller;
    data['order_verification'] = orderVerification;
    data['referral_customer_signup_url'] = referralCustomerSignupUrl;
    data['system_timezone'] = systemTimezone;
    data['refund_day_limit'] = refundDayLimit;
    data['map_api_status'] = mapApiStatus;
    if (defaultLocation != null) {
      data['default_location'] = defaultLocation!.toJson();
    }
    if (slots != null) {
      data['slots'] = slots!.map((v) => v.toJson()).toList();
    }
    data['days'] = days;
    if (sellerServices != null) {
      data['seller_services'] = sellerServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BaseUrls {
  String? productImageUrl;
  String? productThumbnailUrl;
  String? digitalProductUrl;
  String? brandImageUrl;
  String? customerImageUrl;
  String? bannerImageUrl;
  String? categoryImageUrl;
  String? reviewImageUrl;
  String? sellerImageUrl;
  String? shopImageUrl;
  String? notificationImageUrl;
  String? deliveryManImageUrl;
  String? supportTicketImageUrl;
  String? chattingImageUrl;

  BaseUrls(
      {this.productImageUrl,
      this.productThumbnailUrl,
      this.digitalProductUrl,
      this.brandImageUrl,
      this.customerImageUrl,
      this.bannerImageUrl,
      this.categoryImageUrl,
      this.reviewImageUrl,
      this.sellerImageUrl,
      this.shopImageUrl,
      this.notificationImageUrl,
      this.deliveryManImageUrl,
      this.supportTicketImageUrl,
      this.chattingImageUrl});

  BaseUrls.fromJson(Map<String, dynamic> json) {
    print("categoryImageUrl ${json['category_image_url']}");
    productImageUrl = json['product_image_url'];
    productThumbnailUrl = json['product_thumbnail_url'];
    digitalProductUrl = json['digital_product_url'];
    brandImageUrl = json['brand_image_url'];
    customerImageUrl = json['customer_image_url'];
    bannerImageUrl = json['banner_image_url'];
    categoryImageUrl = json['category_image_url'];
    reviewImageUrl = json['review_image_url'];
    sellerImageUrl = json['seller_image_url'];
    shopImageUrl = json['shop_image_url'];
    notificationImageUrl = json['notification_image_url'];
    deliveryManImageUrl = json['delivery_man_image_url'];
    supportTicketImageUrl = json['support_ticket_image_url'];
    chattingImageUrl = json['chatting_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_image_url'] = productImageUrl;
    data['product_thumbnail_url'] = productThumbnailUrl;
    data['digital_product_url'] = digitalProductUrl;
    data['brand_image_url'] = brandImageUrl;
    data['customer_image_url'] = customerImageUrl;
    data['banner_image_url'] = bannerImageUrl;
    data['category_image_url'] = categoryImageUrl;
    data['review_image_url'] = reviewImageUrl;
    data['seller_image_url'] = sellerImageUrl;
    data['shop_image_url'] = shopImageUrl;
    data['notification_image_url'] = notificationImageUrl;
    data['delivery_man_image_url'] = deliveryManImageUrl;
    data['support_ticket_image_url'] = supportTicketImageUrl;
    data['chatting_image_url'] = chattingImageUrl;
    return data;
  }
}

class StaticUrls {
  String? contactUs;
  String? brands;
  String? categories;
  String? customerAccount;

  StaticUrls(
      {this.contactUs, this.brands, this.categories, this.customerAccount});

  StaticUrls.fromJson(Map<String, dynamic> json) {
    contactUs = json['contact_us'];
    brands = json['brands'];
    categories = json['categories'];
    customerAccount = json['customer_account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact_us'] = contactUs;
    data['brands'] = brands;
    data['categories'] = categories;
    data['customer_account'] = customerAccount;
    return data;
  }
}

class VendorFaq {
  int? id;
  String? question;
  String? answer;
  int? ranking;
  int? status;
  String? userType;
  String? createdAt;
  String? updatedAt;

  VendorFaq(
      {this.id,
      this.question,
      this.answer,
      this.ranking,
      this.status,
      this.userType,
      this.createdAt,
      this.updatedAt});

  VendorFaq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    ranking = json['ranking'];
    status = json['status'];
    userType = json['user_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    data['ranking'] = ranking;
    data['status'] = status;
    data['user_type'] = userType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class RefundPolicy {
  int? status;
  String? content;

  RefundPolicy({this.status, this.content});

  RefundPolicy.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['content'] = content;
    return data;
  }
}

class CurrencyList {
  int? id;
  String? name;
  String? symbol;
  String? code;
  String? exchangeRate;
  String? status;
  String? createdAt;
  String? updatedAt;

  CurrencyList(
      {this.id,
      this.name,
      this.symbol,
      this.code,
      this.exchangeRate,
      this.status,
      this.createdAt,
      this.updatedAt});

  CurrencyList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    code = json['code'];
    exchangeRate = json['exchange_rate'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['code'] = code;
    data['exchange_rate'] = exchangeRate;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Language {
  String? code;
  String? name;

  Language({this.code, this.name});

  Language.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}

class Colors {
  int? id;
  String? name;
  String? code;
  String? createdAt;
  String? updatedAt;

  Colors({this.id, this.name, this.code, this.createdAt, this.updatedAt});

  Colors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class SocialLogin {
  String? loginMedium;
  bool? status;

  SocialLogin({this.loginMedium, this.status});

  SocialLogin.fromJson(Map<String, dynamic> json) {
    loginMedium = json['login_medium'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login_medium'] = loginMedium;
    data['status'] = status;
    return data;
  }
}

class Announcement {
  dynamic status;
  dynamic color;
  dynamic textColor;
  dynamic announcement;

  Announcement({this.status, this.color, this.textColor, this.announcement});

  Announcement.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    color = json['color'];
    textColor = json['text_color'];
    announcement = json['announcement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['color'] = color;
    data['text_color'] = textColor;
    data['announcement'] = announcement;
    return data;
  }
}

class UserAppVersionControl {
  ForAndroid? forAndroid;
  ForAndroid? forIos;

  UserAppVersionControl({this.forAndroid, this.forIos});

  UserAppVersionControl.fromJson(Map<String, dynamic> json) {
    forAndroid = json['for_android'] != null
        ? ForAndroid.fromJson(json['for_android'])
        : null;
    forIos =
        json['for_ios'] != null ? ForAndroid.fromJson(json['for_ios']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forAndroid != null) {
      data['for_android'] = forAndroid!.toJson();
    }
    if (forIos != null) {
      data['for_ios'] = forIos!.toJson();
    }
    return data;
  }
}

class ForAndroid {
  int? status;
  String? version;
  String? link;

  ForAndroid({this.status, this.version, this.link});

  ForAndroid.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    version = json['version'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['version'] = version;
    data['link'] = link;
    return data;
  }
}

class InhouseTemporaryClose {
  int? status;

  InhouseTemporaryClose({this.status});

  InhouseTemporaryClose.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    return data;
  }
}

class InhouseVacationAdd {
  int? status;
  dynamic vacationStartDate;
  dynamic vacationEndDate;
  dynamic vacationNote;

  InhouseVacationAdd(
      {this.status,
      this.vacationStartDate,
      this.vacationEndDate,
      this.vacationNote});

  InhouseVacationAdd.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    vacationStartDate = json['vacation_start_date'];
    vacationEndDate = json['vacation_end_date'];
    vacationNote = json['vacation_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['vacation_start_date'] = vacationStartDate;
    data['vacation_end_date'] = vacationEndDate;
    data['vacation_note'] = vacationNote;
    return data;
  }
}

class DefaultLocation {
  String? lat;
  String? lng;

  DefaultLocation({this.lat, this.lng});

  DefaultLocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Slots {
  int? id;
  String? title;
  String? fromTime;
  String? toTime;
  int? status;
  String? createdAt;
  String? updatedAt;

  Slots(
      {this.id,
      this.title,
      this.fromTime,
      this.toTime,
      this.status,
      this.createdAt,
      this.updatedAt});

  Slots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class SellerServices {
  String? title;
  List<Data>? data;

  SellerServices({this.title, this.data});

  SellerServices.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? slug;
  String? icon;
  int? parentId;
  int? position;
  String? createdAt;
  String? updatedAt;
  int? homeStatus;
  int? priority;
  String? type;
  bool? isSelected;

  Data({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.parentId,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.homeStatus,
    this.priority,
    this.type,
    this.isSelected,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    parentId = json['parent_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homeStatus = json['home_status'];
    priority = json['priority'];
    type = json['type'];
    isSelected = json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['parent_id'] = parentId;
    data['position'] = position;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['home_status'] = homeStatus;
    data['priority'] = priority;
    data['type'] = type;
    data['is_selected'] = isSelected;
    /*if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}
