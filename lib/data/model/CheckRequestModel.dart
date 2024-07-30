class CheckOutRequest {
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
  String? payment_method;
  String? wallet_used;
  String? transaction_id;

  CheckOutRequest(
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
      this.billingAddressId,
      this.payment_method,
      this.wallet_used,
      this.transaction_id});

  CheckOutRequest.fromJson(Map<String, dynamic> json) {
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
    payment_method = json['payment_method'];
    wallet_used = json['wallet_used'];
    transaction_id = json['transaction_id'];
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
    data['payment_method'] = this.payment_method;
    data['wallet_used'] = this.wallet_used;
    data['transaction_id'] = this.transaction_id;
    return data;
  }
}
