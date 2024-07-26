class GenSetCheckOutModel {
  bool? status;
  String? message;
  String? subtotal;
  String? tax;
  String? deliveryCharge;
  String? total;
  List<Data>? data;
  Address? address;
  Category? category;

  GenSetCheckOutModel(
      {this.status,
      this.message,
      this.subtotal,
      this.tax,
      this.deliveryCharge,
      this.total,
      this.data,
      this.address,
      this.category});

  GenSetCheckOutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    subtotal = json['subtotal'];
    tax = json['tax'];
    deliveryCharge = json['delivery_charge'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['subtotal'] = this.subtotal;
    data['tax'] = this.tax;
    data['delivery_charge'] = this.deliveryCharge;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? customerId;
  String? cartGroupId;
  int? productId;
  String? productType;
  String? digitalProductType;
  String? color;
  // List<Null>? choices;
  // List<Null>? variations;
  String? variant;
  int? quantity;
  int? price;
  int? tax;
  int? discount;
  String? taxModel;
  String? slug;
  String? name;
  String? thumbnail;
  int? sellerId;
  String? sellerIs;
  String? createdAt;
  String? updatedAt;
  String? shopInfo;
  int? shippingCost;
  String? shippingType;
  int? isGuest;
  int? isProductAvailable;
  int? minimumOrderAmountInfo;
  FreeDeliveryOrderAmount? freeDeliveryOrderAmount;
  Product? product;
  Shop? shop;

  Data(
      {this.id,
      this.customerId,
      this.cartGroupId,
      this.productId,
      this.productType,
      this.digitalProductType,
      this.color,
      // this.choices,
      // this.variations,
      this.variant,
      this.quantity,
      this.price,
      this.tax,
      this.discount,
      this.taxModel,
      this.slug,
      this.name,
      this.thumbnail,
      this.sellerId,
      this.sellerIs,
      this.createdAt,
      this.updatedAt,
      this.shopInfo,
      this.shippingCost,
      this.shippingType,
      this.isGuest,
      this.isProductAvailable,
      this.minimumOrderAmountInfo,
      this.freeDeliveryOrderAmount,
      this.product,
      this.shop});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    cartGroupId = json['cart_group_id'];
    productId = json['product_id'];
    productType = json['product_type'];
    digitalProductType = json['digital_product_type'];
    color = json['color'];
    // if (json['choices'] != null) {
    //   choices = <Null>[];
    //   json['choices'].forEach((v) {
    //     choices!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['variations'] != null) {
    //   variations = <Null>[];
    //   json['variations'].forEach((v) {
    //     variations!.add(new Null.fromJson(v));
    //   });
    // }
    variant = json['variant'];
    quantity = json['quantity'];
    price = json['price'];
    tax = json['tax'];
    discount = json['discount'];
    taxModel = json['tax_model'];
    slug = json['slug'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    sellerId = json['seller_id'];
    sellerIs = json['seller_is'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shopInfo = json['shop_info'];
    shippingCost = json['shipping_cost'];
    shippingType = json['shipping_type'];
    isGuest = json['is_guest'];
    isProductAvailable = json['is_product_available'];
    minimumOrderAmountInfo = json['minimum_order_amount_info'];
    freeDeliveryOrderAmount = json['free_delivery_order_amount'] != null
        ? new FreeDeliveryOrderAmount.fromJson(
            json['free_delivery_order_amount'])
        : null;
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['cart_group_id'] = this.cartGroupId;
    data['product_id'] = this.productId;
    data['product_type'] = this.productType;
    data['digital_product_type'] = this.digitalProductType;
    data['color'] = this.color;
    // if (this.choices != null) {
    //   data['choices'] = this.choices!.map((v) => v.toJson()).toList();
    // }
    // if (this.variations != null) {
    //   data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    // }
    data['variant'] = this.variant;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['tax'] = this.tax;
    data['discount'] = this.discount;
    data['tax_model'] = this.taxModel;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['thumbnail'] = this.thumbnail;
    data['seller_id'] = this.sellerId;
    data['seller_is'] = this.sellerIs;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['shop_info'] = this.shopInfo;
    data['shipping_cost'] = this.shippingCost;
    data['shipping_type'] = this.shippingType;
    data['is_guest'] = this.isGuest;
    data['is_product_available'] = this.isProductAvailable;
    data['minimum_order_amount_info'] = this.minimumOrderAmountInfo;
    if (this.freeDeliveryOrderAmount != null) {
      data['free_delivery_order_amount'] =
          this.freeDeliveryOrderAmount!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    return data;
  }
}

class FreeDeliveryOrderAmount {
  int? status;
  int? amount;
  int? percentage;
  int? amountNeed;
  int? shippingCostSaved;
  String? cartId;
  String? responsibility;

  FreeDeliveryOrderAmount(
      {this.status,
      this.amount,
      this.percentage,
      this.amountNeed,
      this.shippingCostSaved,
      this.cartId,
      this.responsibility});

  FreeDeliveryOrderAmount.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    amount = json['amount'];
    percentage = json['percentage'];
    amountNeed = json['amount_need'];
    shippingCostSaved = json['shipping_cost_saved'];
    cartId = json['cart_id'];
    responsibility = json['responsibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['amount'] = this.amount;
    data['percentage'] = this.percentage;
    data['amount_need'] = this.amountNeed;
    data['shipping_cost_saved'] = this.shippingCostSaved;
    data['cart_id'] = this.cartId;
    data['responsibility'] = this.responsibility;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? slug;
  int? currentStock;
  int? minimumOrderQty;
  int? totalCurrentStock;
  // List<Null>? translations;
  // List<Null>? reviews;

  Product({
    this.id,
    this.name,
    this.slug,
    this.currentStock,
    this.minimumOrderQty,
    this.totalCurrentStock,
    // this.translations,
    // this.reviews
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    currentStock = json['current_stock'];
    minimumOrderQty = json['minimum_order_qty'];
    totalCurrentStock = json['total_current_stock'];
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
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['current_stock'] = this.currentStock;
    data['minimum_order_qty'] = this.minimumOrderQty;
    data['total_current_stock'] = this.totalCurrentStock;
    // if (this.translations != null) {
    //   data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    // }
    // if (this.reviews != null) {
    //   data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    // }
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

class Address {
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

  Address(
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

  Address.fromJson(Map<String, dynamic> json) {
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
  // List<Null>? translations;

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
    // this.translations
  });

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
    // if (json['translations'] != null) {
    //   translations = <Null>[];
    //   json['translations'].forEach((v) {
    //     translations!.add(new Null.fromJson(v));
    //   });
    // }
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
    // if (this.translations != null) {
    //   data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
