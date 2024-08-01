class NotificationModel {
  int? totalSize;
  int? limit;
  int? offset;
  int? newNotification;
  List<Notification>? notification;

  NotificationModel(
      {this.totalSize,
      this.limit,
      this.offset,
      this.newNotification,
      this.notification});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    newNotification = json['new_notification'];
    if (json['notification'] != null) {
      notification = <Notification>[];
      json['notification'].forEach((v) {
        notification!.add(new Notification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['new_notification'] = this.newNotification;
    if (this.notification != null) {
      data['notification'] = this.notification!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notification {
  int? id;
  String? sentBy;
  String? sentTo;
  String? title;
  String? description;
  int? notificationCount;
  String? image;
  int? status;
  String? userId;
  String? createdAt;
  String? updatedAt;
  String? notificationSeenBy;

  Notification(
      {this.id,
      this.sentBy,
      this.sentTo,
      this.title,
      this.description,
      this.notificationCount,
      this.image,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.notificationSeenBy});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sentBy = json['sent_by'];
    sentTo = json['sent_to'];
    title = json['title'];
    description = json['description'];
    notificationCount = json['notification_count'];
    image = json['image'];
    status = json['status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    notificationSeenBy = json['notification_seen_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sent_by'] = this.sentBy;
    data['sent_to'] = this.sentTo;
    data['title'] = this.title;
    data['description'] = this.description;
    data['notification_count'] = this.notificationCount;
    data['image'] = this.image;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['notification_seen_by'] = this.notificationSeenBy;
    return data;
  }
}
