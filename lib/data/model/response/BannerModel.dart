class BannerModel {
  int? id;
  String? photo;
  String? bannerType;
  String? theme;
  int? published;
  String? createdAt;
  String? updatedAt;
  String? url;
  String? resourceType;
  int? resourceId;
  String? title;
  String? subTitle;
  String? buttonText;
  String? backgroundColor;
  String? imagePath;

  BannerModel(
      {this.id,
      this.photo,
      this.bannerType,
      this.theme,
      this.published,
      this.createdAt,
      this.updatedAt,
      this.url,
      this.resourceType,
      this.resourceId,
      this.title,
      this.subTitle,
      this.buttonText,
      this.backgroundColor,
      this.imagePath});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    bannerType = json['banner_type'];
    theme = json['theme'];
    published = json['published'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    url = json['url'];
    resourceType = json['resource_type'];
    resourceId = json['resource_id'];
    title = json['title'].toString();
    subTitle = json['sub_title'].toString();
    buttonText = json['button_text'].toString();
    backgroundColor = json['background_color'].toString();
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['banner_type'] = this.bannerType;
    data['theme'] = this.theme;
    data['published'] = this.published;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    data['resource_type'] = this.resourceType;
    data['resource_id'] = this.resourceId;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['button_text'] = this.buttonText;
    data['background_color'] = this.backgroundColor;
    data['image_path'] = this.imagePath;
    return data;
  }
}
