class AddressListModel {
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

  AddressListModel(
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

  AddressListModel.fromJson(Map<String, dynamic> json) {
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
