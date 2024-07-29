class TimeSlotModel {
  bool? status;
  String? message;
  List<TimeData>? data;

  TimeSlotModel({this.status, this.message, this.data});

  TimeSlotModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TimeData>[];
      json['data'].forEach((v) {
        data!.add(new TimeData.fromJson(v));
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

class TimeData {
  int? id;
  String? title;
  String? fromTime;
  String? toTime;
  int? status;
  String? createdAt;
  String? updatedAt;

  TimeData(
      {this.id,
      this.title,
      this.fromTime,
      this.toTime,
      this.status,
      this.createdAt,
      this.updatedAt});

  TimeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
