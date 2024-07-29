class OtherCategory {
  String? categoryId;
  String? vehicleType;
  String? vehicleModel;
  String? tyreSize;
  String? timeSlotId;
  String? date;
  String? notes;
  String? service;
  String? productId;
  String? shippingAddressId;
  String? billingSameAsShipping;
  String? billingAddressId;

  OtherCategory(
      {this.categoryId,
      this.vehicleType,
      this.vehicleModel,
      this.tyreSize,
      this.timeSlotId,
      this.date,
      this.notes,
      this.service,
      this.productId,
      this.shippingAddressId,
      this.billingSameAsShipping,
      this.billingAddressId});

  OtherCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    vehicleType = json['vehicle_type'];
    vehicleModel = json['vehicle_model'];
    tyreSize = json['tyre_size'];
    timeSlotId = json['time_slot_id'];
    date = json['date'];
    notes = json['notes'];
    service = json['service'];
    productId = json['product_id'];
    shippingAddressId = json['shipping_address_id'];
    billingSameAsShipping = json['billing_same_as_shipping'];
    billingAddressId = json['billing_address_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['vehicle_type'] = this.vehicleType;
    data['vehicle_model'] = this.vehicleModel;
    data['tyre_size'] = this.tyreSize;
    data['time_slot_id'] = this.timeSlotId;
    data['date'] = this.date;
    data['notes'] = this.notes;
    data['service'] = this.service;
    data['product_id'] = this.productId;
    data['shipping_address_id'] = this.shippingAddressId;
    data['billing_same_as_shipping'] = this.billingSameAsShipping;
    data['billing_address_id'] = this.billingAddressId;
    return data;
  }
}
