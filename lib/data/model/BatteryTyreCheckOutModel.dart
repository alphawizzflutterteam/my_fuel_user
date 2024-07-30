class BatteryTyreCheckOutModel {
  bool? status;
  String? message;
  BatteryTyreData? data;

  BatteryTyreCheckOutModel({this.status, this.message, this.data});

  BatteryTyreCheckOutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new BatteryTyreData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BatteryTyreData {
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
  String? subtotal;
  String? discount;
  String? coupanDiscount;
  String? serviceCharges;
  String? total;
  ShippingAddressData? shippingAddressData;
  BillingAddressData? billingAddressData;
  TmeSlotModel? timeSlot;
  Product? product;
  String? vehicleTypeName;
  String? vehicleModelName;
  String? productName;

  BatteryTyreData(
      {this.categoryId,
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
      this.shippingAddressData,
      this.billingAddressData,
      this.timeSlot,
      this.product,
      this.vehicleTypeName,
      this.vehicleModelName,
      this.productName});

  BatteryTyreData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
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
    subtotal = json['subtotal'].toString();
    discount = json['discount'].toString();
    coupanDiscount = json['coupan_discount'].toString();
    serviceCharges = json['service_charges'].toString();
    total = json['total'].toString();
    shippingAddressData = json['shipping_address_data'] != null
        ? new ShippingAddressData.fromJson(json['shipping_address_data'])
        : null;
    billingAddressData = json['billing_address_data'] != null
        ? new BillingAddressData.fromJson(json['billing_address_data'])
        : null;

    timeSlot = json['time_slot'] != null
        ? new TmeSlotModel.fromJson(json['time_slot'])
        : null;
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    vehicleTypeName = json['vehicle_type_name'];
    vehicleModelName = json['vehicle_model_name'];
    productName = json['product_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['seller_id'] = this.sellerId;
    data['vehicle_type'] = this.vehicleType;
    data['vehicle_model'] = this.vehicleModel;
    data['product_id'] = this.productId;
    data['tyre_size'] = this.tyreSize;
    data['time_slot_id'] = this.timeSlotId;
    data['date'] = this.date;
    data['notes'] = this.notes;
    data['service'] = this.service;
    data['shipping_address_id'] = this.shippingAddressId;
    data['billing_same_as_shipping'] = this.billingSameAsShipping;
    data['billing_address_id'] = this.billingAddressId;
    data['subtotal'] = this.subtotal;
    data['discount'] = this.discount;
    data['coupan_discount'] = this.coupanDiscount;
    data['service_charges'] = this.serviceCharges;
    data['total'] = this.total;
    if (this.shippingAddressData != null) {
      data['shipping_address_data'] = this.shippingAddressData!.toJson();
    }
    if (this.billingAddressData != null) {
      data['billing_address_data'] = this.billingAddressData!.toJson();
    }
    if (this.timeSlot != null) {
      data['time_slot'] = this.timeSlot!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['vehicle_type_name'] = this.vehicleTypeName;
    data['vehicle_model_name'] = this.vehicleModelName;
    data['product_name'] = this.productName;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['is_guest'] = this.isGuest;
    data['contact_person_name'] = this.contactPersonName;
    data['email'] = this.email;
    data['address_type'] = this.addressType;
    data['address'] = this.address;
    data['building'] = this.building;
    data['landmark'] = this.landmark;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['state'] = this.state;
    data['country'] = this.country;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_billing'] = this.isBilling;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['is_guest'] = this.isGuest;
    data['contact_person_name'] = this.contactPersonName;
    data['email'] = this.email;
    data['address_type'] = this.addressType;
    data['address'] = this.address;
    data['building'] = this.building;
    data['landmark'] = this.landmark;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['state'] = this.state;
    data['country'] = this.country;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_billing'] = this.isBilling;
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
  String? categoryIds;
  int? categoryId;
  String? subCategoryId;
  String? subSubCategoryId;
  String? brandId;
  String? unit;
  int? minQty;
  int? refundable;
  String? digitalProductType;
  String? digitalFileReady;
  String? images;
  String? colorImage;
  String? thumbnail;
  String? featured;
  String? flashDeal;
  String? videoProvider;
  String? videoUrl;
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
  String? attachment;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? featuredStatus;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  int? requestStatus;
  String? deniedNote;
  int? shippingCost;
  int? multiplyQty;
  String? tempShippingCost;
  String? isShippingCostUpdated;
  String? code;
  // List<Null>? translations;
  // List<Null>? reviews;

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
    // this.translations,
    // this.reviews
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    userId = json['user_id'];
    name = json['name'];
    slug = json['slug'];
    productType = json['product_type'];
    try {
      if (json['category_ids'] != null) {
        categoryIds = json['category_ids'];
      }
    } catch (e) {
      print(e);
    }

    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    subSubCategoryId = json['sub_sub_category_id'];
    brandId = json['brand_id'];
    unit = json['unit'];
    minQty = json['min_qty'];
    refundable = json['refundable'];
    digitalProductType = json['digital_product_type'];
    digitalFileReady = json['digital_file_ready'];
    try {
      images = json['images'];
    } catch (e) {
      print(e);
    }
    colorImage = json['color_image'];
    thumbnail = json['thumbnail'];
    featured = json['featured'];
    flashDeal = json['flash_deal'];
    videoProvider = json['video_provider'];
    videoUrl = json['video_url'];
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
    attachment = json['attachment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    featuredStatus = json['featured_status'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaImage = json['meta_image'];
    requestStatus = json['request_status'];
    deniedNote = json['denied_note'];
    shippingCost = json['shipping_cost'];
    multiplyQty = json['multiply_qty'];
    tempShippingCost = json['temp_shipping_cost'];
    isShippingCostUpdated = json['is_shipping_cost_updated'];
    code = json['code'];
    // if (json['translations'] != null) {
    //   translations = <Null>[];
    //   json['translations'].forEach((v) {
    //     translations!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['reviews'] != null) {
    //   reviews = <Null>[];
    //   json['reviews'].forEach((v) {
    //     reviews!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['added_by'] = this.addedBy;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['product_type'] = this.productType;
    data['category_ids'] = this.categoryIds;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['sub_sub_category_id'] = this.subSubCategoryId;
    data['brand_id'] = this.brandId;
    data['unit'] = this.unit;
    data['min_qty'] = this.minQty;
    data['refundable'] = this.refundable;
    data['digital_product_type'] = this.digitalProductType;
    data['digital_file_ready'] = this.digitalFileReady;
    data['images'] = this.images;
    data['color_image'] = this.colorImage;
    data['thumbnail'] = this.thumbnail;
    data['featured'] = this.featured;
    data['flash_deal'] = this.flashDeal;
    data['video_provider'] = this.videoProvider;
    data['video_url'] = this.videoUrl;
    data['colors'] = this.colors;
    data['variant_product'] = this.variantProduct;
    data['attributes'] = this.attributes;
    data['choice_options'] = this.choiceOptions;
    data['variation'] = this.variation;
    data['published'] = this.published;
    data['unit_price'] = this.unitPrice;
    data['purchase_price'] = this.purchasePrice;
    data['tax'] = this.tax;
    data['tax_type'] = this.taxType;
    data['tax_model'] = this.taxModel;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['current_stock'] = this.currentStock;
    data['minimum_order_qty'] = this.minimumOrderQty;
    data['details'] = this.details;
    data['free_shipping'] = this.freeShipping;
    data['attachment'] = this.attachment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['featured_status'] = this.featuredStatus;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_image'] = this.metaImage;
    data['request_status'] = this.requestStatus;
    data['denied_note'] = this.deniedNote;
    data['shipping_cost'] = this.shippingCost;
    data['multiply_qty'] = this.multiplyQty;
    data['temp_shipping_cost'] = this.tempShippingCost;
    data['is_shipping_cost_updated'] = this.isShippingCostUpdated;
    data['code'] = this.code;
    // if (this.translations != null) {
    //   data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    // }
    // if (this.reviews != null) {
    //   data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class TmeSlotModel {
  int? id;
  String? title;
  String? fromTime;
  String? toTime;
  int? status;
  String? createdAt;
  String? updatedAt;

  TmeSlotModel(
      {this.id,
      this.title,
      this.fromTime,
      this.toTime,
      this.status,
      this.createdAt,
      this.updatedAt});

  TmeSlotModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
