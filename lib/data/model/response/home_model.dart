class HomeServicesModel {
  bool? status;
  String? message;
  Data? data;

  HomeServicesModel({this.status, this.message, this.data});

  HomeServicesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Self>? self;
  List<OtherData>? other;

  Data({this.self, this.other});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <Self>[];
      json['self'].forEach((v) {
        self!.add(new Self.fromJson(v));
      });
    }
    if (json['other'] != null) {
      other = <OtherData>[];
      json['other'].forEach((v) {
        other!.add(new OtherData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.map((v) => v.toJson()).toList();
    }
    if (this.other != null) {
      data['other'] = this.other!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  int? id;
  String? name;
  String? slug;
  String? icon;
  String? parentId;
  String? position;
  String? createdAt;
  String? updatedAt;
  String? homeStatus;
  String? priority;
  String? type;
  // List<Null>? translations;

  Self({
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

  Self.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    parentId = json['parent_id'].toString();
    position = json['position'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    homeStatus = json['home_status'].toString();
    priority = json['priority'].toString();
    type = json['type'].toString();
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

    return data;
  }
}

class OtherData {
  int? id;
  String? name;
  String? slug;
  String? icon;
  String? parentId;
  String? position;
  String? createdAt;
  String? updatedAt;
  String? homeStatus;
  String? priority;
  String? type;
  List<Null>? translations;

  OtherData(
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
      this.translations});

  OtherData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    parentId = json['parent_id'].toString();
    position = json['position'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    homeStatus = json['home_status'].toString();
    priority = json['priority'].toString();
    type = json['type'].toString();
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

    return data;
  }
}
