class OrderListModel {
  int? totalSize;
  String? limit;
  String? offset;
  List<Orders>? orders;

  OrderListModel({this.totalSize, this.limit, this.offset, this.orders});

  OrderListModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  int? customerId;
  bool? isGuest;
  String? customerType;
  String? paymentStatus;
  String? orderStatus;
  String? paymentMethod;
  String? transactionRef;
  String? paymentBy;
  String? paymentNote;
  int? orderAmount;
  String? adminCommission;
  bool? isPause;
  String? cause;
  String? shippingAddress;
  String? createdAt;
  String? updatedAt;
  int? discountAmount;
  String? discountType;
  String? couponCode;
  String? couponDiscountBearer;
  String? shippingResponsibility;
  int? shippingMethodId;
  int? shippingCost;
  bool? isShippingFree;
  String? orderGroupId;
  String? verificationCode;
  bool? verificationStatus;
  int? sellerId;
  String? sellerIs;
  String? shippingAddressData;
  String? deliveryManId;
  int? deliverymanCharge;
  String? expectedDeliveryDate;
  String? orderNote;
  int? billingAddress;
  BillingAddressData? billingAddressData;
  String? orderType;
  int? extraDiscount;
  String? extraDiscountType;
  String? freeDeliveryBearer;
  bool? checked;
  String? shippingType;
  String? deliveryType;
  String? deliveryServiceName;
  String? thirdPartyDeliveryTrackingId;
  String? orderDetailsCount;
  List<Details>? details;
  String? deliveryMan;
  Seller? seller;

  Orders(
      {this.id,
      this.customerId,
      this.isGuest,
      this.customerType,
      this.paymentStatus,
      this.orderStatus,
      this.paymentMethod,
      this.transactionRef,
      this.paymentBy,
      this.paymentNote,
      this.orderAmount,
      this.adminCommission,
      this.isPause,
      this.cause,
      this.shippingAddress,
      this.createdAt,
      this.updatedAt,
      this.discountAmount,
      this.discountType,
      this.couponCode,
      this.couponDiscountBearer,
      this.shippingResponsibility,
      this.shippingMethodId,
      this.shippingCost,
      this.isShippingFree,
      this.orderGroupId,
      this.verificationCode,
      this.verificationStatus,
      this.sellerId,
      this.sellerIs,
      this.shippingAddressData,
      this.deliveryManId,
      this.deliverymanCharge,
      this.expectedDeliveryDate,
      this.orderNote,
      this.billingAddress,
      this.billingAddressData,
      this.orderType,
      this.extraDiscount,
      this.extraDiscountType,
      this.freeDeliveryBearer,
      this.checked,
      this.shippingType,
      this.deliveryType,
      this.deliveryServiceName,
      this.thirdPartyDeliveryTrackingId,
      this.orderDetailsCount,
      this.details,
      this.deliveryMan,
      this.seller});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    isGuest = json['is_guest'];
    customerType = json['customer_type'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    paymentMethod = json['payment_method'];
    transactionRef = json['transaction_ref'];
    paymentBy = json['payment_by'];
    paymentNote = json['payment_note'];
    orderAmount = json['order_amount'];
    adminCommission = json['admin_commission'];
    isPause = json['is_pause'];
    cause = json['cause'];
    shippingAddress = json['shipping_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    discountAmount = json['discount_amount'];
    discountType = json['discount_type'];
    couponCode = json['coupon_code'];
    couponDiscountBearer = json['coupon_discount_bearer'];
    shippingResponsibility = json['shipping_responsibility'];
    shippingMethodId = json['shipping_method_id'];
    shippingCost = json['shipping_cost'];
    isShippingFree = json['is_shipping_free'];
    orderGroupId = json['order_group_id'];
    verificationCode = json['verification_code'];
    verificationStatus = json['verification_status'];
    sellerId = json['seller_id'];
    sellerIs = json['seller_is'];
    shippingAddressData = json['shipping_address_data'];
    deliveryManId = json['delivery_man_id'];
    deliverymanCharge = json['deliveryman_charge'];
    expectedDeliveryDate = json['expected_delivery_date'];
    orderNote = json['order_note'];
    billingAddress = json['billing_address'];
    billingAddressData = json['billing_address_data'] != null
        ? new BillingAddressData.fromJson(json['billing_address_data'])
        : null;
    orderType = json['order_type'];
    extraDiscount = json['extra_discount'];
    extraDiscountType = json['extra_discount_type'];
    freeDeliveryBearer = json['free_delivery_bearer'];
    checked = json['checked'];
    shippingType = json['shipping_type'];
    deliveryType = json['delivery_type'];
    deliveryServiceName = json['delivery_service_name'];
    thirdPartyDeliveryTrackingId = json['third_party_delivery_tracking_id'];
    orderDetailsCount = json['order_details_count'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
    deliveryMan = json['delivery_man'];
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['is_guest'] = this.isGuest;
    data['customer_type'] = this.customerType;
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['payment_method'] = this.paymentMethod;
    data['transaction_ref'] = this.transactionRef;
    data['payment_by'] = this.paymentBy;
    data['payment_note'] = this.paymentNote;
    data['order_amount'] = this.orderAmount;
    data['admin_commission'] = this.adminCommission;
    data['is_pause'] = this.isPause;
    data['cause'] = this.cause;
    data['shipping_address'] = this.shippingAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['discount_amount'] = this.discountAmount;
    data['discount_type'] = this.discountType;
    data['coupon_code'] = this.couponCode;
    data['coupon_discount_bearer'] = this.couponDiscountBearer;
    data['shipping_responsibility'] = this.shippingResponsibility;
    data['shipping_method_id'] = this.shippingMethodId;
    data['shipping_cost'] = this.shippingCost;
    data['is_shipping_free'] = this.isShippingFree;
    data['order_group_id'] = this.orderGroupId;
    data['verification_code'] = this.verificationCode;
    data['verification_status'] = this.verificationStatus;
    data['seller_id'] = this.sellerId;
    data['seller_is'] = this.sellerIs;
    data['shipping_address_data'] = this.shippingAddressData;
    data['delivery_man_id'] = this.deliveryManId;
    data['deliveryman_charge'] = this.deliverymanCharge;
    data['expected_delivery_date'] = this.expectedDeliveryDate;
    data['order_note'] = this.orderNote;
    data['billing_address'] = this.billingAddress;
    if (this.billingAddressData != null) {
      data['billing_address_data'] = this.billingAddressData!.toJson();
    }
    data['order_type'] = this.orderType;
    data['extra_discount'] = this.extraDiscount;
    data['extra_discount_type'] = this.extraDiscountType;
    data['free_delivery_bearer'] = this.freeDeliveryBearer;
    data['checked'] = this.checked;
    data['shipping_type'] = this.shippingType;
    data['delivery_type'] = this.deliveryType;
    data['delivery_service_name'] = this.deliveryServiceName;
    data['third_party_delivery_tracking_id'] =
        this.thirdPartyDeliveryTrackingId;
    data['order_details_count'] = this.orderDetailsCount;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    data['delivery_man'] = this.deliveryMan;
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
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

class Details {
  int? id;
  int? orderId;
  int? productId;
  int? sellerId;
  String? digitalFileAfterSell;
  String? productDetails;
  int? qty;
  int? price;
  int? tax;
  int? discount;
  String? taxModel;
  String? deliveryStatus;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  String? shippingMethodId;
  String? variant;
  String? variation;
  String? discountType;
  int? isStockDecreased;
  int? refundRequest;
  Product? product;

  Details(
      {this.id,
      this.orderId,
      this.productId,
      this.sellerId,
      this.digitalFileAfterSell,
      this.productDetails,
      this.qty,
      this.price,
      this.tax,
      this.discount,
      this.taxModel,
      this.deliveryStatus,
      this.paymentStatus,
      this.createdAt,
      this.updatedAt,
      this.shippingMethodId,
      this.variant,
      this.variation,
      this.discountType,
      this.isStockDecreased,
      this.refundRequest,
      this.product});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    sellerId = json['seller_id'];
    digitalFileAfterSell = json['digital_file_after_sell'];
    productDetails = json['product_details'];
    qty = json['qty'];
    price = json['price'];
    tax = json['tax'];
    discount = json['discount'];
    taxModel = json['tax_model'];
    deliveryStatus = json['delivery_status'];
    paymentStatus = json['payment_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shippingMethodId = json['shipping_method_id'];
    variant = json['variant'];
    variation = json['variation'];
    discountType = json['discount_type'];
    isStockDecreased = json['is_stock_decreased'];
    refundRequest = json['refund_request'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['seller_id'] = this.sellerId;
    data['digital_file_after_sell'] = this.digitalFileAfterSell;
    data['product_details'] = this.productDetails;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['tax'] = this.tax;
    data['discount'] = this.discount;
    data['tax_model'] = this.taxModel;
    data['delivery_status'] = this.deliveryStatus;
    data['payment_status'] = this.paymentStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['shipping_method_id'] = this.shippingMethodId;
    data['variant'] = this.variant;
    data['variation'] = this.variation;
    data['discount_type'] = this.discountType;
    data['is_stock_decreased'] = this.isStockDecreased;
    data['refund_request'] = this.refundRequest;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
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
  int? brandId;
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
      categoryIds = json['category_ids'];
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
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['email'] = this.email;
    data['password'] = this.password;
    data['status'] = this.status;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['bank_name'] = this.bankName;
    data['branch'] = this.branch;
    data['account_no'] = this.accountNo;
    data['holder_name'] = this.holderName;
    data['auth_token'] = this.authToken;
    data['sales_commission_percentage'] = this.salesCommissionPercentage;
    data['gst'] = this.gst;
    data['pan'] = this.pan;
    data['cm_firebase_token'] = this.cmFirebaseToken;
    data['pos_status'] = this.posStatus;
    data['minimum_order_amount'] = this.minimumOrderAmount;
    data['free_delivery_status'] = this.freeDeliveryStatus;
    data['free_delivery_over_amount'] = this.freeDeliveryOverAmount;
    data['app_language'] = this.appLanguage;
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
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
  String? offerBanner;
  String? vacationStartDate;
  String? vacationEndDate;
  String? vacationNote;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['contact'] = this.contact;
    data['pincode'] = this.pincode;
    data['image'] = this.image;
    data['bottom_banner'] = this.bottomBanner;
    data['offer_banner'] = this.offerBanner;
    data['vacation_start_date'] = this.vacationStartDate;
    data['vacation_end_date'] = this.vacationEndDate;
    data['vacation_note'] = this.vacationNote;
    data['vacation_status'] = this.vacationStatus;
    data['temporary_close'] = this.temporaryClose;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['banner'] = this.banner;
    return data;
  }
}
