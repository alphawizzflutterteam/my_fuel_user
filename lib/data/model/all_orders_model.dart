// To parse this JSON data, do
//
//     final allOrdersModel = allOrdersModelFromJson(jsonString);

import 'dart:convert';

AllOrdersModel allOrdersModelFromJson(String str) => AllOrdersModel.fromJson(json.decode(str));

String allOrdersModelToJson(AllOrdersModel data) => json.encode(data.toJson());

class AllOrdersModel {
  bool? status;
  String? message;
  List<OrderTypeList>? orderTypeList;

  AllOrdersModel({
    this.status,
    this.message,
    this.orderTypeList,
  });

  factory AllOrdersModel.fromJson(Map<String, dynamic> json) => AllOrdersModel(
    status: json["status"],
    message: json["message"],
    orderTypeList: json["data"] == null ? [] : List<OrderTypeList>.from(json["data"]!.map((x) => OrderTypeList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": orderTypeList == null ? [] : List<dynamic>.from(orderTypeList!.map((x) => x.toJson())),
  };
}

class OrderTypeList {
  int? id;
  String? name;
  List<Insurance>? insurances;
  List<Booking>? bookings;

  OrderTypeList({
    this.id,
    this.name,
    this.insurances,
    this.bookings,
  });

  factory OrderTypeList.fromJson(Map<String, dynamic> json) => OrderTypeList(
    id: json["id"],
    name: json["name"],
    insurances: json["insurances"] == null ? [] : List<Insurance>.from(json["insurances"]!.map((x) => Insurance.fromJson(x))),
    bookings: json["bookings"] == null ? [] : List<Booking>.from(json["bookings"]!.map((x) => Booking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "insurances": insurances == null ? [] : List<dynamic>.from(insurances!.map((x) => x.toJson())),
    "bookings": bookings == null ? [] : List<dynamic>.from(bookings!.map((x) => x.toJson())),
  };
}

class Booking {
  dynamic id;
  String? categoryId;
  String? userId;
  String? sellerId;
  String? serviceName;
  ServiceType? serviceType;
  int? quantity;
  Vehicle? vehicleType;
  Vehicle? vehicleModel;
  String? productId;
  String? tyreSize;
  String? timeSlotId;
  DateTime? date;
  String? notes;
  Service? service;
  String? shippingAddressId;
  String? billingSameAsShipping;
  String? billingAddressId;
  String? subtotal;
  String? discount;
  String? coupanDiscount;
  String? serviceCharges;
  String? total;
  String? isPaid;
  PaymentMethod? paymentMethod;
  InvoiceId? invoiceId;
  String? otp;
  dynamic deliveryManId;
  dynamic transactionId;
  String? status;
  Poc? poc;
  dynamic deliveryChalan;
  Poc? remarks;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Product>? products;
  Category? category;
  Customer? customer;
  Seller? seller;
  TimeSlot? timeSlot;
  IngAddress? shippingAddress;
  IngAddress? billingAddress;
  String? vehicleNumber;
  String? name;
  String? email;
  String? mobile;
  String? statusText;

  Booking({
    this.id,
    this.categoryId,
    this.userId,
    this.sellerId,
    this.serviceName,
    this.serviceType,
    this.quantity,
    this.vehicleType,
    this.vehicleModel,
    this.productId,
    this.tyreSize,
    this.timeSlotId,
    this.date,
    this.notes,
    this.service,
    this.shippingAddressId,
    this.billingSameAsShipping,
    this.billingAddressId,
    this.subtotal,
    this.discount,
    this.coupanDiscount,
    this.serviceCharges,
    this.total,
    this.isPaid,
    this.paymentMethod,
    this.invoiceId,
    this.otp,
    this.deliveryManId,
    this.transactionId,
    this.status,
    this.poc,
    this.deliveryChalan,
    this.remarks,
    this.createdAt,
    this.updatedAt,
    this.products,
    this.category,
    this.customer,
    this.seller,
    this.timeSlot,
    this.shippingAddress,
    this.billingAddress,
    this.vehicleNumber,
    this.name,
    this.email,
    this.mobile,
    this.statusText,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["id"],
    categoryId: json["category_id"],
    userId: json["user_id"],
    sellerId: json["seller_id"],
    serviceName: json["service_name"],
    serviceType: serviceTypeValues.map[json["service_type"]],
    quantity: json["quantity"],
    vehicleType: json["vehicle_type"] == null ? null : Vehicle.fromJson(json["vehicle_type"]),
    vehicleModel: json["vehicle_model"] == null ? null : Vehicle.fromJson(json["vehicle_model"]),
    productId: json["product_id"],
    tyreSize: json["tyre_size"],
    timeSlotId: json["time_slot_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    notes: json["notes"],
    service: serviceValues.map[json["service"]],
    shippingAddressId: json["shipping_address_id"],
    billingSameAsShipping: json["billing_same_as_shipping"],
    billingAddressId: json["billing_address_id"],
    subtotal: json["subtotal"],
    discount: json["discount"],
    coupanDiscount: json["coupan_discount"],
    serviceCharges: json["service_charges"],
    total: json["total"],
    isPaid: json["is_paid"],
    paymentMethod: paymentMethodValues.map[json["payment_method"]],
    invoiceId: invoiceIdValues.map[json["invoice_id"]],
    otp: json["otp"],
    deliveryManId: json["delivery_man_id"],
    transactionId: json["transaction_id"],
    status: json["status"],
    poc: pocValues.map[json["poc"]],
    deliveryChalan: json["delivery_chalan"],
    remarks: pocValues.map[json["remarks"]],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
    timeSlot: json["time_slot"] == null ? null : TimeSlot.fromJson(json["time_slot"]),
    shippingAddress: json["shipping_address"] == null ? null : IngAddress.fromJson(json["shipping_address"]),
    billingAddress: json["billing_address"] == null ? null : IngAddress.fromJson(json["billing_address"]),
    vehicleNumber: json["vehicle_number"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    statusText: json["status_text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "user_id": userId,
    "seller_id": sellerId,
    "service_name": serviceName,
    "service_type": serviceTypeValues.reverse[serviceType],
    "quantity": quantity,
    "vehicle_type": vehicleType?.toJson(),
    "vehicle_model": vehicleModel?.toJson(),
    "product_id": productId,
    "tyre_size": tyreSize,
    "time_slot_id": timeSlotId,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "notes": notes,
    "service": serviceValues.reverse[service],
    "shipping_address_id": shippingAddressId,
    "billing_same_as_shipping": billingSameAsShipping,
    "billing_address_id": billingAddressId,
    "subtotal": subtotal,
    "discount": discount,
    "coupan_discount": coupanDiscount,
    "service_charges": serviceCharges,
    "total": total,
    "is_paid": isPaid,
    "payment_method": paymentMethodValues.reverse[paymentMethod],
    "invoice_id": invoiceIdValues.reverse[invoiceId],
    "otp": otp,
    "delivery_man_id": deliveryManId,
    "transaction_id": transactionId,
    "status": status,
    "poc": pocValues.reverse[poc],
    "delivery_chalan": deliveryChalan,
    "remarks": pocValues.reverse[remarks],
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "category": category?.toJson(),
    "customer": customer?.toJson(),
    "seller": seller?.toJson(),
    "time_slot": timeSlot?.toJson(),
    "shipping_address": shippingAddress?.toJson(),
    "billing_address": billingAddress?.toJson(),
    "vehicle_number": vehicleNumber,
    "name": name,
    "email": email,
    "mobile": mobile,
    "status_text": statusText,
  };
}

class IngAddress {
  int? id;
  String? customerId;
  bool? isGuest;
  String? contactPersonName;
  String? email;
  AddressType? addressType;
  String? address;
  Building? building;
  Building? landmark;
  City? city;
  String? zip;
  String? phone;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? state;
  Country? country;
  String? latitude;
  String? longitude;
  bool? isBilling;

  IngAddress({
    this.id,
    this.customerId,
    this.isGuest,
    this.contactPersonName,
    this.email,
    this.addressType,
    this.address,
    this.building,
    this.landmark,
    this.city,
    this.zip,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.state,
    this.country,
    this.latitude,
    this.longitude,
    this.isBilling,
  });

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
    id: json["id"],
    customerId: json["customer_id"],
    isGuest: json["is_guest"],
    contactPersonName: json["contact_person_name"],
    email: json["email"],
    addressType: addressTypeValues.map[json["address_type"]],
    address: json["address"],
    building: buildingValues.map[json["building"]],
    landmark: buildingValues.map[json["landmark"]],
    city: cityValues.map[json["city"]],
    zip: json["zip"],
    phone: json["phone"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    state: json["state"],/*stateValues.map[json["state"]],*/
    country: countryValues.map[json["country"]],
    latitude: json["latitude"],
    longitude: json["longitude"],
    isBilling: json["is_billing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "is_guest": isGuest,
    "contact_person_name":contactPersonName,
    "email": email,
    "address_type": addressTypeValues.reverse[addressType],
    "address": address,
    "building": buildingValues.reverse[building],
    "landmark": buildingValues.reverse[landmark],
    "city": cityValues.reverse[city],
    "zip": zip,
    "phone": phone,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "state":state,
    "country": countryValues.reverse[country],
    "latitude": latitude,
    "longitude": longitude,
    "is_billing": isBilling,
  };
}

enum AddressType {
  HOME
}

final addressTypeValues = EnumValues({
  "Home": AddressType.HOME
});

enum Building {
  HSH,
  RAU
}

final buildingValues = EnumValues({
  "hsh": Building.HSH,
  "rau": Building.RAU
});

enum City {
  INDORE
}

final cityValues = EnumValues({
  "indore": City.INDORE
});

// enum ContactPersonName {
//   CONTACT_PERSON_NAME_DEEPAK_BARIA,
//   DEEPAK_BARIA
// }

// final contactPersonNameValues = EnumValues({
//   "deepak baria": ContactPersonName.CONTACT_PERSON_NAME_DEEPAK_BARIA,
//   "Deepak baria": ContactPersonName.DEEPAK_BARIA
// });

enum Country {
  INDIA
}

final countryValues = EnumValues({
  "india": Country.INDIA
});

enum StateData {
  MP,
  M_P
}

final stateValues = EnumValues({
  "mp": StateData.MP,
  "m.p": StateData.M_P
});

class Category {
  int? id;
  String? name;
  String? slug;
  String? icon;
  int? parentId;
  int? position;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? homeStatus;
  int? priority;
  Type? type;
  int? isFuel;
  List<dynamic>? translations;

  Category({
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
    this.isFuel,
    this.translations,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"],
    parentId: json["parent_id"],
    position: json["position"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    homeStatus: json["home_status"],
    priority: json["priority"],
    type: typeValues.map[json["type"]]!,
    isFuel: json["is_fuel"],
    translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "icon": icon,
    "parent_id": parentId,
    "position": position,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "home_status": homeStatus,
    "priority": priority,
    "type": typeValues.reverse[type],
    "is_fuel": isFuel,
    "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
  };
}

enum Type {
  DOOR_STEP_AT_YOUR_STATION_HOME_SERVICE,
  HOME_SERVICE
}

final typeValues = EnumValues({
  "Door Step,At your station,Home Service": Type.DOOR_STEP_AT_YOUR_STATION_HOME_SERVICE,
  "Home Service": Type.HOME_SERVICE
});

class Customer {
  int? id;
  FNameEnum? name;
  FNameEnum? fName;
  FNameEnum? lName;
  String? phone;
  CustomerImage? image;
  CustomerEmail? email;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic streetAddress;
  dynamic country;
  dynamic city;
  dynamic zip;
  dynamic houseNo;
  dynamic apartmentNo;
  dynamic cmFirebaseToken;
  bool? isActive;
  dynamic paymentCardLastFour;
  dynamic paymentCardBrand;
  dynamic paymentCardFawryToken;
  dynamic loginMedium;
  dynamic socialId;
  bool? isPhoneVerified;
  TemporaryToken? temporaryToken;
  bool? isEmailVerified;
  int? walletBalance;
  int? loyaltyPoint;
  int? loginHitCount;
  bool? isTempBlocked;
  dynamic tempBlockTime;
  ReferralCode? referralCode;
  dynamic referredBy;
  AppLanguage? appLanguage;
  String? address;
  String? pan;
  String? msme;
  String? profile;
  String? gst;
  String? walletId;

  Customer({
    this.id,
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
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    name: fNameEnumValues.map[json["name"]],
    fName: fNameEnumValues.map[json["f_name"]],
    lName: fNameEnumValues.map[json["l_name"]],
    phone: json["phone"],
    image: customerImageValues.map[json["image"]],
    email: customerEmailValues.map[json["email"]],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    streetAddress: json["street_address"],
    country: json["country"],
    city: json["city"],
    zip: json["zip"],
    houseNo: json["house_no"],
    apartmentNo: json["apartment_no"],
    cmFirebaseToken: json["cm_firebase_token"],
    isActive: json["is_active"],
    paymentCardLastFour: json["payment_card_last_four"],
    paymentCardBrand: json["payment_card_brand"],
    paymentCardFawryToken: json["payment_card_fawry_token"],
    loginMedium: json["login_medium"],
    socialId: json["social_id"],
    isPhoneVerified: json["is_phone_verified"],
    temporaryToken: temporaryTokenValues.map[json["temporary_token"]],
    isEmailVerified: json["is_email_verified"],
    walletBalance: json["wallet_balance"],
    loyaltyPoint: json["loyalty_point"],
    loginHitCount: json["login_hit_count"],
    isTempBlocked: json["is_temp_blocked"],
    tempBlockTime: json["temp_block_time"],
    referralCode: referralCodeValues.map[json["referral_code"]],
    referredBy: json["referred_by"],
    appLanguage: appLanguageValues.map[json["app_language"]],
    address: json["address"],
    pan: json["pan"],
    msme: json["msme"],
    profile: json["profile"],
    gst: json["gst"],
    walletId: json["wallet_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": fNameEnumValues.reverse[name],
    "f_name": fNameEnumValues.reverse[fName],
    "l_name": fNameEnumValues.reverse[lName],
    "phone": phone,
    "image": customerImageValues.reverse[image],
    "email": customerEmailValues.reverse[email],
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "street_address": streetAddress,
    "country": country,
    "city": city,
    "zip": zip,
    "house_no": houseNo,
    "apartment_no": apartmentNo,
    "cm_firebase_token": cmFirebaseToken,
    "is_active": isActive,
    "payment_card_last_four": paymentCardLastFour,
    "payment_card_brand": paymentCardBrand,
    "payment_card_fawry_token": paymentCardFawryToken,
    "login_medium": loginMedium,
    "social_id": socialId,
    "is_phone_verified": isPhoneVerified,
    "temporary_token": temporaryTokenValues.reverse[temporaryToken],
    "is_email_verified": isEmailVerified,
    "wallet_balance": walletBalance,
    "loyalty_point": loyaltyPoint,
    "login_hit_count": loginHitCount,
    "is_temp_blocked": isTempBlocked,
    "temp_block_time": tempBlockTime,
    "referral_code": referralCodeValues.reverse[referralCode],
    "referred_by": referredBy,
    "app_language": appLanguageValues.reverse[appLanguage],
    "address": address,
    "pan": pan,
    "msme": msme,
    "profile": profile,
    "gst": gst,
    "wallet_id": walletId,
  };
}

enum AppLanguage {
  EN
}

final appLanguageValues = EnumValues({
  "en": AppLanguage.EN
});

enum CustomerEmail {
  BARIYADPK95_GMAIL_COM
}

final customerEmailValues = EnumValues({
  "bariyadpk95@gmail.com": CustomerEmail.BARIYADPK95_GMAIL_COM
});

enum FNameEnum {
  DEEPAK_BARIYA
}

final fNameEnumValues = EnumValues({
  "Deepak bariya": FNameEnum.DEEPAK_BARIYA
});

enum CustomerImage {
  DEF_PNG
}

final customerImageValues = EnumValues({
  "def.png": CustomerImage.DEF_PNG
});

enum ReferralCode {
  QFMZF1_HWDVLUZ2_N8_ZZYS
}

final referralCodeValues = EnumValues({
  "QFMZF1HWDVLUZ2N8ZZYS": ReferralCode.QFMZF1_HWDVLUZ2_N8_ZZYS
});

enum TemporaryToken {
  XL_C_JZC7_UP3_T_D_GK4_L5_Y_LUMCA6_SQ_JYMS_E6_PQ_VF_AT4_U
}

final temporaryTokenValues = EnumValues({
  "xlCJzc7up3tDGk4L5YLumca6SQJymsE6PQVfAt4u": TemporaryToken.XL_C_JZC7_UP3_T_D_GK4_L5_Y_LUMCA6_SQ_JYMS_E6_PQ_VF_AT4_U
});

enum InvoiceId {
  OID
}

final invoiceIdValues = EnumValues({
  "OID": InvoiceId.OID
});

enum PaymentMethod {
  COD
}

final paymentMethodValues = EnumValues({
  "cod": PaymentMethod.COD
});

enum Poc {
  EMPTY
}

final pocValues = EnumValues({
  "-": Poc.EMPTY
});

class Product {
  int? id;
  AddedBy? addedBy;
  int? userId;
  String? name;
  String? slug;
  ProductType? productType;
  List<CategoryId>? categoryIds;
  int? categoryId;
  dynamic subCategoryId;
  dynamic subSubCategoryId;
  int? brandId;
  Unit? unit;
  int? minQty;
  int? refundable;
  dynamic digitalProductType;
  String? digitalFileReady;
  dynamic images;
  ChoiceOptions? colorImage;
  String? thumbnail;
  dynamic featured;
  dynamic flashDeal;
  VideoProvider? videoProvider;
  dynamic videoUrl;
  ChoiceOptions? colors;
  int? variantProduct;
  Attributes? attributes;
  ChoiceOptions? choiceOptions;
  ChoiceOptions? variation;
  int? published;
  int? unitPrice;
  int? purchasePrice;
  int? tax;
  DiscountTypeEnum? taxType;
  TaxModel? taxModel;
  int? discount;
  DiscountTypeEnum? discountType;
  int? currentStock;
  int? minimumOrderQty;
  String? details;
  int? freeShipping;
  dynamic attachment;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? status;
  int? featuredStatus;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImage;
  int? requestStatus;
  dynamic deniedNote;
  int? shippingCost;
  int? multiplyQty;
  dynamic tempShippingCost;
  dynamic isShippingCostUpdated;
  String? code;
  List<dynamic>? translations;
  List<dynamic>? reviews;

  Product({
    this.id,
    this.addedBy,
    this.userId,
    this.name,
    this.slug,
    this.productType,
    this.categoryIds,
    this.categoryId,
    this.subCategoryId,
    this.subSubCategoryId,
    this.brandId,
    this.unit,
    this.minQty,
    this.refundable,
    this.digitalProductType,
    this.digitalFileReady,
    this.images,
    this.colorImage,
    this.thumbnail,
    this.featured,
    this.flashDeal,
    this.videoProvider,
    this.videoUrl,
    this.colors,
    this.variantProduct,
    this.attributes,
    this.choiceOptions,
    this.variation,
    this.published,
    this.unitPrice,
    this.purchasePrice,
    this.tax,
    this.taxType,
    this.taxModel,
    this.discount,
    this.discountType,
    this.currentStock,
    this.minimumOrderQty,
    this.details,
    this.freeShipping,
    this.attachment,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.featuredStatus,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.requestStatus,
    this.deniedNote,
    this.shippingCost,
    this.multiplyQty,
    this.tempShippingCost,
    this.isShippingCostUpdated,
    this.code,
    this.translations,
    this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    addedBy: addedByValues.map[json["added_by"]],
    userId: json["user_id"],
    name: json["name"],
    slug: json["slug"],
    productType: productTypeValues.map[json["product_type"]],
    // categoryIds: json["category_ids"] == null ? [] : List<CategoryId>.from(json["category_ids"].map((x) => CategoryId.fromJson(x))),
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    subSubCategoryId: json["sub_sub_category_id"],
    brandId: json["brand_id"],
    unit: unitValues.map[json["unit"]],
    minQty: json["min_qty"],
    refundable: json["refundable"],
    digitalProductType: json["digital_product_type"],
    digitalFileReady: json["digital_file_ready"],
    images: json["images"],
    colorImage: choiceOptionsValues.map[json["color_image"]],
    thumbnail: json["thumbnail"],
    featured: json["featured"],
    flashDeal: json["flash_deal"],
    videoProvider: videoProviderValues.map[json["video_provider"]],
    videoUrl: json["video_url"],
    colors: choiceOptionsValues.map[json["colors"]],
    variantProduct: json["variant_product"],
    attributes: attributesValues.map[json["attributes"]]!,
    choiceOptions: choiceOptionsValues.map[json["choice_options"]],
    variation: choiceOptionsValues.map[json["variation"]],
    published: json["published"],
    unitPrice: json["unit_price"],
    purchasePrice: json["purchase_price"],
    tax: json["tax"],
    taxType: discountTypeEnumValues.map[json["tax_type"]],
    taxModel: taxModelValues.map[json["tax_model"]],
    discount: json["discount"],
    discountType: discountTypeEnumValues.map[json["discount_type"]],
    currentStock: json["current_stock"],
    minimumOrderQty: json["minimum_order_qty"],
    details: json["details"],
    freeShipping: json["free_shipping"],
    attachment: json["attachment"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    status: json["status"],
    featuredStatus: json["featured_status"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaImage: json["meta_image"],
    requestStatus: json["request_status"],
    deniedNote: json["denied_note"],
    shippingCost: json["shipping_cost"],
    multiplyQty: json["multiply_qty"],
    tempShippingCost: json["temp_shipping_cost"],
    isShippingCostUpdated: json["is_shipping_cost_updated"],
    code: json["code"],
    translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "added_by": addedByValues.reverse[addedBy],
    "user_id": userId,
    "name": name,
    "slug": slug,
    "product_type": productTypeValues.reverse[productType],
    "category_ids": categoryIds == null ? [] : List<dynamic>.from(categoryIds!.map((x) => x.toJson())),
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "sub_sub_category_id": subSubCategoryId,
    "brand_id": brandId,
    "unit": unitValues.reverse[unit],
    "min_qty": minQty,
    "refundable": refundable,
    "digital_product_type": digitalProductType,
    "digital_file_ready": digitalFileReady,
    "images": images,
    "color_image": choiceOptionsValues.reverse[colorImage],
    "thumbnail": thumbnail,
    "featured": featured,
    "flash_deal": flashDeal,
    "video_provider": videoProviderValues.reverse[videoProvider],
    "video_url": videoUrl,
    "colors": choiceOptionsValues.reverse[colors],
    "variant_product": variantProduct,
    "attributes": attributesValues.reverse[attributes],
    "choice_options": choiceOptionsValues.reverse[choiceOptions],
    "variation": choiceOptionsValues.reverse[variation],
    "published": published,
    "unit_price": unitPrice,
    "purchase_price": purchasePrice,
    "tax": tax,
    "tax_type": discountTypeEnumValues.reverse[taxType],
    "tax_model": taxModelValues.reverse[taxModel],
    "discount": discount,
    "discount_type": discountTypeEnumValues.reverse[discountType],
    "current_stock": currentStock,
    "minimum_order_qty": minimumOrderQty,
    "details": details,
    "free_shipping": freeShipping,
    "attachment": attachment,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "status": status,
    "featured_status": featuredStatus,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_image": metaImage,
    "request_status": requestStatus,
    "denied_note": deniedNote,
    "shipping_cost": shippingCost,
    "multiply_qty": multiplyQty,
    "temp_shipping_cost": tempShippingCost,
    "is_shipping_cost_updated": isShippingCostUpdated,
    "code": code,
    "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
  };
}

enum AddedBy {
  ADMIN,
  SELLER
}

final addedByValues = EnumValues({
  "admin": AddedBy.ADMIN,
  "seller": AddedBy.SELLER
});

enum Attributes {
  NULL
}

final attributesValues = EnumValues({
  "null": Attributes.NULL
});

class CategoryId {
  String? id;
  int? position;

  CategoryId({
    this.id,
    this.position,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
    id: json["id"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
  };
}

enum ChoiceOptions {
  EMPTY
}

final choiceOptionsValues = EnumValues({
  "[]": ChoiceOptions.EMPTY
});

enum DiscountTypeEnum {
  FLAT,
  PERCENT
}

final discountTypeEnumValues = EnumValues({
  "flat": DiscountTypeEnum.FLAT,
  "percent": DiscountTypeEnum.PERCENT
});

enum ProductType {
  PHYSICAL
}

final productTypeValues = EnumValues({
  "physical": ProductType.PHYSICAL
});

enum TaxModel {
  INCLUDE
}

final taxModelValues = EnumValues({
  "include": TaxModel.INCLUDE
});

enum Unit {
  KG,
  PAIR,
  PC
}

final unitValues = EnumValues({
  "kg": Unit.KG,
  "pair": Unit.PAIR,
  "pc": Unit.PC
});

enum VideoProvider {
  YOUTUBE
}

final videoProviderValues = EnumValues({
  "youtube": VideoProvider.YOUTUBE
});

class Seller {
  int? id;
  String? fName;
  dynamic lName;
  String? phone;
  SellerImage? image;
  SellerEmail? email;
  Password? password;
  Status? status;
  dynamic rememberToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic bankName;
  dynamic branch;
  dynamic accountNo;
  dynamic holderName;
  AuthToken? authToken;
  dynamic salesCommissionPercentage;
  Gst? gst;
  Pan? pan;
  CmFirebaseToken? cmFirebaseToken;
  int? posStatus;
  int? minimumOrderAmount;
  int? freeDeliveryStatus;
  int? freeDeliveryOverAmount;
  AppLanguage? appLanguage;
  int? wallet;

  Seller({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.image,
    this.email,
    this.password,
    this.status,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.bankName,
    this.branch,
    this.accountNo,
    this.holderName,
    this.authToken,
    this.salesCommissionPercentage,
    this.gst,
    this.pan,
    this.cmFirebaseToken,
    this.posStatus,
    this.minimumOrderAmount,
    this.freeDeliveryStatus,
    this.freeDeliveryOverAmount,
    this.appLanguage,
    this.wallet,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
    id: json["id"],
    fName: json["f_name"],
    lName: json["l_name"],
    phone: json["phone"],
    image: sellerImageValues.map[json["image"]],
    email: sellerEmailValues.map[json["email"]],
    password: passwordValues.map[json["password"]],
    status: statusValues.map[json["status"]],
    rememberToken: json["remember_token"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    bankName: json["bank_name"],
    branch: json["branch"],
    accountNo: json["account_no"],
    holderName: json["holder_name"],
    authToken: authTokenValues.map[json["auth_token"]],
    salesCommissionPercentage: json["sales_commission_percentage"],
    gst: gstValues.map[json["gst"]],
    pan: panValues.map[json["pan"]],
    cmFirebaseToken: cmFirebaseTokenValues.map[json["cm_firebase_token"]],
    posStatus: json["pos_status"],
    minimumOrderAmount: json["minimum_order_amount"],
    freeDeliveryStatus: json["free_delivery_status"],
    freeDeliveryOverAmount: json["free_delivery_over_amount"],
    appLanguage: appLanguageValues.map[json["app_language"]],
    wallet: json["wallet"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "f_name": fNameValues.reverse[fName],
    "l_name": lName,
    "phone": phone,
    "image": sellerImageValues.reverse[image],
    "email": sellerEmailValues.reverse[email],
    "password": passwordValues.reverse[password],
    "status": statusValues.reverse[status],
    "remember_token": rememberToken,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "bank_name": bankName,
    "branch": branch,
    "account_no": accountNo,
    "holder_name": holderName,
    "auth_token": authTokenValues.reverse[authToken],
    "sales_commission_percentage": salesCommissionPercentage,
    "gst": gstValues.reverse[gst],
    "pan": panValues.reverse[pan],
    "cm_firebase_token": cmFirebaseTokenValues.reverse[cmFirebaseToken],
    "pos_status": posStatus,
    "minimum_order_amount": minimumOrderAmount,
    "free_delivery_status": freeDeliveryStatus,
    "free_delivery_over_amount": freeDeliveryOverAmount,
    "app_language": appLanguageValues.reverse[appLanguage],
    "wallet": wallet,
  };
}

enum AuthToken {
  NQ_KEGJF_CL_RD_PK_J_SB_KC0_Q_DZ_TVM_WPEG9_J_TA_X4_GX_GT_Z7_P_TOZJ0_Y_JG,
  THE_2_Q_TF_RX_V17_T_FV97_Q_ED_O9_ZNQ6_N_D_RP_MK_GI_J4_LW_ZS_UM6_ZHK6_H_JG_XH1
}

final authTokenValues = EnumValues({
  "NQKegjfClRdPkJSbKC0QDzTVMWpeg9JTaX4gxGtZ7pTozj0yJg": AuthToken.NQ_KEGJF_CL_RD_PK_J_SB_KC0_Q_DZ_TVM_WPEG9_J_TA_X4_GX_GT_Z7_P_TOZJ0_Y_JG,
  "2qTfRxV17TFv97qEdO9ZNQ6nDRpMKGiJ4lwZSUm6zhk6hJGXh1": AuthToken.THE_2_Q_TF_RX_V17_T_FV97_Q_ED_O9_ZNQ6_N_D_RP_MK_GI_J4_LW_ZS_UM6_ZHK6_H_JG_XH1
});

enum CmFirebaseToken {
  FGSDG,
  SDFGSFDG
}

final cmFirebaseTokenValues = EnumValues({
  "fgsdg": CmFirebaseToken.FGSDG,
  "sdfgsfdg": CmFirebaseToken.SDFGSFDG
});

enum SellerEmail {
  GOPAL_MAILINATOR_COM,
  RAJESHKUMAR_GMAIL_COM
}

final sellerEmailValues = EnumValues({
  "gopal@mailinator.com": SellerEmail.GOPAL_MAILINATOR_COM,
  "rajeshkumar@gmail.com": SellerEmail.RAJESHKUMAR_GMAIL_COM
});

enum FName {
  GOPAL,
  RAJESH_KUMAR1
}

final fNameValues = EnumValues({
  "Gopal": FName.GOPAL,
  "rajesh kumar1": FName.RAJESH_KUMAR1
});

enum Gst {
  GJ8766778_GGGGHH,
  HSHSH7727273_HSH
}

final gstValues = EnumValues({
  "gj8766778gggghh": Gst.GJ8766778_GGGGHH,
  "hshsh7727273hsh": Gst.HSHSH7727273_HSH
});

enum SellerImage {
  THE_2024073066_A8_E4_EFA2_D49_WEBP,
  THE_2024073166_A9_E039260_D2_WEBP
}

final sellerImageValues = EnumValues({
  "2024-07-30-66a8e4efa2d49.webp": SellerImage.THE_2024073066_A8_E4_EFA2_D49_WEBP,
  "2024-07-31-66a9e039260d2.webp": SellerImage.THE_2024073166_A9_E039260_D2_WEBP
});

enum Pan {
  GVGGHH5677,
  THE_7373773737
}

final panValues = EnumValues({
  "gvgghh5677": Pan.GVGGHH5677,
  "7373773737": Pan.THE_7373773737
});

enum Password {
  THE_2_Y_10_O_NZ_GT_Q_KYT_UL1_IR8_S_CP6_UH_S_SSZ_CE9_C9_T_KQ_NU_QY_KRV3_RE_HW_FE_ZCE,
  THE_2_Y_10_U_XO_MITXK_G_L7_ZG3_V_YE8_BHOBPI_JW_SW1_D_WJTW62_U_RJ1_FS29_BFP_O2_C
}

final passwordValues = EnumValues({
  "\u00242y\u002410\u0024oNZGt/qKYTUl1ir8s/Cp6uhSSsz.ce9C9tKQNuQYKrv3reHWFeZce": Password.THE_2_Y_10_O_NZ_GT_Q_KYT_UL1_IR8_S_CP6_UH_S_SSZ_CE9_C9_T_KQ_NU_QY_KRV3_RE_HW_FE_ZCE,
  "\u00242y\u002410\u0024uXoMitxkG/L7Zg3vYe8BHOBPIJwSW1DWjtw62.URj1FS29BfpO2/C": Password.THE_2_Y_10_U_XO_MITXK_G_L7_ZG3_V_YE8_BHOBPI_JW_SW1_D_WJTW62_U_RJ1_FS29_BFP_O2_C
});

enum Status {
  APPROVED
}

final statusValues = EnumValues({
  "approved": Status.APPROVED
});

enum Service {
  AT_YOUR_STATION,
  DOOR_STEP,
  SERVICE_AT_YOUR_STATION
}

final serviceValues = EnumValues({
  "At your station": Service.AT_YOUR_STATION,
  "Door Step": Service.DOOR_STEP,
  "At Your Station": Service.SERVICE_AT_YOUR_STATION
});

enum ServiceType {
  EMPTY,
  FUEL
}

final serviceTypeValues = EnumValues({
  "": ServiceType.EMPTY,
  "Fuel": ServiceType.FUEL
});

class TimeSlot {
  int? id;
  String? title;
  String? fromTime;
  String? toTime;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  TimeSlot({
    this.id,
    this.title,
    this.fromTime,
    this.toTime,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
    id: json["id"],
    title: json["title"],
    fromTime: json["from_time"],
    toTime: json["to_time"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": titleValues.reverse[title],
    "from_time": fromTime,
    "to_time": toTime,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum Title {
  THE_0300_PM_TO_0600_PM,
  THE_0600_PM_TO_0900_PM,
  THE_0900_AM_TO_1200_PM
}

final titleValues = EnumValues({
  "03:00 PM to 06:00 PM": Title.THE_0300_PM_TO_0600_PM,
  "06:00 PM to 09:00 PM": Title.THE_0600_PM_TO_0900_PM,
  "09:00 AM to 12:00 PM": Title.THE_0900_AM_TO_1200_PM
});

class Vehicle {
  int? id;
  int? vehicleTypeId;
  VehicleModelName? name;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Vehicle({
    this.id,
    this.vehicleTypeId,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["id"],
    vehicleTypeId: json["vehicle_type_id"],
    name: vehicleModelNameValues.map[json["name"]],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_type_id": vehicleTypeId,
    "name": vehicleModelNameValues.reverse[name],
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum VehicleModelName {
  HONDA,
  TWO_WHEELER
}

final vehicleModelNameValues = EnumValues({
  "Honda": VehicleModelName.HONDA,
  "Two Wheeler": VehicleModelName.TWO_WHEELER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}




































//
//
// // To parse this JSON data, do
// //
// //     final allOrdersModel = allOrdersModelFromJson(jsonString);
//
// import 'dart:convert';
//
// AllOrdersModel allOrdersModelFromJson(String str) => AllOrdersModel.fromJson(json.decode(str));
//
// String allOrdersModelToJson(AllOrdersModel data) => json.encode(data.toJson());
//
//   class AllOrdersModel {
//   bool? status;
//   String? message;
//   List<OrderTypeList>? orderTypeList;
//
//   AllOrdersModel({
//     this.status,
//     this.message,
//     this.orderTypeList,
//   });
//
//   factory AllOrdersModel.fromJson(Map<String, dynamic> json) => AllOrdersModel(
//     status: json["status"],
//     message: json["message"],
//     orderTypeList: json["data"] == null ? [] : List<OrderTypeList>.from(json["data"]!.map((x) => OrderTypeList.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": orderTypeList == null ? [] : List<dynamic>.from(orderTypeList!.map((x) => x.toJson())),
//   };
// }
//
// class OrderTypeList {
//   int? id;
//   String? name;
//   List<Booking>? bookings;
//
//   OrderTypeList({
//     this.id,
//     this.name,
//     this.bookings,
//   });
//
//   factory OrderTypeList.fromJson(Map<String, dynamic> json) => OrderTypeList(
//     id: json["id"],
//     name: json["name"],
//     bookings: json["bookings"] == null ? [] : List<Booking>.from(json["bookings"]!.map((x) => Booking.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "bookings": bookings == null ? [] : List<dynamic>.from(bookings!.map((x) => x.toJson())),
//   };
// }
//
// class Booking {
//   dynamic id;
//   String? categoryId;
//   String? userId;
//   String? sellerId;
//   String? serviceName;
//   String? serviceType;
//   int? quantity;
//   Vehicle? vehicleType;
//   Vehicle? vehicleModel;
//   String? productId;
//   String? tyreSize;
//   String? timeSlotId;
//   DateTime? date;
//   String? notes;
//   String? service;
//   String? shippingAddressId;
//   String? billingSameAsShipping;
//   String? billingAddressId;
//   String? subtotal;
//   String? discount;
//   String? coupanDiscount;
//   String? serviceCharges;
//   String? total;
//   String? isPaid;
//   String? paymentMethod;
//   String? invoiceId;
//   String? otp;
//   dynamic deliveryManId;
//   dynamic transactionId;
//   String? status;
//   String? poc;
//   dynamic deliveryChalan;
//   String? remarks;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   Category? category;
//   Product? product;
//   Customer? customer;
//   Seller? seller;
//   TimeSlot? timeSlot;
//   IngAddress? shippingAddress;
//   IngAddress? billingAddress;
//   String? vehicleNumber;
//   String? name;
//   String? email;
//   String? mobile;
//   String? statusText;
//
//   Booking({
//     this.id,
//     this.categoryId,
//     this.userId,
//     this.sellerId,
//     this.serviceName,
//     this.serviceType,
//     this.quantity,
//     this.vehicleType,
//     this.vehicleModel,
//     this.productId,
//     this.tyreSize,
//     this.timeSlotId,
//     this.date,
//     this.notes,
//     this.service,
//     this.shippingAddressId,
//     this.billingSameAsShipping,
//     this.billingAddressId,
//     this.subtotal,
//     this.discount,
//     this.coupanDiscount,
//     this.serviceCharges,
//     this.total,
//     this.isPaid,
//     this.paymentMethod,
//     this.invoiceId,
//     this.otp,
//     this.deliveryManId,
//     this.transactionId,
//     this.status,
//     this.poc,
//     this.deliveryChalan,
//     this.remarks,
//     this.createdAt,
//     this.updatedAt,
//     this.category,
//     this.product,
//     this.customer,
//     this.seller,
//     this.timeSlot,
//     this.shippingAddress,
//     this.billingAddress,
//     this.vehicleNumber,
//     this.name,
//     this.email,
//     this.mobile,
//     this.statusText,
//   });
//
//   factory Booking.fromJson(Map<String, dynamic> json) => Booking(
//     id: json["id"],
//     categoryId: json["category_id"],
//     userId: json["user_id"],
//     sellerId: json["seller_id"],
//     serviceName: json["service_name"],
//     serviceType: json["service_type"],
//     quantity: json["quantity"],
//     vehicleType: json["vehicle_type"] == null ? null : Vehicle.fromJson(json["vehicle_type"]),
//     vehicleModel: json["vehicle_model"] == null ? null : Vehicle.fromJson(json["vehicle_model"]),
//     productId: json["product_id"],
//     tyreSize: json["tyre_size"],
//     timeSlotId: json["time_slot_id"],
//     date: json["date"] == null ? null : DateTime.parse(json["date"]),
//     notes: json["notes"],
//     service: json["service"],
//     shippingAddressId: json["shipping_address_id"],
//     billingSameAsShipping: json["billing_same_as_shipping"],
//     billingAddressId: json["billing_address_id"],
//     subtotal: json["subtotal"],
//     discount: json["discount"],
//     coupanDiscount: json["coupan_discount"],
//     serviceCharges: json["service_charges"],
//     total: json["total"],
//     isPaid: json["is_paid"],
//     paymentMethod: json["payment_method"],
//     invoiceId: json["invoice_id"],
//     otp: json["otp"],
//     deliveryManId: json["delivery_man_id"],
//     transactionId: json["transaction_id"],
//     status: json["status"],
//     poc: json["poc"],
//     deliveryChalan: json["delivery_chalan"],
//     remarks: json["remarks"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     category: json["category"] == null ? null : Category.fromJson(json["category"]),
//     product: json["product"] == null ? null : Product.fromJson(json["product"]),
//     customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
//     seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
//     timeSlot: json["time_slot"] == null ? null : TimeSlot.fromJson(json["time_slot"]),
//     shippingAddress: json["shipping_address"] == null ? null : IngAddress.fromJson(json["shipping_address"]),
//     billingAddress: json["billing_address"] == null ? null : IngAddress.fromJson(json["billing_address"]),
//     vehicleNumber: json["vehicle_number"],
//     name: json["name"],
//     email: json["email"],
//     mobile: json["mobile"],
//     statusText: json["status_text"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "category_id": categoryId,
//     "user_id": userId,
//     "seller_id": sellerId,
//     "service_name": serviceName,
//     "service_type": serviceType,
//     "quantity": quantity,
//     "vehicle_type": vehicleType?.toJson(),
//     "vehicle_model": vehicleModel?.toJson(),
//     "product_id": productId,
//     "tyre_size": tyreSize,
//     "time_slot_id": timeSlotId,
//     "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
//     "notes": notes,
//     "service": service,
//     "shipping_address_id": shippingAddressId,
//     "billing_same_as_shipping": billingSameAsShipping,
//     "billing_address_id": billingAddressId,
//     "subtotal": subtotal,
//     "discount": discount,
//     "coupan_discount": coupanDiscount,
//     "service_charges": serviceCharges,
//     "total": total,
//     "is_paid": isPaid,
//     "payment_method": paymentMethod,
//     "invoice_id": invoiceId,
//     "otp": otp,
//     "delivery_man_id": deliveryManId,
//     "transaction_id": transactionId,
//     "status": status,
//     "poc": poc,
//     "delivery_chalan": deliveryChalan,
//     "remarks": remarks,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "category": category?.toJson(),
//     "product": product?.toJson(),
//     "customer": customer?.toJson(),
//     "seller": seller?.toJson(),
//     "time_slot": timeSlot?.toJson(),
//     "shipping_address": shippingAddress?.toJson(),
//     "billing_address": billingAddress?.toJson(),
//     "vehicle_number": vehicleNumber,
//     "name": name,
//     "email": email,
//     "mobile": mobile,
//     "status_text": statusText,
//   };
// }
//
// class IngAddress {
//   int? id;
//   String? customerId;
//   bool? isGuest;
//   ContactPersonName? contactPersonName;
//   String? email;
//   AddressType? addressType;
//   String? address;
//   Building? building;
//   Building? landmark;
//   City? city;
//   String? zip;
//   String? phone;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   State? state;
//   Country? country;
//   String? latitude;
//   String? longitude;
//   bool? isBilling;
//
//   IngAddress({
//     this.id,
//     this.customerId,
//     this.isGuest,
//     this.contactPersonName,
//     this.email,
//     this.addressType,
//     this.address,
//     this.building,
//     this.landmark,
//     this.city,
//     this.zip,
//     this.phone,
//     this.createdAt,
//     this.updatedAt,
//     this.state,
//     this.country,
//     this.latitude,
//     this.longitude,
//     this.isBilling,
//   });
//
//   factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
//     id: json["id"],
//     customerId: json["customer_id"],
//     isGuest: json["is_guest"],
//     contactPersonName: contactPersonNameValues.map[json["contact_person_name"]]!,
//     email: json["email"],
//     addressType: addressTypeValues.map[json["address_type"]]!,
//     address: json["address"],
//     building: buildingValues.map[json["building"]]!,
//     landmark: buildingValues.map[json["landmark"]]!,
//     city: cityValues.map[json["city"]]!,
//     zip: json["zip"],
//     phone: json["phone"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     state: stateValues.map[json["state"]]!,
//     country: countryValues.map[json["country"]]!,
//     latitude: json["latitude"],
//     longitude: json["longitude"],
//     isBilling: json["is_billing"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "customer_id": customerId,
//     "is_guest": isGuest,
//     "contact_person_name": contactPersonNameValues.reverse[contactPersonName],
//     "email": email,
//     "address_type": addressTypeValues.reverse[addressType],
//     "address": address,
//     "building": buildingValues.reverse[building],
//     "landmark": buildingValues.reverse[landmark],
//     "city": cityValues.reverse[city],
//     "zip": zip,
//     "phone": phone,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "state": stateValues.reverse[state],
//     "country": countryValues.reverse[country],
//     "latitude": latitude,
//     "longitude": longitude,
//     "is_billing": isBilling,
//   };
// }
//
// enum AddressType {
//   HOME
// }
//
// final addressTypeValues = EnumValues({
//   "Home": AddressType.HOME
// });
//
// enum Building {
//   RAU
// }
//
// final buildingValues = EnumValues({
//   "rau": Building.RAU
// });
//
// enum City {
//   INDORE
// }
//
// final cityValues = EnumValues({
//   "indore": City.INDORE
// });
//
// enum ContactPersonName {
//   DEEPAK_BARIA
// }
//
// final contactPersonNameValues = EnumValues({
//   "Deepak baria": ContactPersonName.DEEPAK_BARIA
// });
//
// enum Country {
//   INDIA
// }
//
// final countryValues = EnumValues({
//   "india": Country.INDIA
// });
//
// enum State {
//   M_P
// }
//
// final stateValues = EnumValues({
//   "m.p": State.M_P
// });
//
// class Category {
//   int? id;
//   String? name;
//   String? slug;
//   String? icon;
//   int? parentId;
//   int? position;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? homeStatus;
//   int? priority;
//   String? type;
//   int? isFuel;
//   List<dynamic>? translations;
//
//   Category({
//     this.id,
//     this.name,
//     this.slug,
//     this.icon,
//     this.parentId,
//     this.position,
//     this.createdAt,
//     this.updatedAt,
//     this.homeStatus,
//     this.priority,
//     this.type,
//     this.isFuel,
//     this.translations,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     id: json["id"],
//     name: json["name"],
//     slug: json["slug"],
//     icon: json["icon"],
//     parentId: json["parent_id"],
//     position: json["position"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     homeStatus: json["home_status"],
//     priority: json["priority"],
//     type: json["type"],
//     isFuel: json["is_fuel"],
//     translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "slug": slug,
//     "icon": icon,
//     "parent_id": parentId,
//     "position": position,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "home_status": homeStatus,
//     "priority": priority,
//     "type": type,
//     "is_fuel": isFuel,
//     "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
//   };
// }
//
// class Customer {
//   int? id;
//   String? name;
//   String? fName;
//   String? lName;
//   String? phone;
//   String? image;
//   String? email;
//   dynamic emailVerifiedAt;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic streetAddress;
//   dynamic country;
//   dynamic city;
//   dynamic zip;
//   dynamic houseNo;
//   dynamic apartmentNo;
//   dynamic cmFirebaseToken;
//   bool? isActive;
//   dynamic paymentCardLastFour;
//   dynamic paymentCardBrand;
//   dynamic paymentCardFawryToken;
//   dynamic loginMedium;
//   dynamic socialId;
//   bool? isPhoneVerified;
//   String? temporaryToken;
//   bool? isEmailVerified;
//   int? walletBalance;
//   int? loyaltyPoint;
//   int? loginHitCount;
//   bool? isTempBlocked;
//   dynamic tempBlockTime;
//   String? referralCode;
//   dynamic referredBy;
//   String? appLanguage;
//   String? address;
//   String? pan;
//   String? msme;
//   String? profile;
//   String? gst;
//   String? walletId;
//
//   Customer({
//     this.id,
//     this.name,
//     this.fName,
//     this.lName,
//     this.phone,
//     this.image,
//     this.email,
//     this.emailVerifiedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.streetAddress,
//     this.country,
//     this.city,
//     this.zip,
//     this.houseNo,
//     this.apartmentNo,
//     this.cmFirebaseToken,
//     this.isActive,
//     this.paymentCardLastFour,
//     this.paymentCardBrand,
//     this.paymentCardFawryToken,
//     this.loginMedium,
//     this.socialId,
//     this.isPhoneVerified,
//     this.temporaryToken,
//     this.isEmailVerified,
//     this.walletBalance,
//     this.loyaltyPoint,
//     this.loginHitCount,
//     this.isTempBlocked,
//     this.tempBlockTime,
//     this.referralCode,
//     this.referredBy,
//     this.appLanguage,
//     this.address,
//     this.pan,
//     this.msme,
//     this.profile,
//     this.gst,
//     this.walletId,
//   });
//
//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//     id: json["id"],
//     name: json["name"],
//     fName: json["f_name"],
//     lName: json["l_name"],
//     phone: json["phone"],
//     image: json["image"],
//     email: json["email"],
//     emailVerifiedAt: json["email_verified_at"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     streetAddress: json["street_address"],
//     country: json["country"],
//     city: json["city"],
//     zip: json["zip"],
//     houseNo: json["house_no"],
//     apartmentNo: json["apartment_no"],
//     cmFirebaseToken: json["cm_firebase_token"],
//     isActive: json["is_active"],
//     paymentCardLastFour: json["payment_card_last_four"],
//     paymentCardBrand: json["payment_card_brand"],
//     paymentCardFawryToken: json["payment_card_fawry_token"],
//     loginMedium: json["login_medium"],
//     socialId: json["social_id"],
//     isPhoneVerified: json["is_phone_verified"],
//     temporaryToken: json["temporary_token"],
//     isEmailVerified: json["is_email_verified"],
//     walletBalance: json["wallet_balance"],
//     loyaltyPoint: json["loyalty_point"],
//     loginHitCount: json["login_hit_count"],
//     isTempBlocked: json["is_temp_blocked"],
//     tempBlockTime: json["temp_block_time"],
//     referralCode: json["referral_code"],
//     referredBy: json["referred_by"],
//     appLanguage: json["app_language"],
//     address: json["address"],
//     pan: json["pan"],
//     msme: json["msme"],
//     profile: json["profile"],
//     gst: json["gst"],
//     walletId: json["wallet_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "f_name": fName,
//     "l_name": lName,
//     "phone": phone,
//     "image": image,
//     "email": email,
//     "email_verified_at": emailVerifiedAt,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "street_address": streetAddress,
//     "country": country,
//     "city": city,
//     "zip": zip,
//     "house_no": houseNo,
//     "apartment_no": apartmentNo,
//     "cm_firebase_token": cmFirebaseToken,
//     "is_active": isActive,
//     "payment_card_last_four": paymentCardLastFour,
//     "payment_card_brand": paymentCardBrand,
//     "payment_card_fawry_token": paymentCardFawryToken,
//     "login_medium": loginMedium,
//     "social_id": socialId,
//     "is_phone_verified": isPhoneVerified,
//     "temporary_token": temporaryToken,
//     "is_email_verified": isEmailVerified,
//     "wallet_balance": walletBalance,
//     "loyalty_point": loyaltyPoint,
//     "login_hit_count": loginHitCount,
//     "is_temp_blocked": isTempBlocked,
//     "temp_block_time": tempBlockTime,
//     "referral_code": referralCode,
//     "referred_by": referredBy,
//     "app_language": appLanguage,
//     "address": address,
//     "pan": pan,
//     "msme": msme,
//     "profile": profile,
//     "gst": gst,
//     "wallet_id": walletId,
//   };
// }
//
// class Product {
//   int? id;
//   String? addedBy;
//   int? userId;
//   String? name;
//   String? slug;
//   String? productType;
//   List<CategoryId>? categoryIds;
//   int? categoryId;
//   dynamic subCategoryId;
//   dynamic subSubCategoryId;
//   dynamic brandId;
//   String? unit;
//   int? minQty;
//   int? refundable;
//   dynamic digitalProductType;
//   String? digitalFileReady;
//   List<String>? images;
//   String? colorImage;
//   String? thumbnail;
//   dynamic featured;
//   dynamic flashDeal;
//   String? videoProvider;
//   dynamic videoUrl;
//   String? colors;
//   int? variantProduct;
//   String? attributes;
//   String? choiceOptions;
//   String? variation;
//   int? published;
//   int? unitPrice;
//   int? purchasePrice;
//   int? tax;
//   String? taxType;
//   String? taxModel;
//   int? discount;
//   String? discountType;
//   int? currentStock;
//   int? minimumOrderQty;
//   String? details;
//   int? freeShipping;
//   dynamic attachment;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? status;
//   int? featuredStatus;
//   dynamic metaTitle;
//   dynamic metaDescription;
//   dynamic metaImage;
//   int? requestStatus;
//   dynamic deniedNote;
//   int? shippingCost;
//   int? multiplyQty;
//   dynamic tempShippingCost;
//   dynamic isShippingCostUpdated;
//   String? code;
//   List<dynamic>? translations;
//   List<dynamic>? reviews;
//
//   Product({
//     this.id,
//     this.addedBy,
//     this.userId,
//     this.name,
//     this.slug,
//     this.productType,
//     this.categoryIds,
//     this.categoryId,
//     this.subCategoryId,
//     this.subSubCategoryId,
//     this.brandId,
//     this.unit,
//     this.minQty,
//     this.refundable,
//     this.digitalProductType,
//     this.digitalFileReady,
//     this.images,
//     this.colorImage,
//     this.thumbnail,
//     this.featured,
//     this.flashDeal,
//     this.videoProvider,
//     this.videoUrl,
//     this.colors,
//     this.variantProduct,
//     this.attributes,
//     this.choiceOptions,
//     this.variation,
//     this.published,
//     this.unitPrice,
//     this.purchasePrice,
//     this.tax,
//     this.taxType,
//     this.taxModel,
//     this.discount,
//     this.discountType,
//     this.currentStock,
//     this.minimumOrderQty,
//     this.details,
//     this.freeShipping,
//     this.attachment,
//     this.createdAt,
//     this.updatedAt,
//     this.status,
//     this.featuredStatus,
//     this.metaTitle,
//     this.metaDescription,
//     this.metaImage,
//     this.requestStatus,
//     this.deniedNote,
//     this.shippingCost,
//     this.multiplyQty,
//     this.tempShippingCost,
//     this.isShippingCostUpdated,
//     this.code,
//     this.translations,
//     this.reviews,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["id"],
//     addedBy: json["added_by"],
//     userId: json["user_id"],
//     name: json["name"],
//     slug: json["slug"],
//     productType: json["product_type"],
//     categoryIds: json["category_ids"] == null ? [] : List<CategoryId>.from(json["category_ids"]!.map((x) => CategoryId.fromJson(x))),
//     categoryId: json["category_id"],
//     subCategoryId: json["sub_category_id"],
//     subSubCategoryId: json["sub_sub_category_id"],
//     brandId: json["brand_id"],
//     unit: json["unit"],
//     minQty: json["min_qty"],
//     refundable: json["refundable"],
//     digitalProductType: json["digital_product_type"],
//     digitalFileReady: json["digital_file_ready"],
//     images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
//     colorImage: json["color_image"],
//     thumbnail: json["thumbnail"],
//     featured: json["featured"],
//     flashDeal: json["flash_deal"],
//     videoProvider: json["video_provider"],
//     videoUrl: json["video_url"],
//     colors: json["colors"],
//     variantProduct: json["variant_product"],
//     attributes: json["attributes"],
//     choiceOptions: json["choice_options"],
//     variation: json["variation"],
//     published: json["published"],
//     unitPrice: json["unit_price"],
//     purchasePrice: json["purchase_price"],
//     tax: json["tax"],
//     taxType: json["tax_type"],
//     taxModel: json["tax_model"],
//     discount: json["discount"],
//     discountType: json["discount_type"],
//     currentStock: json["current_stock"],
//     minimumOrderQty: json["minimum_order_qty"],
//     details: json["details"],
//     freeShipping: json["free_shipping"],
//     attachment: json["attachment"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     status: json["status"],
//     featuredStatus: json["featured_status"],
//     metaTitle: json["meta_title"],
//     metaDescription: json["meta_description"],
//     metaImage: json["meta_image"],
//     requestStatus: json["request_status"],
//     deniedNote: json["denied_note"],
//     shippingCost: json["shipping_cost"],
//     multiplyQty: json["multiply_qty"],
//     tempShippingCost: json["temp_shipping_cost"],
//     isShippingCostUpdated: json["is_shipping_cost_updated"],
//     code: json["code"],
//     translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
//     reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "added_by": addedBy,
//     "user_id": userId,
//     "name": name,
//     "slug": slug,
//     "product_type": productType,
//     "category_ids": categoryIds == null ? [] : List<dynamic>.from(categoryIds!.map((x) => x.toJson())),
//     "category_id": categoryId,
//     "sub_category_id": subCategoryId,
//     "sub_sub_category_id": subSubCategoryId,
//     "brand_id": brandId,
//     "unit": unit,
//     "min_qty": minQty,
//     "refundable": refundable,
//     "digital_product_type": digitalProductType,
//     "digital_file_ready": digitalFileReady,
//     "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
//     "color_image": colorImage,
//     "thumbnail": thumbnail,
//     "featured": featured,
//     "flash_deal": flashDeal,
//     "video_provider": videoProvider,
//     "video_url": videoUrl,
//     "colors": colors,
//     "variant_product": variantProduct,
//     "attributes": attributes,
//     "choice_options": choiceOptions,
//     "variation": variation,
//     "published": published,
//     "unit_price": unitPrice,
//     "purchase_price": purchasePrice,
//     "tax": tax,
//     "tax_type": taxType,
//     "tax_model": taxModel,
//     "discount": discount,
//     "discount_type": discountType,
//     "current_stock": currentStock,
//     "minimum_order_qty": minimumOrderQty,
//     "details": details,
//     "free_shipping": freeShipping,
//     "attachment": attachment,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "status": status,
//     "featured_status": featuredStatus,
//     "meta_title": metaTitle,
//     "meta_description": metaDescription,
//     "meta_image": metaImage,
//     "request_status": requestStatus,
//     "denied_note": deniedNote,
//     "shipping_cost": shippingCost,
//     "multiply_qty": multiplyQty,
//     "temp_shipping_cost": tempShippingCost,
//     "is_shipping_cost_updated": isShippingCostUpdated,
//     "code": code,
//     "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
//     "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
//   };
// }
//
// class CategoryId {
//   String? id;
//   int? position;
//
//   CategoryId({
//     this.id,
//     this.position,
//   });
//
//   factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
//     id: json["id"],
//     position: json["position"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "position": position,
//   };
// }
//
// class Seller {
//   int? id;
//   String? fName;
//   dynamic lName;
//   String? phone;
//   String? image;
//   String? email;
//   String? password;
//   String? status;
//   dynamic rememberToken;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic bankName;
//   dynamic branch;
//   dynamic accountNo;
//   dynamic holderName;
//   String? authToken;
//   dynamic salesCommissionPercentage;
//   String? gst;
//   String? pan;
//   dynamic cmFirebaseToken;
//   int? posStatus;
//   int? minimumOrderAmount;
//   int? freeDeliveryStatus;
//   int? freeDeliveryOverAmount;
//   String? appLanguage;
//   int? wallet;
//
//   Seller({
//     this.id,
//     this.fName,
//     this.lName,
//     this.phone,
//     this.image,
//     this.email,
//     this.password,
//     this.status,
//     this.rememberToken,
//     this.createdAt,
//     this.updatedAt,
//     this.bankName,
//     this.branch,
//     this.accountNo,
//     this.holderName,
//     this.authToken,
//     this.salesCommissionPercentage,
//     this.gst,
//     this.pan,
//     this.cmFirebaseToken,
//     this.posStatus,
//     this.minimumOrderAmount,
//     this.freeDeliveryStatus,
//     this.freeDeliveryOverAmount,
//     this.appLanguage,
//     this.wallet,
//   });
//
//   factory Seller.fromJson(Map<String, dynamic> json) => Seller(
//     id: json["id"],
//     fName: json["f_name"],
//     lName: json["l_name"],
//     phone: json["phone"],
//     image: json["image"],
//     email: json["email"],
//     password: json["password"],
//     status: json["status"],
//     rememberToken: json["remember_token"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     bankName: json["bank_name"],
//     branch: json["branch"],
//     accountNo: json["account_no"],
//     holderName: json["holder_name"],
//     authToken: json["auth_token"],
//     salesCommissionPercentage: json["sales_commission_percentage"],
//     gst: json["gst"],
//     pan: json["pan"],
//     cmFirebaseToken: json["cm_firebase_token"],
//     posStatus: json["pos_status"],
//     minimumOrderAmount: json["minimum_order_amount"],
//     freeDeliveryStatus: json["free_delivery_status"],
//     freeDeliveryOverAmount: json["free_delivery_over_amount"],
//     appLanguage: json["app_language"],
//     wallet: json["wallet"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "f_name": fName,
//     "l_name": lName,
//     "phone": phone,
//     "image": image,
//     "email": email,
//     "password": password,
//     "status": status,
//     "remember_token": rememberToken,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "bank_name": bankName,
//     "branch": branch,
//     "account_no": accountNo,
//     "holder_name": holderName,
//     "auth_token": authToken,
//     "sales_commission_percentage": salesCommissionPercentage,
//     "gst": gst,
//     "pan": pan,
//     "cm_firebase_token": cmFirebaseToken,
//     "pos_status": posStatus,
//     "minimum_order_amount": minimumOrderAmount,
//     "free_delivery_status": freeDeliveryStatus,
//     "free_delivery_over_amount": freeDeliveryOverAmount,
//     "app_language": appLanguage,
//     "wallet": wallet,
//   };
// }
//
// class TimeSlot {
//   int? id;
//   String? title;
//   String? fromTime;
//   String? toTime;
//   int? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   TimeSlot({
//     this.id,
//     this.title,
//     this.fromTime,
//     this.toTime,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
//     id: json["id"],
//     title: json["title"],
//     fromTime: json["from_time"],
//     toTime: json["to_time"],
//     status: json["status"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "from_time": fromTime,
//     "to_time": toTime,
//     "status": status,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//   };
// }
//
// class Vehicle {
//   int? id;
//   int? vehicleTypeId;
//   String? name;
//   int? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   Vehicle({
//     this.id,
//     this.vehicleTypeId,
//     this.name,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
//     id: json["id"],
//     vehicleTypeId: json["vehicle_type_id"],
//     name: json["name"],
//     status: json["status"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "vehicle_type_id": vehicleTypeId,
//     "name": name,
//     "status": status,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
class Insurance {
  int? id;
  String? userId;
  String? vehicleNumber;
  String? name;
  String? email;
  String? mobile;
  String? status;
  String? remark;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? statusText;

  Insurance({
    this.id,
    this.userId,
    this.vehicleNumber,
    this.name,
    this.email,
    this.mobile,
    this.status,
    this.remark,
    this.createdAt,
    this.updatedAt,
    this.statusText,
  });

  factory Insurance.fromJson(Map<String, dynamic> json) => Insurance(
    id: json["id"],
    userId: json["user_id"],
    vehicleNumber: json["vehicle_number"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    status: json["status"],
    remark: json["remark"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    statusText: json["status_text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "vehicle_number": vehicleNumber,
    "name": name,
    "email": email,
    "mobile": mobile,
    "status": status,
    "remark": remark,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "status_text": statusText,
  };
}