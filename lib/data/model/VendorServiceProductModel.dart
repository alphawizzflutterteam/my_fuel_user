class VendorServiceProductModel {
  bool? status;
  String? message;
  List<SellerData>? data;
  String? slotId;
  // List<Null>? timeSlot;
  String? date;
  String? day;
  String? assetId;
  String? quantity;
  String? shippingAddressId;
  String? billingAddressId;

  VendorServiceProductModel(
      {this.status,
      this.message,
      this.data,
      this.slotId,
      // this.timeSlot,
      this.date,
      this.day,
      this.assetId,
      this.quantity,
      this.shippingAddressId,
      this.billingAddressId});

  VendorServiceProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SellerData>[];
      json['data'].forEach((v) {
        data!.add(new SellerData.fromJson(v));
      });
    }
    slotId = json['slot_id'];

    date = json['date'];
    day = json['day'];
    assetId = json['asset_id'];
    quantity = json['quantity'];
    shippingAddressId = json['shipping_address_id'];
    billingAddressId = json['billing_address_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['slot_id'] = this.slotId;

    data['date'] = this.date;
    data['day'] = this.day;
    data['asset_id'] = this.assetId;
    data['quantity'] = this.quantity;
    data['shipping_address_id'] = this.shippingAddressId;
    data['billing_address_id'] = this.billingAddressId;
    return data;
  }
}

class SellerData {
  int? id;
  String? sellerId;
  String? categoryId;
  String? cost;
  String? emergencyCost;
  String? commission;
  String? paymentDay;
  String? unit;
  String? qty;
  String? type;
  String? status;
  String? isFuel;
  String? createdAt;
  String? updatedAt;
  List<SelectProducts>? products;
  String? unitPrice;
  String? productId;
  Category? category;
  Seller? seller;

  SellerData(
      {this.id,
      this.sellerId,
      this.categoryId,
      this.cost,
      this.emergencyCost,
      this.commission,
      this.paymentDay,
      this.unit,
      this.qty,
      this.type,
      this.status,
      this.isFuel,
      this.createdAt,
      this.updatedAt,
      this.products,
      this.unitPrice,
      this.productId,
      this.category,
      this.seller});

  SellerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'].toString();
    categoryId = json['category_id'].toString();
    cost = json['cost'].toString();
    emergencyCost = json['emergency_cost'].toString();
    commission = json['commission'].toString();
    paymentDay = json['payment_day'].toString();
    unit = json['unit'].toString();
    qty = json['qty'].toString();
    type = json['type'].toString();
    status = json['status'].toString();
    isFuel = json['is_fuel'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    if (json['products'] != null) {
      products = <SelectProducts>[];
      json['products'].forEach((v) {
        products!.add(new SelectProducts.fromJson(v));
      });
    }
    unitPrice = json['unit_price'].toString();
    productId = json['product_id'].toString();
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['category_id'] = this.categoryId;
    data['cost'] = this.cost;
    data['emergency_cost'] = this.emergencyCost;
    data['commission'] = this.commission;
    data['payment_day'] = this.paymentDay;
    data['unit'] = this.unit;
    data['qty'] = this.qty;
    data['type'] = this.type;
    data['status'] = this.status;
    data['is_fuel'] = this.isFuel;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['unit_price'] = this.unitPrice;
    data['product_id'] = this.productId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    return data;
  }
}

class SelectProducts {
  int? id;
  String? addedBy;
  int? userId;
  String? name;
  String? slug;
  String? productType;
  List<CategoryIds>? categoryIds;
  int? categoryId;
  String? subCategoryId;
  String? subSubCategoryId;
  String? brandId;
  String? unit;
  int? minQty;
  int? refundable;
  String? digitalProductType;
  String? digitalFileReady;
  List<String>? images;
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
  List<Null>? translations;
  List<Null>? reviews;

  SelectProducts(
      {this.id,
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
      this.reviews});

  SelectProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    userId = json['user_id'];
    name = json['name'];
    slug = json['slug'];
    productType = json['product_type'];

    try {
      if (json['category_ids'] != null) {
        categoryIds = <CategoryIds>[];
        json['category_ids'].forEach((v) {
          categoryIds!.add(new CategoryIds.fromJson(v));
        });
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
      images = json['images'].cast<String>();
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['added_by'] = this.addedBy;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['product_type'] = this.productType;
    if (this.categoryIds != null) {
      data['category_ids'] = this.categoryIds!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    return data;
  }
}

class Category {
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
  int? isFuel;
  List<Null>? translations;

  Category(
      {this.id,
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
      this.translations});

  Category.fromJson(Map<String, dynamic> json) {
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
    isFuel = json['is_fuel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['parent_id'] = this.parentId;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['home_status'] = this.homeStatus;
    data['priority'] = this.priority;
    data['type'] = this.type;
    data['is_fuel'] = this.isFuel;

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
