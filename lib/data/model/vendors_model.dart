class VendorsModel {
  bool? status;
  String? message;
  List<VendorData>? data;
  String? slotId;
  List<TimeSlot>? timeSlot;
  String? date;
  String? day;
  String? assetId;
  String? quantity;
  String? shippingAddressId;
  String? billingAddressId;

  VendorsModel(
      {this.status,
      this.message,
      this.data,
      this.slotId,
      this.timeSlot,
      this.date,
      this.day,
      this.assetId,
      this.quantity,
      this.shippingAddressId,
      this.billingAddressId});

  VendorsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <VendorData>[];
      json['data'].forEach((v) {
        data!.add(VendorData.fromJson(v));
      });
    }
    slotId = json['slot_id'];
    if (json['time_slot'] != null) {
      timeSlot = <TimeSlot>[];
      json['time_slot'].forEach((v) {
        timeSlot!.add(TimeSlot.fromJson(v));
      });
    }
    date = json['date'];
    day = json['day'];
    assetId = json['asset_id'];
    quantity = json['quantity'];
    shippingAddressId = json['shipping_address_id'];
    billingAddressId = json['billing_address_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['slot_id'] = this.slotId;
    if (this.timeSlot != null) {
      data['time_slot'] = this.timeSlot!.map((v) => v.toJson()).toList();
    }
    data['date'] = this.date;
    data['day'] = this.day;
    data['asset_id'] = this.assetId;
    data['quantity'] = this.quantity;
    data['shipping_address_id'] = this.shippingAddressId;
    data['billing_address_id'] = this.billingAddressId;
    return data;
  }
}

class VendorData {
  int? id;
  int? sellerId;
  int? categoryId;
  int? cost;
  int? emergencyCost;
  int? commission;
  int? paymentDay;
  Null? unit;
  int? qty;
  String? type;
  int? status;
  int? isFuel;
  String? createdAt;
  String? updatedAt;
  Category? category;
  Seller? seller;

  VendorData(
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
      this.category,
      this.seller});

  VendorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    categoryId = json['category_id'];
    cost = json['cost'];
    emergencyCost = json['emergency_cost'];
    commission = json['commission'];
    paymentDay = json['payment_day'];
    unit = json['unit'];
    qty = json['qty'];
    type = json['type'];
    status = json['status'];
    isFuel = json['is_fuel'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
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
  //List<Null>? translations;

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
    /*this.translations*/
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
    //     translations!.add(Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    /* if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }*/
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
  dynamic rememberToken;
  String? createdAt;
  String? updatedAt;
  dynamic bankName;
  dynamic branch;
  dynamic accountNo;
  dynamic holderName;
  String? authToken;
  dynamic salesCommissionPercentage;
  String? gst;
  String? pan;
  dynamic cmFirebaseToken;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  dynamic offerBanner;
  dynamic vacationStartDate;
  dynamic vacationEndDate;
  dynamic vacationNote;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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

class TimeSlot {
  int? id;
  int? sellerId;
  int? slotId;
  String? day;
  int? orders;
  String? createdAt;
  String? updatedAt;
  TimeSlot? timeSlot;

  TimeSlot(
      {this.id,
      this.sellerId,
      this.slotId,
      this.day,
      this.orders,
      this.createdAt,
      this.updatedAt,
      this.timeSlot});

  TimeSlot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    slotId = json['slot_id'];
    day = json['day'];
    orders = json['orders'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    timeSlot =
        json['time_slot'] != null ? TimeSlot.fromJson(json['time_slot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['slot_id'] = this.slotId;
    data['day'] = this.day;
    data['orders'] = this.orders;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.timeSlot != null) {
      data['time_slot'] = this.timeSlot!.toJson();
    }
    return data;
  }
}
