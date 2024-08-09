class IndustryTypeModel {
  bool? status;
  List<IndustryTypeData>? industryLists;
  String? message;

  IndustryTypeModel({this.status, this.industryLists, this.message});

  IndustryTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['lists'] != null) {
      industryLists = <IndustryTypeData>[];
      json['lists'].forEach((v) {
        industryLists!.add(IndustryTypeData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (industryLists != null) {
      data['lists'] = industryLists!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class IndustryTypeData {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  IndustryTypeData(
      {this.id, this.name, this.status, this.createdAt, this.updatedAt});

  IndustryTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
