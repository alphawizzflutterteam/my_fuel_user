class FuelServicesModel {
  bool? status;
  String? message;
  List<FuelServices>? data;
  List<AssetTypeData>? assetTyps;

  FuelServicesModel({this.status, this.message, this.data, this.assetTyps});

  FuelServicesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FuelServices>[];
      json['data'].forEach((v) {
        data!.add(new FuelServices.fromJson(v));
      });
    }
    if (json['services'] != null) {
      assetTyps = <AssetTypeData>[];
      json['services'].forEach((v) {
        assetTyps!.add(new AssetTypeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.assetTyps != null) {
      data['services'] = this.assetTyps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FuelServices {
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
  int? isIndividual;
  int? isBusiness;
  List<Null>? translations;

  FuelServices(
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
      this.isIndividual,
      this.isBusiness,
      this.translations});

  FuelServices.fromJson(Map<String, dynamic> json) {
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
    isIndividual = json['is_individual'];
    isBusiness = json['is_business'];
    /*if (json['translations'] != null) {
      translations = <Null>[];
      json['translations'].forEach((v) {
        translations!.add(new Null.fromJson(v));
      });
    }*/
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
    data['is_individual'] = this.isIndividual;
    data['is_business'] = this.isBusiness;
    /*if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class AssetTypeData {
  String? id;
  String? title;
  String? createdAt;
  String? updatedAt;

  AssetTypeData({this.id, this.title, this.createdAt, this.updatedAt});

  AssetTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
