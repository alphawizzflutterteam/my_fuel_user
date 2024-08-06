class CheckOutRequest {
  String? categoryId = "";
  String? vehicleType = "";
  String? vehicleModel = "";
  String? tyreSize = "";
  String? fuel_type = "";
  String? service_type = "";
  String? timeSlotId = "";
  String? date = DateTime.now().toString();
  String? notes = "";
  String? service = "";
  String? productId = "";
  String? shippingAddressId = "";
  String? billingSameAsShipping = "";
  String? billingAddressId = "";
  String? payment_method = "";
  String? wallet_used = "";
  String? transaction_id = "";
  String? quantity = "1";

  CheckOutRequest({
    this.categoryId,
    this.vehicleType,
    this.vehicleModel,
    this.tyreSize,
    this.fuel_type,
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
    this.transaction_id,
    this.quantity,
    this.service_type,
  });

  CheckOutRequest.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'] ?? "";
    vehicleType = json['vehicle_type'] ?? "";
    vehicleModel = json['vehicle_model'] ?? "";
    tyreSize = json['tyre_size'] ?? "";
    fuel_type = json['fuel_type'] ?? "";
    timeSlotId = json['time_slot_id'] ?? "";
    service_type = json['service_type'] ?? "";
    date = json['date'] ?? "";
    notes = json['notes'] ?? "";
    service = json['service'] ?? "";
    productId = json['product_id'] ?? "";
    shippingAddressId = json['shipping_address_id'] ?? "";
    billingSameAsShipping = json['billing_same_as_shipping'] ?? "";
    billingAddressId = json['billing_address_id'] ?? "";
    payment_method = json['payment_method'] ?? "";
    wallet_used = json['wallet_used'] ?? "";
    transaction_id = json['transaction_id'] ?? "";
    quantity = json['quantity'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId ?? "";
    data['vehicle_type'] = this.vehicleType ?? "";
    data['vehicle_model'] = this.vehicleModel ?? "";
    data['tyre_size'] = this.tyreSize ?? "";
    data['fuel_type'] = this.fuel_type ?? "";
    data['time_slot_id'] = this.timeSlotId ?? "";
    data['service_type'] = this.service_type ?? "";
    data['date'] = this.date ?? "";
    data['notes'] = this.notes ?? "";
    data['service'] = this.service ?? "";
    data['product_id'] = this.productId;
    data['shipping_address_id'] = this.shippingAddressId ?? "";
    data['billing_same_as_shipping'] = this.billingSameAsShipping ?? "";
    data['billing_address_id'] = this.billingAddressId ?? "";
    data['payment_method'] = this.payment_method ?? "";
    data['wallet_used'] = this.wallet_used ?? "";
    data['transaction_id'] = this.transaction_id ?? "";
    data['quantity'] = this.quantity ?? "";
    return data;
  }
}
