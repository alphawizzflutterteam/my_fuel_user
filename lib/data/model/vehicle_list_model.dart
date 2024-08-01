class VehicleListModel {
  bool? status;
  String? message;
  List<VehicleList>? data;

  VehicleListModel({this.status, this.message, this.data});

  VehicleListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <VehicleList>[];
      json['data'].forEach((v) {
        data!.add(VehicleList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VehicleList {
  int? id;
  int? vehicleTypeId;
  int? vehicleModelId;
  int? categoryId;
  String? name;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  VehicleList(
      {this.id,
      this.vehicleTypeId,
      this.vehicleModelId,
      this.categoryId,
      this.name,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  VehicleList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleTypeId = json['vehicle_type_id'];
    vehicleModelId = json['vehicle_model_id'];
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vehicle_type_id'] = vehicleTypeId;
    data['vehicle_model_id'] = vehicleModelId;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
