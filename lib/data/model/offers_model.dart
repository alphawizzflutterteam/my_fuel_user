class OffersModel {
  int? totalSize;
  int? limit;
  int? offset;
  List<CouponsData>? coupons;

  OffersModel({this.totalSize, this.limit, this.offset, this.coupons});

  OffersModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['coupons'] != null) {
      coupons = <CouponsData>[];
      json['coupons'].forEach((v) {
        coupons!.add(new CouponsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.coupons != null) {
      data['coupons'] = this.coupons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CouponsData {
  int? id;
  String? addedBy;
  String? couponType;
  String? couponBearer;
  int? sellerId;
  int? customerId;
  String? title;
  String? code;
  String? startDate;
  String? expireDate;
  int? minPurchase;
  int? maxDiscount;
  int? discount;
  String? discountType;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? limit;
  String? plainExpireDate;
  Null? seller;

  CouponsData(
      {this.id,
      this.addedBy,
      this.couponType,
      this.couponBearer,
      this.sellerId,
      this.customerId,
      this.title,
      this.code,
      this.startDate,
      this.expireDate,
      this.minPurchase,
      this.maxDiscount,
      this.discount,
      this.discountType,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.limit,
      this.plainExpireDate,
      this.seller});

  CouponsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    couponType = json['coupon_type'];
    couponBearer = json['coupon_bearer'];
    sellerId = json['seller_id'];
    customerId = json['customer_id'];
    title = json['title'];
    code = json['code'];
    startDate = json['start_date'];
    expireDate = json['expire_date'];
    minPurchase = json['min_purchase'];
    maxDiscount = json['max_discount'];
    discount = json['discount'];
    discountType = json['discount_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    limit = json['limit'];
    plainExpireDate = json['plain_expire_date'];
    seller = json['seller'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['added_by'] = this.addedBy;
    data['coupon_type'] = this.couponType;
    data['coupon_bearer'] = this.couponBearer;
    data['seller_id'] = this.sellerId;
    data['customer_id'] = this.customerId;
    data['title'] = this.title;
    data['code'] = this.code;
    data['start_date'] = this.startDate;
    data['expire_date'] = this.expireDate;
    data['min_purchase'] = this.minPurchase;
    data['max_discount'] = this.maxDiscount;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['limit'] = this.limit;
    data['plain_expire_date'] = this.plainExpireDate;
    data['seller'] = this.seller;
    return data;
  }
}
