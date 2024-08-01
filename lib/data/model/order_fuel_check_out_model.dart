class OrderFuelCheckOutModel {
  bool? status;
  String? message;
  OrderFuelCheckData? data;

  OrderFuelCheckOutModel({this.status, this.message, this.data});

  OrderFuelCheckOutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? OrderFuelCheckData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OrderFuelCheckData {
  String? categoryId;
  int? userId;
  int? sellerId;
  String? vehicleType;
  String? vehicleModel;
  String? productId;
  String? tyreSize;
  String? timeSlotId;
  String? date;
  String? notes;
  String? service;
  String? shippingAddressId;
  String? billingSameAsShipping;
  String? billingAddressId;
  int? subtotal;
  int? discount;
  int? coupanDiscount;
  int? serviceCharges;
  int? total;
  TimeSlot? timeSlot;
  ShippingAddressData? shippingAddressData;
  BillingAddressData? billingAddressData;
  List<Product>? product;
  String? vehicleTypeName;
  String? vehicleModelName;
  String? productName;
  String? vendorImage;
  String? vendorName;
  String? vendorRating;
  String? vendorDistance;
  String? vendorAddress;

  OrderFuelCheckData({
    this.categoryId,
    this.userId,
    this.sellerId,
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
    this.timeSlot,
    this.shippingAddressData,
    this.billingAddressData,
    this.product,
    this.vehicleTypeName,
    this.vehicleModelName,
    this.productName,
    this.vendorImage,
    this.vendorName,
    this.vendorRating,
    this.vendorDistance,
    this.vendorAddress,
  });

  OrderFuelCheckData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'].toString();
    userId = json['user_id'];
    sellerId = json['seller_id'];
    vehicleType = json['vehicle_type'];
    vehicleModel = json['vehicle_model'];
    productId = json['product_id'];
    tyreSize = json['tyre_size'];
    timeSlotId = json['time_slot_id'];
    date = json['date'];
    notes = json['notes'];
    service = json['service'];
    shippingAddressId = json['shipping_address_id'];
    billingSameAsShipping = json['billing_same_as_shipping'];
    billingAddressId = json['billing_address_id'];
    subtotal = json['subtotal'];
    discount = json['discount'];
    coupanDiscount = json['coupan_discount'];
    serviceCharges = json['service_charges'];
    total = json['total'];
    timeSlot =
        json['time_slot'] != null ? TimeSlot.fromJson(json['time_slot']) : null;
    shippingAddressData = json['shipping_address_data'] != null
        ? ShippingAddressData.fromJson(json['shipping_address_data'])
        : null;
    billingAddressData = json['billing_address_data'] != null
        ? BillingAddressData.fromJson(json['billing_address_data'])
        : null;
    print('_______asdadasd________${json['product']}');
    if (json['product'] != null && json['product'].isNotEmpty) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
    vehicleTypeName = json['vehicle_type_name'];
    vehicleModelName = json['vehicle_model_name'];
    productName = json['product_name'];
    vendorImage = json['vendor_image'];
    vendorName = json['vendor_name'];
    vendorRating = json['vendor_rating'];
    vendorDistance = json['vendor_distance'];
    vendorAddress = json['vendor_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['user_id'] = userId;
    data['seller_id'] = sellerId;
    data['vehicle_type'] = vehicleType;
    data['vehicle_model'] = vehicleModel;
    data['product_id'] = productId;
    data['tyre_size'] = tyreSize;
    data['time_slot_id'] = timeSlotId;
    data['date'] = date;
    data['notes'] = notes;
    data['service'] = service;
    data['shipping_address_id'] = shippingAddressId;
    data['billing_same_as_shipping'] = billingSameAsShipping;
    data['billing_address_id'] = billingAddressId;
    data['subtotal'] = subtotal;
    data['discount'] = discount;
    data['coupan_discount'] = coupanDiscount;
    data['service_charges'] = serviceCharges;
    data['total'] = total;
    if (timeSlot != null) {
      data['time_slot'] = timeSlot!.toJson();
    }
    if (shippingAddressData != null) {
      data['shipping_address_data'] = shippingAddressData!.toJson();
    }
    if (billingAddressData != null) {
      data['billing_address_data'] = billingAddressData!.toJson();
    }
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    data['vehicle_type_name'] = vehicleTypeName;
    data['vehicle_model_name'] = vehicleModelName;
    data['product_name'] = productName;
    return data;
  }
}

class TimeSlot {
  int? id;
  String? title;
  String? fromTime;
  String? toTime;
  int? status;
  String? createdAt;
  String? updatedAt;

  TimeSlot(
      {this.id,
      this.title,
      this.fromTime,
      this.toTime,
      this.status,
      this.createdAt,
      this.updatedAt});

  TimeSlot.fromJson(Map<String, dynamic> json) {
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

class ShippingAddressData {
  int? id;
  String? customerId;
  bool? isGuest;
  String? contactPersonName;
  String? email;
  String? addressType;
  String? address;
  String? building;
  String? landmark;
  String? city;
  String? zip;
  String? phone;
  String? createdAt;
  String? updatedAt;
  String? state;
  String? country;
  String? latitude;
  String? longitude;
  bool? isBilling;

  ShippingAddressData(
      {this.id,
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
      this.isBilling});

  ShippingAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    isGuest = json['is_guest'];
    contactPersonName = json['contact_person_name'];
    email = json['email'];
    addressType = json['address_type'];
    address = json['address'];
    building = json['building'];
    landmark = json['landmark'];
    city = json['city'];
    zip = json['zip'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    state = json['state'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isBilling = json['is_billing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['is_guest'] = isGuest;
    data['contact_person_name'] = contactPersonName;
    data['email'] = email;
    data['address_type'] = addressType;
    data['address'] = address;
    data['building'] = building;
    data['landmark'] = landmark;
    data['city'] = city;
    data['zip'] = zip;
    data['phone'] = phone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['state'] = state;
    data['country'] = country;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['is_billing'] = isBilling;
    return data;
  }
}

class BillingAddressData {
  int? id;
  String? customerId;
  bool? isGuest;
  String? contactPersonName;
  String? email;
  String? addressType;
  String? address;
  String? building;
  String? landmark;
  String? city;
  String? zip;
  String? phone;
  String? createdAt;
  String? updatedAt;
  String? state;
  String? country;
  String? latitude;
  String? longitude;
  bool? isBilling;

  BillingAddressData(
      {this.id,
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
      this.isBilling});

  BillingAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    isGuest = json['is_guest'];
    contactPersonName = json['contact_person_name'];
    email = json['email'];
    addressType = json['address_type'];
    address = json['address'];
    building = json['building'];
    landmark = json['landmark'];
    city = json['city'];
    zip = json['zip'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    state = json['state'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isBilling = json['is_billing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['is_guest'] = isGuest;
    data['contact_person_name'] = contactPersonName;
    data['email'] = email;
    data['address_type'] = addressType;
    data['address'] = address;
    data['building'] = building;
    data['landmark'] = landmark;
    data['city'] = city;
    data['zip'] = zip;
    data['phone'] = phone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['state'] = state;
    data['country'] = country;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['is_billing'] = isBilling;
    return data;
  }
}

class Product {
  int? id;
  String? addedBy;
  int? userId;
  String? name;
  String? slug;
  String? productType;
  List<CategoryIds>? categoryIds;
  int? categoryId;
  // Null? subCategoryId;
  // Null? subSubCategoryId;
  // Null? brandId;
  String? unit;
  int? minQty;
  int? refundable;
  // Null? digitalProductType;
  String? digitalFileReady;
  List<String>? images;
  String? colorImage;
  String? thumbnail;
  //Null? featured;
  //Null? flashDeal;
  String? videoProvider;
  // Null? videoUrl;
  String? colors;
  int? variantProduct;
  String? attributes;
  String? choiceOptions;
  String? variation;
  int? published;
  int? unitPrice;
  int? purchasePrice;
  int? tax;
  String? taxType;
  String? taxModel;
  int? discount;
  String? discountType;
  int? currentStock;
  int? minimumOrderQty;
  String? details;
  int? freeShipping;
  // Null? attachment;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? featuredStatus;
  //Null? metaTitle;
  // Null? metaDescription;
  //Null? metaImage;
  int? requestStatus;
  // Null? deniedNote;
  int? shippingCost;
  int? multiplyQty;
  // Null? tempShippingCost;
  // Null? isShippingCostUpdated;
  String? code;
  Seller? seller;
  List<Null>? translations;
  List<Null>? reviews;

  Product(
      {this.id,
      this.addedBy,
      this.userId,
      this.name,
      this.slug,
      this.productType,
      this.categoryIds,
      this.categoryId,
      // this.subCategoryId,
      // this.subSubCategoryId,
      // this.brandId,
      this.unit,
      this.minQty,
      this.refundable,
      // this.digitalProductType,
      this.digitalFileReady,
      this.images,
      this.colorImage,
      this.thumbnail,
      // this.featured,
      // this.flashDeal,
      this.videoProvider,
      //  this.videoUrl,
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
      // this.attachment,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.featuredStatus,
      // this.metaTitle,
      // this.metaDescription,
      // this.metaImage,
      this.requestStatus,
      // this.deniedNote,
      this.shippingCost,
      this.multiplyQty,
      // this.tempShippingCost,
      // this.isShippingCostUpdated,
      this.code,
      this.seller,
      this.translations,
      this.reviews});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    userId = json['user_id'];
    name = json['name'];
    slug = json['slug'];
    productType = json['product_type'];
    if (json['category_ids'] != null) {
      categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        categoryIds!.add(CategoryIds.fromJson(v));
      });
    }
    categoryId = json['category_id'];
    //subCategoryId = json['sub_category_id'];
    // subSubCategoryId = json['sub_sub_category_id'];
    // brandId = json['brand_id'];
    unit = json['unit'];
    minQty = json['min_qty'];
    refundable = json['refundable'];
    // digitalProductType = json['digital_product_type'];
    digitalFileReady = json['digital_file_ready'];
    images = json['images'].cast<String>();
    colorImage = json['color_image'];
    thumbnail = json['thumbnail'];
    //featured = json['featured'];
    // flashDeal = json['flash_deal'];
    videoProvider = json['video_provider'];
    // videoUrl = json['video_url'];
    colors = json['colors'];
    variantProduct = json['variant_product'];
    attributes = json['attributes'];
    choiceOptions = json['choice_options'];
    variation = json['variation'];
    published = json['published'];
    unitPrice = json['unit_price'];
    purchasePrice = json['purchase_price'];
    tax = json['tax'];
    taxType = json['tax_type'];
    taxModel = json['tax_model'];
    discount = json['discount'];
    discountType = json['discount_type'];
    currentStock = json['current_stock'];
    minimumOrderQty = json['minimum_order_qty'];
    details = json['details'];
    freeShipping = json['free_shipping'];
    // attachment = json['attachment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    featuredStatus = json['featured_status'];
    // metaTitle = json['meta_title'];
    // metaDescription = json['meta_description'];
    // metaImage = json['meta_image'];
    requestStatus = json['request_status'];
    // deniedNote = json['denied_note'];
    shippingCost = json['shipping_cost'];
    multiplyQty = json['multiply_qty'];
    // tempShippingCost = json['temp_shipping_cost'];
    //isShippingCostUpdated = json['is_shipping_cost_updated'];
    code = json['code'];
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    /*if (json['translations'] != null) {
      translations = <Null>[];
      json['translations'].forEach((v) {
        translations!.add(new Null.fromJson(v));
      });
    }*/
    /*if (json['reviews'] != null) {
      reviews = <Null>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['added_by'] = addedBy;
    data['user_id'] = userId;
    data['name'] = name;
    data['slug'] = slug;
    data['product_type'] = productType;
    if (categoryIds != null) {
      data['category_ids'] = categoryIds!.map((v) => v.toJson()).toList();
    }
    data['category_id'] = categoryId;
    //data['sub_category_id'] = this.subCategoryId;
    // data['sub_sub_category_id'] = this.subSubCategoryId;
    // data['brand_id'] = this.brandId;
    data['unit'] = unit;
    data['min_qty'] = minQty;
    data['refundable'] = refundable;
    //data['digital_product_type'] = this.digitalProductType;
    data['digital_file_ready'] = digitalFileReady;
    data['images'] = images;
    data['color_image'] = colorImage;
    data['thumbnail'] = thumbnail;
    // data['featured'] = this.featured;
    //data['flash_deal'] = this.flashDeal;
    data['video_provider'] = videoProvider;
    // data['video_url'] = this.videoUrl;
    data['colors'] = colors;
    data['variant_product'] = variantProduct;
    data['attributes'] = attributes;
    data['choice_options'] = choiceOptions;
    data['variation'] = variation;
    data['published'] = published;
    data['unit_price'] = unitPrice;
    data['purchase_price'] = purchasePrice;
    data['tax'] = tax;
    data['tax_type'] = taxType;
    data['tax_model'] = taxModel;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['current_stock'] = currentStock;
    data['minimum_order_qty'] = minimumOrderQty;
    data['details'] = details;
    data['free_shipping'] = freeShipping;
    //data['attachment'] = this.attachment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['featured_status'] = featuredStatus;
    // data['meta_title'] = this.metaTitle;
    //data['meta_description'] = this.metaDescription;
    //data['meta_image'] = this.metaImage;
    data['request_status'] = requestStatus;
    // data['denied_note'] = this.deniedNote;
    data['shipping_cost'] = shippingCost;
    data['multiply_qty'] = multiplyQty;
    // data['temp_shipping_cost'] = this.tempShippingCost;
    //data['is_shipping_cost_updated'] = this.isShippingCostUpdated;
    //data['code'] = this.code;
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    /*if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class CategoryIds {
  String? id;
  int? position;

  CategoryIds({this.id, this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['position'] = position;
    return data;
  }
}

class Seller {
  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? image;
  String? email;
  String? password;
  String? status;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? bankName;
  String? branch;
  String? accountNo;
  String? holderName;
  String? authToken;
  String? salesCommissionPercentage;
  String? gst;
  String? pan;
  String? cmFirebaseToken;
  int? posStatus;
  int? minimumOrderAmount;
  int? freeDeliveryStatus;
  int? freeDeliveryOverAmount;
  String? appLanguage;
  Shop? shop;

  Seller(
      {this.id,
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
      this.shop});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    image = json['image'];
    email = json['email'];
    password = json['password'];
    status = json['status'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bankName = json['bank_name'];
    branch = json['branch'];
    accountNo = json['account_no'];
    holderName = json['holder_name'];
    authToken = json['auth_token'];
    salesCommissionPercentage = json['sales_commission_percentage'];
    gst = json['gst'];
    pan = json['pan'];
    cmFirebaseToken = json['cm_firebase_token'];
    posStatus = json['pos_status'];
    minimumOrderAmount = json['minimum_order_amount'];
    freeDeliveryStatus = json['free_delivery_status'];
    freeDeliveryOverAmount = json['free_delivery_over_amount'];
    appLanguage = json['app_language'];
    shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['phone'] = phone;
    data['image'] = image;
    data['email'] = email;
    data['password'] = password;
    data['status'] = status;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['bank_name'] = bankName;
    data['branch'] = branch;
    data['account_no'] = accountNo;
    data['holder_name'] = holderName;
    data['auth_token'] = authToken;
    data['sales_commission_percentage'] = salesCommissionPercentage;
    data['gst'] = gst;
    data['pan'] = pan;
    data['cm_firebase_token'] = cmFirebaseToken;
    data['pos_status'] = posStatus;
    data['minimum_order_amount'] = minimumOrderAmount;
    data['free_delivery_status'] = freeDeliveryStatus;
    data['free_delivery_over_amount'] = freeDeliveryOverAmount;
    data['app_language'] = appLanguage;
    if (shop != null) {
      data['shop'] = shop!.toJson();
    }
    return data;
  }
}

class Shop {
  int? id;
  int? sellerId;
  String? name;
  String? slug;
  String? address;
  String? country;
  String? state;
  String? city;
  String? contact;
  String? pincode;
  String? image;
  String? bottomBanner;
  Null? offerBanner;
  Null? vacationStartDate;
  Null? vacationEndDate;
  Null? vacationNote;
  bool? vacationStatus;
  bool? temporaryClose;
  String? createdAt;
  String? updatedAt;
  String? banner;

  Shop(
      {this.id,
      this.sellerId,
      this.name,
      this.slug,
      this.address,
      this.country,
      this.state,
      this.city,
      this.contact,
      this.pincode,
      this.image,
      this.bottomBanner,
      this.offerBanner,
      this.vacationStartDate,
      this.vacationEndDate,
      this.vacationNote,
      this.vacationStatus,
      this.temporaryClose,
      this.createdAt,
      this.updatedAt,
      this.banner});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    name = json['name'];
    slug = json['slug'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    contact = json['contact'];
    pincode = json['pincode'];
    image = json['image'];
    bottomBanner = json['bottom_banner'];
    offerBanner = json['offer_banner'];
    vacationStartDate = json['vacation_start_date'];
    vacationEndDate = json['vacation_end_date'];
    vacationNote = json['vacation_note'];
    vacationStatus = json['vacation_status'];
    temporaryClose = json['temporary_close'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['seller_id'] = sellerId;
    data['name'] = name;
    data['slug'] = slug;
    data['address'] = address;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['contact'] = contact;
    data['pincode'] = pincode;
    data['image'] = image;
    data['bottom_banner'] = bottomBanner;
    data['offer_banner'] = offerBanner;
    data['vacation_start_date'] = vacationStartDate;
    data['vacation_end_date'] = vacationEndDate;
    data['vacation_note'] = vacationNote;
    data['vacation_status'] = vacationStatus;
    data['temporary_close'] = temporaryClose;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['banner'] = banner;
    return data;
  }
}
