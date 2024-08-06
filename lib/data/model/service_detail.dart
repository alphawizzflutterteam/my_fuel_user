class ServiceDetailsModel {
  int? totalSize;
  String? limit;
  String? offset;
  List<Products>? products;

  ServiceDetailsModel({this.totalSize, this.limit, this.offset, this.products});

  ServiceDetailsModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? addedBy;
  int? userId;
  String? name;
  String? slug;
  String? productType;
  List<CategoryIds>? categoryIds;
  int? categoryId;
  String? subCategoryId;
  String? subSubCategoryId;
  int? brandId;
  String? unit;
  int? minQty;
  int? refundable;
  String? digitalProductType;
  String? digitalFileReady;
  List<String>? images;
  bool? selections = false;
  // List<Null>? colorImage;
  String? thumbnail;
  String? featured;
  String? flashDeal;
  String? videoProvider;
  String? videoUrl;
  // List<Null>? colors;
  int? variantProduct;
  // List<Null>? attributes;
  // List<Null>? choiceOptions;
  // List<Null>? variation;
  int? published;
  String? unitPrice;
  String? purchasePrice;
  String? tax;
  String? taxType;
  String? taxModel;
  String? discount;
  String? discountType;
  int? currentStock;
  int? minimumOrderQty;
  String? details;
  int? freeShipping;
  String? attachment;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? featuredStatus;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  int? requestStatus;
  String? deniedNote;
  int? shippingCost;
  int? multiplyQty;
  String? tempShippingCost;
  String? isShippingCostUpdated;
  String? code;
  // List<Null>? colorsFormatted;
  // List<Null>? rating;
  // List<Tags>? tags;
  // List<Null>? translations;
  // List<Null>? reviews;

  Products({
    this.id,
    this.addedBy,
    this.userId,
    this.name,
    this.slug,
    this.productType,
    this.categoryIds,
    this.categoryId,
    this.subCategoryId,
    this.subSubCategoryId,
    this.brandId,
    this.unit,
    this.minQty,
    this.refundable,
    this.digitalProductType,
    this.digitalFileReady,
    this.images,
    // this.colorImage,
    this.thumbnail,
    this.featured,
    this.flashDeal,
    this.videoProvider,
    this.videoUrl,
    this.selections,
    // this.colors,
    this.variantProduct,
    // this.attributes,
    // this.choiceOptions,
    // this.variation,
    this.published,
    this.unitPrice,
    this.purchasePrice,
    this.tax,
    this.taxType,
    this.taxModel,
    this.discount,
    this.discountType,
    this.currentStock,
    this.minimumOrderQty,
    this.details,
    this.freeShipping,
    this.attachment,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.featuredStatus,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.requestStatus,
    this.deniedNote,
    this.shippingCost,
    this.multiplyQty,
    this.tempShippingCost,
    this.isShippingCostUpdated,
    this.code,
    // this.colorsFormatted,
    // this.rating,
    // this.tags,
    // this.translations,
    // this.reviews
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    userId = json['user_id'];
    name = json['name'];
    slug = json['slug'];
    productType = json['product_type'];
    if (json['category_ids'] != null) {
      categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        categoryIds!.add(new CategoryIds.fromJson(v));
      });
    }
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    subSubCategoryId = json['sub_sub_category_id'];
    brandId = json['brand_id'];
    unit = json['unit'];
    minQty = json['min_qty'];
    refundable = json['refundable'];
    digitalProductType = json['digital_product_type'];
    digitalFileReady = json['digital_file_ready'];
    images = json['images'].cast<String>();
    // if (json['color_image'] != null) {
    //   colorImage = <Null>[];
    //   json['color_image'].forEach((v) {
    //     colorImage!.add(new Null.fromJson(v));
    //   });
    // }
    thumbnail = json['thumbnail'];
    featured = json['featured'].toString();
    flashDeal = json['flash_deal'];
    videoProvider = json['video_provider'];
    videoUrl = json['video_url'];
    // if (json['colors'] != null) {
    //   colors = <Null>[];
    //   json['colors'].forEach((v) {
    //     colors!.add(new Null.fromJson(v));
    //   });
    // }
    variantProduct = json['variant_product'];
    // if (json['attributes'] != null) {
    //   attributes = <Null>[];
    //   json['attributes'].forEach((v) {
    //     attributes!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['choice_options'] != null) {
    //   choiceOptions = <Null>[];
    //   json['choice_options'].forEach((v) {
    //     choiceOptions!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['variation'] != null) {
    //   variation = <Null>[];
    //   json['variation'].forEach((v) {
    //     variation!.add(new Null.fromJson(v));
    //   });
    // }
    published = json['published'];
    unitPrice = json['unit_price'].toString();
    purchasePrice = json['purchase_price'].toString();
    tax = json['tax'].toString();
    taxType = json['tax_type'];
    taxModel = json['tax_model'];
    discount = json['discount'].toString();
    discountType = json['discount_type'];
    currentStock = json['current_stock'];
    minimumOrderQty = json['minimum_order_qty'];
    details = json['details'];
    freeShipping = json['free_shipping'];
    attachment = json['attachment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    featuredStatus = json['featured_status'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaImage = json['meta_image'];
    requestStatus = json['request_status'];
    deniedNote = json['denied_note'];
    shippingCost = json['shipping_cost'];
    multiplyQty = json['multiply_qty'];
    tempShippingCost = json['temp_shipping_cost'].toString();
    isShippingCostUpdated = json['is_shipping_cost_updated'].toString();
    code = json['code'];
    // if (json['colors_formatted'] != null) {
    //   colorsFormatted = <Null>[];
    //   json['colors_formatted'].forEach((v) {
    //     colorsFormatted!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['rating'] != null) {
    //   rating = <Null>[];
    //   json['rating'].forEach((v) {
    //     rating!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['tags'] != null) {
    //   tags = <Tags>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(new Tags.fromJson(v));
    //   });
    // }
    // if (json['translations'] != null) {
    //   translations = <Null>[];
    //   json['translations'].forEach((v) {
    //     translations!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['reviews'] != null) {
    //   reviews = <Null>[];
    //   json['reviews'].forEach((v) {
    //     reviews!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['added_by'] = this.addedBy;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['product_type'] = this.productType;
    if (this.categoryIds != null) {
      data['category_ids'] = this.categoryIds!.map((v) => v.toJson()).toList();
    }
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['sub_sub_category_id'] = this.subSubCategoryId;
    data['brand_id'] = this.brandId;
    data['unit'] = this.unit;
    data['min_qty'] = this.minQty;
    data['refundable'] = this.refundable;
    data['digital_product_type'] = this.digitalProductType;
    data['digital_file_ready'] = this.digitalFileReady;
    data['images'] = this.images;
    // if (this.colorImage != null) {
    //   data['color_image'] = this.colorImage!.map((v) => v.toJson()).toList();
    // }
    data['thumbnail'] = this.thumbnail;
    data['featured'] = this.featured;
    data['flash_deal'] = this.flashDeal;
    data['video_provider'] = this.videoProvider;
    data['video_url'] = this.videoUrl;
    // if (this.colors != null) {
    //   data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    // }
    // data['variant_product'] = this.variantProduct;
    // if (this.attributes != null) {
    //   data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    // }
    // if (this.choiceOptions != null) {
    //   data['choice_options'] =
    //       this.choiceOptions!.map((v) => v.toJson()).toList();
    // }
    // if (this.variation != null) {
    //   data['variation'] = this.variation!.map((v) => v.toJson()).toList();
    // }
    data['published'] = this.published;
    data['unit_price'] = this.unitPrice;
    data['purchase_price'] = this.purchasePrice;
    data['tax'] = this.tax;
    data['tax_type'] = this.taxType;
    data['tax_model'] = this.taxModel;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['current_stock'] = this.currentStock;
    data['minimum_order_qty'] = this.minimumOrderQty;
    data['details'] = this.details;
    data['free_shipping'] = this.freeShipping;
    data['attachment'] = this.attachment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['featured_status'] = this.featuredStatus;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_image'] = this.metaImage;
    data['request_status'] = this.requestStatus;
    data['denied_note'] = this.deniedNote;
    data['shipping_cost'] = this.shippingCost;
    data['multiply_qty'] = this.multiplyQty;
    data['temp_shipping_cost'] = this.tempShippingCost;
    data['is_shipping_cost_updated'] = this.isShippingCostUpdated;
    data['code'] = this.code;
    // if (this.colorsFormatted != null) {
    //   data['colors_formatted'] =
    //       this.colorsFormatted!.map((v) => v.toJson()).toList();
    // }
    // if (this.rating != null) {
    //   data['rating'] = this.rating!.map((v) => v.toJson()).toList();
    // }
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
    // if (this.translations != null) {
    //   data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    // }
    // if (this.reviews != null) {
    //   data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class CategoryIds {
  String? id;
  String? position;

  CategoryIds({this.id, this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    return data;
  }
}

class Tags {
  int? id;
  String? tag;
  int? visitCount;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Tags(
      {this.id,
      this.tag,
      this.visitCount,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tag = json['tag'];
    visitCount = json['visit_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tag'] = this.tag;
    data['visit_count'] = this.visitCount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? productId;
  int? tagId;

  Pivot({this.productId, this.tagId});

  Pivot.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    tagId = json['tag_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['tag_id'] = this.tagId;
    return data;
  }
}
