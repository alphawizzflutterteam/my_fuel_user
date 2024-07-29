class VehicleModel {
  bool? status;
  String? message;
  List<VehicleModelData>? data;

  VehicleModel({this.status, this.message, this.data});

  VehicleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <VehicleModelData>[];
      json['data'].forEach((v) {
        data!.add(new VehicleModelData.fromJson(v));
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
    return data;
  }
}

class VehicleModelData {
  int? id;
  int? vehicleTypeId;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;

  VehicleModelData(
      {this.id,
      this.vehicleTypeId,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt});

  VehicleModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleTypeId = json['vehicle_type_id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vehicle_type_id'] = this.vehicleTypeId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
